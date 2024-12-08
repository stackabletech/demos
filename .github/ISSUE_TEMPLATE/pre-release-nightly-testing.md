---
name: Pre-Release Demo Upgrade Testing from Stable to Nightly
about: |
    This template can be used to track the upgrade testing of demos from stable to nightly leading
    up to the next Stackable release
title: "chore(tracking): Test demos on nightly versions for XX.(X)X"
labels: ['epic']
assignees: ''
---

<!--
    Make sure to update the link in '.github/ISSUE_TEMPLATE/release.md' when
    you change the filename.
-->

<!--
    DO NOT REMOVE THIS COMMENT. It is intended for people who might copy/paste from the previous release issue.
    This was created by an issue template: https://github.com/stackabletech/issues/issues/new/choose.
-->

## Pre-Release Demo Testing on Nightly

Part of <https://github.com/stackabletech/issues/issues/TRACKING_ISSUE>

This is testing:

1. The demos documented in nightly (with the updated product versions) still work.
2. That the operators can be upgraded from the current release to the nightly release and do not
   negatively impact the products.

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
- [ ] [jupyterhub-pyspark-hdfs-anomaly-detection-taxi-data](https://docs.stackable.tech/home/nightly/demos/jupyterhub-pyspark-hdfs-anomaly-detection-taxi-data)
- [ ] [logging](https://docs.stackable.tech/home/nightly/demos/logging)
- [ ] [nifi-kafka-druid-earthquake-data](https://docs.stackable.tech/home/nightly/demos/nifi-kafka-druid-earthquake-data)
- [ ] [nifi-kafka-druid-water-level-data](https://docs.stackable.tech/home/nightly/demos/nifi-kafka-druid-water-level-data)
- [ ] [signal-processing](https://docs.stackable.tech/home/nightly/demos/signal-processing)
- [ ] [spark-k8s-anomaly-detection-taxi-data](https://docs.stackable.tech/home/nightly/demos/spark-k8s-anomaly-detection-taxi-data)
- [ ] [trino-iceberg](https://docs.stackable.tech/home/nightly/demos/trino-iceberg)
- [ ] [trino-taxi-data](https://docs.stackable.tech/home/nightly/demos/trino-taxi-data)
```

### Testing Instructions

These instructions are for deploying the nightly demo, as well as upgrading the operators and CRDS.

<!--
    Make sure to update the version mentioned below when creating the issue.
-->

```shell
# Install demo (stable operators) for the previous release (24.7)
# For now, we have to deploy from the release branch, otherwise we get new changes.
# Stackablectl doesn't yet support deploying a demo from a branch
git checkout release-24.7
git pull
stackablectl --stack-file=stacks/stacks-v2.yaml --demo-file=demos/demos-v2.yaml demo install <DEMO_NAME>

# --- IMPORTANT ---
# Run through the nightly demo instructions (refer to the tasklist below).

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

# Uninstall operators
stackablectl release uninstall 24.7

# Update CRDs to nightly version (on main)
# Repeat this for every operator used by the demo (use the list from the earlier step before deleting the operators)
kubectl replace -f https://raw.githubusercontent.com/stackabletech/commons-operator/main/deploy/helm/commons-operator/crds/crds.yaml
kubectl replace -f https://raw.githubusercontent.com/stackabletech/...-operator/main/deploy/helm/...-operator/crds/crds.yaml

# Install nightly version of operators (use the list from the earlier step before deleting the operators)
stackablectl operator install commons ...

# Optionally update the product versions in the CRDs (to the latest non-experimental version for the new release), e.g.:
kubectl patch hbaseclusters/hbase --type='json' -p='[{"op": "replace", "path": "/spec/image/productVersion", "value":"x.x.x"}]' # changed
```
