#!/usr/bin/env bash
# Print the dataset URNs that the e2e-security demo's Trino ingestion job
# posts into DataHub. Run this after `stackablectl demo install end-to-end-security`
# has completed AND the datahub-ingest-trino Job has finished.
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

echo "== querying GMS ($GMS_POD) for dataset URNs =="
echo

kubectl exec "${GMS_POD}" -- curl -sS \
  -H 'Content-Type: application/json' \
  -X POST 'http://localhost:8080/entities?action=search' \
  -d '{"input":"*","entity":"dataset","start":0,"count":100}' \
  | jq -r '.value.entities[].entity' \
  | sort
