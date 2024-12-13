# Description

Like the `trino-iceberg` demo, but with lakekeeper REST catalog

## Install 

1. `helm install lakekeeper https://github.com/lakekeeper/lakekeeper-charts/releases/download/lakekeeper-0.2.0/lakekeeper-0.2.0.tgz`
    OR (public reachable, *adopt to your LoadBalancer IP*)
    `helm upgrade --install lakekeeper https://github.com/lakekeeper/lakekeeper-charts/releases/download/lakekeeper-0.2.0/lakekeeper-0.2.0.tgz --set catalog.service.type=LoadBalancer --set catalog.config.ICEBERG_REST__BASE_URI=http://87.106.32.189:8181`
2. `stackablectl -s stacks/stacks-v2.yaml stack install trino-iceberg-lakekeeper`

## SQLs

```sql
CREATE SCHEMA lakehouse.tpch WITH (location = 's3://lakehouse/lakehouse/tpch');

```



### TEMPORARY, needed for lakekeeper 0.5.0

We need https://github.com/lakekeeper/lakekeeper-charts/pull/35

```
git clone git@github.com:hienduyph/lakekeeper-charts.git
cd lakekeeper-charts/charts/lakekeeper
helm dependency build
helm upgrade --install lakekeeper . --set catalog.service.type=LoadBalancer --set catalog.config.ICEBERG_REST__BASE_URI=http://87.106.90.47:8181
```
