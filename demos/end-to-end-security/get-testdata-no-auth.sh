#!/usr/bin/env bash
# Print the entities that the e2e-security demo registers in DataHub, together
# with the data owners and tags attached to each one.
#
# We query two entity types:
#   * dataset   — the Trino tables/views ingested by the datahub-ingest-trino Job
#   * container — the Trino catalogs/schemas. Ownership in this demo is set at
#                 the *schema* level, and DataHub models a schema as a
#                 `container` entity, so the owners live here (not on datasets).
#
# Owner URNs (corpGroup/corpuser) are resolved to their display names, e.g. the
# corpGroup GUID becomes the "Customer Analytics" group.
#
# Run this after `stackablectl demo install end-to-end-security` has completed
# AND the datahub-ingest-trino Job has finished.
#
# Usage:
#   ./get-testdata.sh               # defaults to $KUBECONFIG or ~/.kube/config
#   KUBECONFIG=/path/to/kc ./get-testdata.sh
#
# Requires: kubectl, jq

set -euo pipefail

GMS_POD="$(kubectl get pod -l app.kubernetes.io/name=datahub-gms -o jsonpath='{.items[0].metadata.name}' 2>/dev/null || true)"
if [[ -z "${GMS_POD}" ]]; then
  GMS_POD="$(kubectl get pod -o name 2>/dev/null | grep datahub-gms | head -1 | sed 's|pod/||')"
fi
if [[ -z "${GMS_POD}" ]]; then
  echo "ERROR: no datahub-gms pod found. Is the demo installed and healthy?" >&2
  exit 1
fi

# --- helpers ---------------------------------------------------------------

# URL-encode a string. URNs contain ':' ',' '(' ')' which must be escaped
# before they can go into a REST path.
urlencode() { jq -rn --arg s "$1" '$s|@uri'; }

# GET a GMS REST path from inside the pod. DataHub occasionally emits raw
# control characters inside free-text aspects (e.g. column descriptions),
# which is invalid JSON; strip them so jq can parse the response.
gms_get() {
  kubectl exec "${GMS_POD}" -- curl -sS "http://localhost:8080/$1" | tr -d '\000-\037'
}

# Search all entity URNs of a given type (dataset, container, ...), sorted.
gms_search_urns() {
  kubectl exec "${GMS_POD}" -- curl -sS \
    -H 'Content-Type: application/json' \
    -X POST 'http://localhost:8080/entities?action=search' \
    -d "{\"input\":\"*\",\"entity\":\"$1\",\"start\":0,\"count\":1000}" \
    | tr -d '\000-\037' \
    | jq -r '.value.entities[].entity' \
    | sort
}

# Resolve a corpGroup/corpuser owner URN to a human-readable name, caching the
# result in OWNER_NAME_CACHE. Writes the answer to RESOLVED_OWNER_NAME (using a
# global instead of command substitution so the cache survives across calls).
declare -A OWNER_NAME_CACHE
RESOLVED_OWNER_NAME=""
resolve_owner_name() {
  local urn="$1"
  if [[ -n "${OWNER_NAME_CACHE[$urn]+set}" ]]; then
    RESOLVED_OWNER_NAME="${OWNER_NAME_CACHE[$urn]}"
    return
  fi
  local json name
  json="$(gms_get "entitiesV2/$(urlencode "$urn")")"
  name="$(printf '%s' "$json" | jq -r '
    .aspects.corpGroupInfo.value.displayName
    // .aspects.corpUserEditableInfo.value.displayName
    // .aspects.corpUserInfo.value.displayName
    // .aspects.corpUserKey.value.username
    // empty')"
  # Fall back to the raw id (last URN segment) if no display name is set.
  [[ -z "$name" ]] && name="${urn##*:}"
  OWNER_NAME_CACHE[$urn]="$name"
  RESOLVED_OWNER_NAME="$name"
}

# Turn an ownership type into a short suffix, e.g.
#   urn:li:ownershipType:__system__business_owner -> " (business_owner)"
# The legacy enum type is often "NONE" when a typeUrn is set, so we suppress it.
fmt_owner_type() {
  case "$1" in
    ""|NONE)                           : ;;
    urn:li:ownershipType:__system__*)  printf ' (%s)' "${1#urn:li:ownershipType:__system__}" ;;
    urn:li:ownershipType:*)            printf ' (%s)' "${1#urn:li:ownershipType:}" ;;
    *)                                 printf ' (%s)' "$1" ;;
  esac
}

# Print one entity: its URN, (readable name if not already in the URN), tags
# and owners.
describe_entity() {
  local urn="$1" json name tags
  json="$(gms_get "entitiesV2/$(urlencode "$urn")")"

  name="$(printf '%s' "$json" | jq -r '
    .aspects.containerProperties.value.name
    // .aspects.datasetProperties.value.name
    // .aspects.datasetKey.value.name
    // empty')"
  tags="$(printf '%s' "$json" | jq -r '
    (.aspects.globalTags.value.tags // [])
    | map(.tag | sub("^urn:li:tag:"; "")) | join(", ")')"

  echo "$urn"
  # The dataset URN already spells out the name; only print it when it adds
  # information (e.g. containers, whose URN is an opaque GUID).
  if [[ -n "$name" && "$urn" != *"$name"* ]]; then
    printf '    name:   %s\n' "$name"
  fi
  printf '    tags:   %s\n' "${tags:--}"

  # Owners need a per-owner lookup to turn URNs into names, so build the line
  # in bash. Reading via process substitution (not a pipe) keeps the owner-name
  # cache updates in the current shell.
  local owners_line="" owner_urn owner_type
  while IFS=$'\t' read -r owner_urn owner_type; do
    [[ -z "$owner_urn" ]] && continue
    resolve_owner_name "$owner_urn"
    owners_line="${owners_line:+$owners_line, }${RESOLVED_OWNER_NAME}$(fmt_owner_type "$owner_type")"
  done < <(printf '%s' "$json" | jq -r '
    (.aspects.ownership.value.owners // [])[]
    | "\(.owner)\t\(.typeUrn // .type // "")"')
  printf '    owners: %s\n' "${owners_line:--}"
  echo
}

# --- main ------------------------------------------------------------------

echo "== querying GMS ($GMS_POD) =="
echo

echo "== datasets (Trino tables/views) =="
echo
while read -r urn; do
  [[ -z "$urn" ]] && continue
  describe_entity "$urn"
done < <(gms_search_urns dataset)

echo "== containers (Trino catalogs/schemas) =="
echo
while read -r urn; do
  [[ -z "$urn" ]] && continue
  describe_entity "$urn"
done < <(gms_search_urns container)
