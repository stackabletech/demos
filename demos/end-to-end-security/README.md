# How to persist changes in Superset

1. Log into Keycloak as the user `admin` (in the master realm) and create a user called `admin` in the demo realm.
2. Use that to log into Superset with the `Admin` role.
3. Optional: Add Database connection
4. Add admin user in Keycloak to all relevant groups (so that he has access to the tables, so he can create datasets, charts and dashboards).
5. `pgdump` the Postgres and update the dump in Git. For that shell into `postgresql-superset-0` and execute

```sh
export PGPASSWORD=$(cat "${POSTGRES_POSTGRES_PASSWORD_FILE}")

pg_dumpall -Upostgres > /tmp/dump.sql
```

Afterwards copy the dump to your local machine using

```sh
kubectl cp postgresql-superset-0:/tmp/dump.sql postgres_superset_dump.sql
```

### Custom demo with NiFi and Airflow

For debugging (in NiFi): `kinit -kt /stackable/userdata/kerberos/keytab nifi/nifi.default.svc.cluster.local@KNAB.COM`

```sql
CREATE SCHEMA IF NOT EXISTS staging.exchange_rates WITH (location = 'hdfs:/staging/exchange_rates/');

CREATE TABLE IF NOT EXISTS staging.exchange_rates.rates (
    KEY VARCHAR,
    FREQ VARCHAR,
    CURRENCY VARCHAR,
    CURRENCY_DENOM VARCHAR,
    EXR_TYPE VARCHAR,
    EXR_SUFFIX VARCHAR,
    TIME_PERIOD VARCHAR,
    OBS_VALUE DOUBLE,
    OBS_STATUS VARCHAR,
    OBS_CONF VARCHAR,
    OBS_PRE_BREAK VARCHAR,
    OBS_COM VARCHAR,
    TIME_FORMAT VARCHAR,
    BREAKS VARCHAR,
    COLLECTION VARCHAR,
    COMPILING_ORG VARCHAR,
    DISS_ORG VARCHAR,
    DOM_SER_IDS VARCHAR,
    PUBL_ECB VARCHAR,
    PUBL_MU VARCHAR,
    PUBL_PUBLIC VARCHAR,
    UNIT_INDEX_BASE VARCHAR,
    COMPILATION VARCHAR,
    COVERAGE VARCHAR,
    DECIMALS INTEGER,
    NAT_TITLE VARCHAR,
    SOURCE_AGENCY VARCHAR,
    SOURCE_PUB VARCHAR,
    TITLE VARCHAR,
    TITLE_COMPL VARCHAR,
    UNIT VARCHAR,
    UNIT_MULT INTEGER
) WITH (
    external_location = 'hdfs:/staging/exchange_rates/rates/',
    format = 'parquet'
);

CREATE OR REPLACE VIEW staging.exchange_rates.rates_to_euros AS
select
  cast(time_period as int) as time_period,
  currency,
  obs_value
from staging.exchange_rates.rates
where time_format = 'P1Y'
and collection = 'E'
and currency_denom = 'EUR'
order by 1 desc;

WITH rolling AS (
  SELECT
    time_period,
    currency,
    obs_value,
    AVG(obs_value) OVER (
      PARTITION BY currency ORDER BY time_period
      ROWS BETWEEN 0 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_1y,
    AVG(obs_value) OVER (
      PARTITION BY currency ORDER BY time_period
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_3y,
    AVG(obs_value) OVER (
      PARTITION BY currency ORDER BY time_period
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_5y,
    AVG(obs_value) OVER (
      PARTITION BY currency ORDER BY time_period
      ROWS BETWEEN 9 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_10y,
    COUNT(*) OVER (
      PARTITION BY currency ORDER BY time_period
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS window_3y,
    COUNT(*) OVER (
      PARTITION BY currency ORDER BY time_period
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS window_5y,
    COUNT(*) OVER (
      PARTITION BY currency ORDER BY time_period
      ROWS BETWEEN 9 PRECEDING AND CURRENT ROW
    ) AS window_10y
  FROM staging.exchange_rates.rates_to_euros
)
SELECT
  time_period,
  currency,
  obs_value,
  rolling_avg_1y,
  rolling_avg_3y,
  rolling_avg_5y,
  rolling_avg_10y,
  (obs_value - rolling_avg_3y)  / rolling_avg_3y  * 100 AS pct_change_vs_3y_avg,
  (obs_value - rolling_avg_5y)  / rolling_avg_5y  * 100 AS pct_change_vs_5y_avg,
  (obs_value - rolling_avg_10y) / rolling_avg_10y * 100 AS pct_change_vs_10y_avg
FROM rolling
ORDER BY currency, time_period;
```
