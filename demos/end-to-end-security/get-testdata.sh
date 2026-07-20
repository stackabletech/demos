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
# GMS enforces Metadata Service Authentication, so every request carries an
# HTTP Basic header for the DataHub system user (see AUTH_HEADER below).
#
# Run this after `stackablectl demo install end-to-end-security` has completed
# AND the datahub-ingest-trino Job has finished.
#
# Prerequisite: a port-forward to GMS must be running in another terminal, e.g.
#   kubectl port-forward svc/datahub-datahub-gms 8080:8080
#
# Usage:
#   ./get-testdata.sh
#
# Optional env overrides:
#   GMS=http://localhost:8080                                  # GMS base URL
#   DATAHUB_SYSTEM_CLIENT_ID=__datahub_system                  # system client id
#   DATAHUB_SYSTEM_CLIENT_SECRET=datahub-demo-system-secret    # system secret
#
# Requires: curl, jq

set -euo pipefail

# GMS base URL. Reach it via a port-forward (see the header comment); nothing in
# this script talks to Kubernetes directly.
GMS="${GMS:-http://localhost:8080}"

# System-user credentials. These are the fixed dev values from the demo's
# datahub-auth-secrets Secret; override via env if you changed them.
SYSTEM_CLIENT_ID="${DATAHUB_SYSTEM_CLIENT_ID:-__datahub_system}"
SYSTEM_CLIENT_SECRET="${DATAHUB_SYSTEM_CLIENT_SECRET:-datahub-demo-system-secret}"

# DataHub's system authenticator strips the leading "Basic " and compares the
# rest VERBATIM against "<id>:<secret>". It is NOT standard base64 Basic auth —
# do not base64-encode this value.
AUTH_HEADER="Authorization: Basic ${SYSTEM_CLIENT_ID}:${SYSTEM_CLIENT_SECRET}"

# --- helpers ---------------------------------------------------------------

# URL-encode a string. URNs contain ':' ',' '(' ')' which must be escaped
# before they can go into a REST path.
urlencode() { jq -rn --arg s "$1" '$s|@uri'; }

# GET a GMS REST path. DataHub occasionally emits raw control characters inside
# free-text aspects (e.g. column descriptions), which is invalid JSON; strip
# them so jq can parse the response.
gms_get() {
  curl -sS -H "$AUTH_HEADER" "${GMS}/$1" | tr -d '\000-\037'
}

# Search all entity URNs of a given type (dataset, container, ...), sorted.
gms_search_urns() {
  curl -sS -H "$AUTH_HEADER" \
    -H 'Content-Type: application/json' \
    -X POST "${GMS}/entities?action=search" \
    -d "{\"input\":\"*\",\"entity\":\"$1\",\"start\":0,\"count\":1000}" \
    | tr -d '\000-\037' \
    | jq -r '.value.entities[].entity' \
    | sort
}

# Fail early with an actionable message if GMS is unreachable or rejects auth,
# instead of letting jq choke on an error body further down.
preflight() {
  local code
  code="$(curl -sS -o /dev/null -w '%{http_code}' \
    -H "$AUTH_HEADER" -H 'Content-Type: application/json' \
    -X POST "${GMS}/entities?action=search" \
    -d '{"input":"*","entity":"dataset","start":0,"count":1}' 2>/dev/null || echo 000)"
  case "$code" in
    200) : ;;
    000) echo "ERROR: cannot reach GMS at ${GMS}. Is your port-forward running?" >&2
         echo "       e.g.  kubectl port-forward svc/datahub-datahub-gms 8080:8080" >&2
         exit 1 ;;
    401|403) echo "ERROR: GMS rejected authentication (HTTP ${code})." >&2
         echo "       Check DATAHUB_SYSTEM_CLIENT_ID / DATAHUB_SYSTEM_CLIENT_SECRET." >&2
         exit 1 ;;
    *)   echo "ERROR: unexpected HTTP ${code} from GMS at ${GMS}." >&2
         exit 1 ;;
  esac
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

preflight

# echo "== querying GMS ($GMS) =="
# echo

# echo "== datasets (Trino tables/views) =="
# echo
# while read -r urn; do
#   [[ -z "$urn" ]] && continue
#   describe_entity "$urn"
# done < <(gms_search_urns dataset)

# echo "== containers (Trino catalogs/schemas) =="
# echo
# while read -r urn; do
#   [[ -z "$urn" ]] && continue
#   describe_entity "$urn"
# done < <(gms_search_urns container)

# # TEMP testing
# describe_entity "urn:li:dataset:(urn:li:dataPlatform:trino,lakehouse.customer_analytics.customer,PROD)"
# describe_entity "urn:li:dataPlatform:trino,lakehouse.employees.employees"
# describe_entity "urn:li:container:c8531e5a52cacf56768d0bf77ca8787c"

# gms_get "entitiesV2/$(urlencode "urn:li:corpuser:pamela.scott@knab.com")" | jq
# gms_get "entitiesV2/$(urlencode "urn:li:corpuser:daniel.king@knab.com")" | jq
# gms_get "entitiesV2/$(urlencode "urn:li:corpGroup:7ade3124-8608-4216-84ec-570cde11b2cc")" | jq
# gms_get "entitiesV2/$(urlencode "urn:li:container:c8531e5a52cacf56768d0bf77ca8787c")" | jq
# gms_get "entitiesV2/$(urlencode "urn:li:corpuser:datahub")" | jq
gms_get "entitiesV2/$(urlencode "urn:li:chart:(superset,1)")" | jq
