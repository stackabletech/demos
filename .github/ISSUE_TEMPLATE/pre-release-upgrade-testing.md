---
name: Pre-Release Demo and Upgrade Testing
about: |
  This template can be used to track the upgrade testing of demos from stable to
  nightly and nightly from scratch leading up to the next Stackable release.
title: "chore(tracking): Test demos on nightly versions for YY.M.X"
labels: ['epic']
assignees: ''
---

<!--
    Make sure to update the link in 'stackabletech/issues/.github/ISSUE_TEMPLATE/release.md' when
    you change the filename.
-->

<!--
    DO NOT REMOVE THIS COMMENT. It is intended for people who might copy/paste from the previous release issue.
    This was created by an issue template: https://github.com/stackabletech/demos/issues/new/choose.
-->

## Pre-Release Demo Testing on Nightly

Part of <https://github.com/stackabletech/issues/issues/TRACKING_ISSUE>

This is testing:

1. That upgrades from the _stable_ release to the _nightly_ release of the operators and products do
   not negatively impact the products.
2. That _nightly_ demos work as documented from scratch.

> [!NOTE]
> Record any issues or anomalies during the process in a comment on this issue.
> Eg:
>
> ```plain
> :green_circle: **airflow-scheduled-job**
>
> The CRD had been updated and I needed to change the following in the manifest:
> ...
> ```

Replace the items in the task lists below with the applicable Pull Requests (if any).

<!--
    The following list was generated by:

    # go to the demos repository, then run:
    yq '.demos | keys' demos/demos-v2.yaml \
    | sed -e 's/- //g' \
    | sort \
    | xargs -I {} echo "- [ ] [{}](https://docs.stackable.tech/home/nightly/demos/{})"
-->

```[tasklist]
### Testing Demos on Nightly
- [ ] [airflow-scheduled-job](https://docs.stackable.tech/home/nightly/demos/airflow-scheduled-job)
- [ ] [data-lakehouse-iceberg-trino-spark](https://docs.stackable.tech/home/nightly/demos/data-lakehouse-iceberg-trino-spark)
- [ ] [end-to-end-security](https://docs.stackable.tech/home/nightly/demos/end-to-end-security)
- [ ] [hbase-hdfs-load-cycling-data](https://docs.stackable.tech/home/nightly/demos/hbase-hdfs-load-cycling-data)
- [ ] [jupyterhub-keycloak](https://docs.stackable.tech/home/nightly/demos/jupyterhub-keycloak)
- [ ] [jupyterhub-pyspark-hdfs-anomaly-detection-taxi-data](https://docs.stackable.tech/home/nightly/demos/jupyterhub-pyspark-hdfs-anomaly-detection-taxi-data)
- [ ] [logging](https://docs.stackable.tech/home/nightly/demos/logging)
- [ ] [nifi-kafka-druid-earthquake-data](https://docs.stackable.tech/home/nightly/demos/nifi-kafka-druid-earthquake-data)
- [ ] [nifi-kafka-druid-water-level-data](https://docs.stackable.tech/home/nightly/demos/nifi-kafka-druid-water-level-data)
- [ ] [signal-processing](https://docs.stackable.tech/home/nightly/demos/signal-processing)
- [ ] [spark-k8s-anomaly-detection-taxi-data](https://docs.stackable.tech/home/nightly/demos/spark-k8s-anomaly-detection-taxi-data)
- [ ] [trino-iceberg](https://docs.stackable.tech/home/nightly/demos/trino-iceberg)
- [ ] [trino-taxi-data](https://docs.stackable.tech/home/nightly/demos/trino-taxi-data)
```

### Stable to Nightly Upgrade Testing Instructions

These instructions are for deploying and completing the stable demo, and then
upgading operators, CRDs, and products to the nightly versions well as upgrading
the operators and CRDS.

<!--
    Make sure to update the version mentioned below when creating the issue.
-->

> [!TIP]
> Be sure to select the _stable_ docs version on <https://docs.stackable.tech/home/stable/demos/>.

```shell
# Install demo (stable operators) for the stable release (YY.M).
# Until https://github.com/stackabletech/stackable-cockpit/issues/310 is merged,
# this will need to be done by pointing stackablectl to local files checked out
# from the stable release branch.
git checkout release-YY.M
git pull
stackablectl --stack-file=stacks/stacks-v2.yaml --demo-file=demos/demos-v2.yaml demo install <DEMO_NAME>

# --- IMPORTANT ---
# Run through the stable demo instructions (refer to the tasklist above).

# Get a list of installed operators
stackablectl operator installed --output=plain

# --- OPTIONAL ---
# Sometimes it is necessary to upgrade Helm charts. Look for other Helm Charts
# which might need updating.

# First, see which charts are installed. You can ignore the stackable-operator
# charts, or anything that might have been installed outside of this demo.
helm list

# Next, add the applicable Helm Chart repositories. For example:
helm repo add minio https://charts.min.io/
helm repo add bitnami https://charts.bitnami.com/bitnami

# Finally, upgrade the Charts to what is defined in `main`.
# For example:
helm upgrade minio minio/minio --version x.x.x
helm upgrade postgresql-hive bitnami/postgresql --version x.x.x
# --- OPTIONAL END ---

# Uninstall operators for the stable release (YY.M)
stackablectl release uninstall YY.M

# Update CRDs to nightly version (on main)
# Repeat this for every operator used by the demo (use the list from the earlier step before deleting the operators)
kubectl replace -f https://raw.githubusercontent.com/stackabletech/commons-operator/main/deploy/helm/commons-operator/crds/crds.yaml
kubectl replace -f https://raw.githubusercontent.com/stackabletech/...-operator/main/deploy/helm/...-operator/crds/crds.yaml

# Install nightly version of operators (use the list from the earlier step before deleting the operators)
stackablectl operator install commons ...

# Optionally update the product versions in the CRDs (to the latest non-experimental version for the new release), e.g.:
kubectl patch hbaseclusters/hbase --type='json' -p='[{"op": "replace", "path": "/spec/image/productVersion", "value":"x.x.x"}]' # changed
```

### Nightly from Scratch Testing Instructions

These instructions are for deploying and completing the nightly demo from scratch.

<!--
    Make sure to update the version mentioned below when creating the issue.
-->

> [!TIP]
> Be sure to select the _nightly_ docs version on <https://docs.stackable.tech/home/nightly/demos/>.

```shell
# Install demo (stable operators) for the nightly release.
# Until https://github.com/stackabletech/stackable-cockpit/issues/310 is merged,
# this will need to be done by pointing stackablectl to local files checked out
# from the main branch.
git checkout main
git pull
stackablectl --stack-file=stacks/stacks-v2.yaml --demo-file=demos/demos-v2.yaml demo install <DEMO_NAME>

# --- IMPORTANT ---
# Run through the nightly demo instructions (refer to the tasklist above).
```
