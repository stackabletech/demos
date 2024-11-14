---
name: Pre-Release Demo Chart Updates
about: This template can be used to track the Helm chart updates for all demos.
title: "chore(tracking): Update Helm charts for XX.(X)X"
labels: []
assignees: ''
---

## Pre-Release Demo Chart Updates

There are a bunch of demos which directly use Helm charts to install some required parts of the
demo / stack. These charts need updating **before** we start testing the stable to nightly upgrade.

Most of the charts are located in the `stacks/_templated` folder. Additional folders are:
`stacks/observability` and `stacks/signal-processing`. It is recommended to search for `releaseName`
to find all referenced charts.

### Update Instructions

These instructions help to update the charts:

```shell
# List all available repos
helm repo list
```

Make sure, you have the following repos added:

```plain
NAME                  URL
bitnami               https://charts.bitnami.com/bitnami
stackable-dev         https://repo.stackable.tech/repository/helm-dev/
stackable-stable      https://repo.stackable.tech/repository/helm-stable/
timescale             https://charts.timescale.com/
prometheus-community  https://prometheus-community.github.io/helm-charts
vector                https://helm.vector.dev
grafana               https://grafana.github.io/helm-charts
jaeger                https://jaegertracing.github.io/helm-charts
opentelemetry         https://open-telemetry.github.io/opentelemetry-helm-charts
jupyterhub            https://jupyterhub.github.io/helm-chart/
opensearch            https://opensearch-project.github.io/helm-charts
```

To add any that are missing, run:

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami --force-update
```

Then make sure you have the latest indexes:

```shell
helm repo update
```

Next, search for the latest version of the desired chart, eg `grafana/grafana`:

```shell
# Display the latest versions of a chart
$ helm search repo grafana/grafana --versions | head -5
NAME             CHART VERSION  APP VERSION
grafana/grafana  8.6.0          11.3.0
grafana/grafana  8.5.12         11.3.0
grafana/grafana  8.5.11         11.3.0
grafana/grafana  8.5.10         11.3.0
```

Use the applicable chart version displayed to replace the current one in the YAML files. Make sure
to add the app version in the comments. Eg:

```yml
version: 3.2.1 # 1.2.3
```

Take a look at previous PRs for additional guidance, eg. <https://github.com/stackabletech/demos/pull/119>.
