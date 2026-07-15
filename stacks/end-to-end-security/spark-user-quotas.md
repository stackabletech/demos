# Spark user quotas via per-user / per-team namespaces

## Problem

When running Spark jobs via the SparkApplication CRD, submitted from Airflow, we can
precisely define the requested resources a job may use.
However, notebook users submit Spark jobs in **client mode**: the driver runs inside the
notebook pod and executors are spawned as raw pods in `spark.kubernetes.namespace`
(currently hardcoded to `default` in `query-exchange-rates.ipynb`). Nothing bounds
the executors - a user can set `spark.executor.instances=100` with large per-executor
CPU/memory and swamp the cluster.

The notebook `profileList` in `jupyterhub.yaml` only caps the **driver** (notebook
pod), not executors, so it does not solve this.

## Current state

- Central JupyterHub; all single-user pods spawn in `default` under the `spark` SA.
- **Every user shares one Kerberos principal**
  `spark/spark.default.svc.cluster.local@KNAB.COM`. HDFS OPA
  (`hdfs-regorules.yaml`) grants exactly that principal. The OIDC identity stops at
  the hub and never reaches HDFS - everyone is `spark`.
- The persona user set is fixed and small: `daniel.king`, `isla.williams`,
  `justin.martin`, `mark.ketting`, `pamela.scott`, `sophia.clarke`, `william.lewis`
  (admin: `isla.williams`).

## Design: one static namespace per user / team

We can utilize Kubernetes concepts to limit resource consumption by user-owned Spark
jobs. Each entity (either users or teams) get a dedicated namespace with its own
serviceaccount, Kerberos principal, ResourceQuota and LimitRange. We then limit the
serviceaccount to only start Spark resources in that namespace, limiting how many
resources a single user or team can consume. In this setup, JupyterHub can either run
centrally and deploy notebook pods into the respective namespaces or each namespace
runs its own JupyterHub instance.

[Resource quotas](https://kubernetes.io/docs/concepts/policy/resource-quotas/) allow
cluster administrators to limit how much CPU and memory can be requested within a given
namespace, while [limit ranges](https://kubernetes.io/docs/concepts/policy/limit-range/)
can set an upper limit of CPU and memory for each pod / container, so that a single user
cannot consume the entire resources of a team. The two work together: a ResourceQuota on
`requests.*` rejects any pod that does not declare requests, and client-mode executors
only carry requests if the user sets them explicitly. The LimitRange's default
requests/limits fill that gap, so well-behaved jobs are admitted rather than rejected.
The individual Kerberos principals allow us to limit access to e.g. HDFS for individuals
or teams via OPA rules.

Note that in client mode the quota only bounds the **executors** in the per-user
namespace - the driver *is* the notebook pod in JupyterHub's namespace and stays bounded
by the `profileList` instead, so a job is capped at two enforcement points.

This works well for a limited number of users / teams, but for larger organizations the
namespace overhead can become an issue.

