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
