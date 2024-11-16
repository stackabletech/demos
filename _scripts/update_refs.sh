#!/usr/bin/env bash
set -euo pipefail

# This script is used by the stackable-utils release script to update the demos
# repository branch references as well as the stackableRelease versions so that
# demos are properly versioned.

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

if [[ "$CURRENT_BRANCH" == release-* ]]; then
  STACKABLE_RELEASE="${CURRENT_BRANCH#release-}"
  echo "Updating stackableRelease to $STACKABLE_RELEASE"
  sed -i -E "s/(stackableRelease:\s+)(\S+)/\1${STACKABLE_RELEASE}/" stacks/stacks-v2.yaml

  # TODO (@NickLarsenNZ): Replace 0.0.0-dev refs with ${STACKABLE_RELEASE}.0
  # handle patches later, and what about release-candidates?
  SEARCH='stackable(0\.0\.0-dev|24\.7\.\d+)' # TODO (@NickLarsenNZ): After https://github.com/stackabletech/stackable-cockpit/issues/310, only search for 0.0.0-dev
  REPLACEMENT="stackable${STACKABLE_RELEASE}.0" # TODO (@NickLarsenNZ): Be a bit smarter about patch releases.
  echo "Updating image references. Searching for $SEARCH, replacing with $REPLACEMENT"
  find demos stacks -type f \
    -exec sed -i -E "s/${SEARCH}/${REPLACEMENT}/" {} \;

  # Look for remaining references
  echo "Checking files with older stackable release references which will be assumed to be intentional."
  grep --color=always -ronE "stackable24\.3(\.[0-9]+)"
else
  >&2 echo "WARNING: doesn't look like a release branch. Will not update stackableRelease versions in stacks."
fi

echo
echo "Replacing githubusercontent references main->${CURRENT_BRANCH}"
# Search for githubusercontent urls and replace the branch reference with a placeholder variable
# This is done just in case the branch has special regex characters (like `/`).
# shellcheck disable=SC2016 # We intentionally don't want to expand the variable.
find demos stacks -type f \
  -exec grep -l githubusercontent {} \; \
  -exec sed -i -E 's/(stackabletech\/demos)\/main\//\1\/\${UPDATE_BRANCH_REF}\//' {} \;

# Now, for all modified files, we can use envsubst
export UPDATE_BRANCH_REF="$CURRENT_BRANCH"
for MODIFIED_FILE in $(git diff --name-only); do
  # shellcheck disable=SC2016 # We intentionally don't want to expand the variable.
  envsubst '$UPDATE_BRANCH_REF' < "$MODIFIED_FILE" > "$MODIFIED_FILE.replacements"
  mv "$MODIFIED_FILE.replacements" "$MODIFIED_FILE"
done
