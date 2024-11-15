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

# Warn if the branch isn't a `release-*` branch (these changes shouldn't be in a branch that gets merged to main)
if [[ "$CURRENT_BRANCH" == release-* ]]; then
  STACKABLE_RELEASE="${CURRENT_BRANCH#release-}"
  echo "Updating stackableRelease to $STACKABLE_RELEASE"
  sed -i -E "s/(stackableRelease:\s+)(\S+)/\1${STACKABLE_RELEASE}/" stacks/stacks-v2.yaml
else
  >&2 echo "WARNING: doesn't look like a release branch. Will not update stackableRelease versions in stacks."
fi

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
