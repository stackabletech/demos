# Spark user quotas via per-user namespaces

Design notes for adding per-user resource quotas to the JupyterHub + Spark setup in
the `end-to-end-security` stack, and for extending the demo's identity thread
(Keycloak → Kerberos → OPA) into the compute/storage layer.

## Problem

Notebook users submit Spark jobs in **client mode**: the driver runs inside the
notebook pod and executors are spawned as raw pods in `spark.kubernetes.namespace`
(currently hardcoded to `default` in `query-exchange-rates.ipynb`). Nothing bounds
the executors — a user can set `spark.executor.instances=100` with large per-executor
CPU/memory and swamp the cluster.

The notebook `profileList` in `jupyterhub.yaml` only caps the **driver** (notebook
pod), not executors, so it does not solve this.

## Current state

- Central JupyterHub; all single-user pods spawn in `default` under the `spark` SA.
- **Every user shares one Kerberos principal**
  `spark/spark.default.svc.cluster.local@KNAB.COM`. HDFS OPA
  (`hdfs-regorules.yaml`) grants exactly that principal. The OIDC identity stops at
  the hub and never reaches HDFS — everyone is `spark`.
- The persona user set is fixed and small: `daniel.king`, `isla.williams`,
  `justin.martin`, `mark.ketting`, `pamela.scott`, `sophia.clarke`, `william.lewis`
  (admin: `isla.williams`).

## Design: one static namespace per persona

Because the user set is fixed, we pre-declare everything in the stack rather than
giving the hub cluster-wide power to mint namespaces. Each persona gets a namespace
`jupyter-<username>` (e.g. `jupyter-isla.williams`) that ships, declared in the stack:

- `ServiceAccount spark` + namespace-scoped `Role`/`RoleBinding` with the
  spark-on-k8s scheduler permissions (`pods`, `services`, `configmaps`:
  `create/get/list/watch/delete`).
- A copy of the `hdfs` discovery `ConfigMap` (pods can only mount ConfigMaps from
  their own namespace; the content is FQDN-based and namespace-portable).
- A `ResourceQuota` + `LimitRange` (see below).
- A `RoleBinding` granting the **hub SA** rights to spawn pods/services/PVCs *in that
  namespace only* — no cluster-wide grant, which keeps the "boundaries hold" story
  intact.

Distinct namespaces yield **distinct Kerberos principals**
(`spark/spark.jupyter-<username>.svc.cluster.local@KNAB.COM`), so the demo's identity
thread finally spans ingestion → compute → storage.

