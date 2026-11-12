#!/usr/bin/env bash
set -euo pipefail

# This script is used by the stackable-utils release script to update the demos
# repository branch references as well as the stackableRelease versions so that
# demos are properly versioned.

# Parse args:
# $1 if `commit` is specified as the first argument, then changes will be staged and committed.
COMMIT="${1:-false}"
COMMIT="${COMMIT/commit/true}"

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Ensure we are not on the `main` branch.
if [[ "$CURRENT_BRANCH" == "main" ]]; then
  >&2 echo "Will not replace github references for the main branch. Exiting."
  exit 1
fi

# Ensure the index is clean
if ! git diff-index --quiet HEAD --; then
  >&2 echo "Dirty git index. Check working tree or staged changes. Exiting."
  exit 2
fi

# prepend a string to each line of stdout
function prepend {
  while read -r line; do
    echo -e "${1}${line}"
  done
}

# stage and commit based on a message
function maybe_commit {
  [ "$COMMIT" == "true" ] || return 0
  local MESSAGE="$1"
  PATCH=$(mktemp --suffix=.diff)
  git add -u
  git diff --staged > "$PATCH"
  git diff-index --quiet HEAD -- || git commit -S -m "$MESSAGE" --no-verify
  echo "patch written to: $PATCH" | prepend "\t"
}

if [[ "$CURRENT_BRANCH" == release-* ]]; then
  STACKABLE_RELEASE="${CURRENT_BRANCH#release-}"
  MESSAGE="Update stackableRelease to $STACKABLE_RELEASE"
  echo "$MESSAGE"
  # NOTE (@NickLarsenNZ): find is not required for such a trivial case, but it is done for consistency
  find stacks/stacks-v2.yaml \
    -exec grep --color=always -l stackableRelease {} \; \
    -exec sed -i -E "s#(stackableRelease:\s+)(\S+)#\1${STACKABLE_RELEASE}#" {} \; \
  | prepend "\t"
  maybe_commit "chore(release): $MESSAGE"

  # Replace 0.0.0-dev refs with ${STACKABLE_RELEASE}.0
  # TODO (@NickLarsenNZ): handle patches later, and what about release-candidates?
  SEARCH='stackable(0\.0\.0-dev)'
  REPLACEMENT="stackable${STACKABLE_RELEASE}.0" # TODO (@NickLarsenNZ): Be a bit smarter about patch releases.
  MESSAGE="Update image references with $REPLACEMENT"
  echo "$MESSAGE"
  find demos stacks -type f \
    -exec grep --color=always -lE "$SEARCH" {} \; \
    -exec sed -i -E "s#${SEARCH}#${REPLACEMENT}#" {} \; \
  | prepend "\t"
  maybe_commit "chore(release): $MESSAGE"

  # Replace 0.0.0-dev on lines marked `# release-ref: version`. These are
  # versions that don't follow the `stackable0.0.0-dev` image tag pattern above,
  # e.g. the operator version Argo CD installs in the argo-cd-git-ops stack.
  MESSAGE="Update marked release versions to ${STACKABLE_RELEASE}.0"
  echo "$MESSAGE"
  find demos stacks -type f \
    -exec grep --color=always -lE '0\.0\.0-dev\s+# release-ref: version' {} \; \
    -exec sed -i -E "s#0\.0\.0-dev(\s+\# release-ref: version)#${STACKABLE_RELEASE}.0\1#" {} \; \
  | prepend "\t"
  maybe_commit "chore(release): $MESSAGE"

  # Look for remaining references
  echo "Checking files with older stackable release references which will be assumed to be intentional."
  grep --color=always -ronE "stackable24\.3(\.[0-9]+)" | prepend "\t"
  echo
else
  >&2 echo "WARNING: doesn't look like a release branch. Will not update stackableRelease versions in stacks and image references."
fi

MESSAGE="Replace main branch references with ${CURRENT_BRANCH}"
echo "$MESSAGE"
# Search for githubusercontent urls and replace the branch reference with a placeholder variable
# This is done just in case the branch has special regex characters (like `/`).
# shellcheck disable=SC2016 # We intentionally don't want to expand the variable.
find demos stacks -type f \
  -exec grep --color=always -l githubusercontent {} \; \
  -exec sed -i -E 's#(stackabletech/demos)/(refs/heads/)?main/#\1/\${UPDATE_BRANCH_REF}/#' {} \; \
| prepend "\t"

# Same for git refs that are not githubusercontent URLs, e.g. branches Argo CD
# or git-sync pull from at runtime. These lines are marked `# release-ref: branch`.
# shellcheck disable=SC2016 # We intentionally don't want to expand the variable.
find demos stacks -type f \
  -exec grep --color=always -lE 'main\s+# release-ref: branch' {} \; \
  -exec sed -i -E 's#main(\s+\# release-ref: branch)#${UPDATE_BRANCH_REF}\1#' {} \; \
| prepend "\t"

# Now, for all modified files, we can use envsubst
export UPDATE_BRANCH_REF="$CURRENT_BRANCH"
for MODIFIED_FILE in $(git diff --name-only); do
  # shellcheck disable=SC2016 # We intentionally don't want to expand the variable.
  envsubst '$UPDATE_BRANCH_REF' < "$MODIFIED_FILE" > "$MODIFIED_FILE.replacements"
  mv "$MODIFIED_FILE.replacements" "$MODIFIED_FILE"
done
maybe_commit "chore(release): $MESSAGE"

# A marked line that still points at main or 0.0.0-dev would leave a release
# depending on main at runtime, so treat it as an error.
if [[ "$CURRENT_BRANCH" == release-* ]]; then
  if grep -rnE '(main|0\.0\.0-dev)\s+# release-ref:' demos stacks; then
    >&2 echo "The lines above are marked as release references but were not updated. Exiting."
    exit 3
  fi
fi
