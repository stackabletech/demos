# STACKIT sepcific

## Nodepool

Use a single `c1.5` machine (16 cores, 32 GB RAM) and at least 50 GB disk!

## Install

`➜  demos git:(feat/e2e-security-stack-it) ✗ stackablectl -s stacks/stacks-v2.yaml demo in end-to-end-security`

# How to persist changes in Superset

1. Log into Keycloak as the user `admin` (in the master realm) and create a user called `admin` in the demo realm.
2. Use that to log into Superset with the `Admin` role.
3. Optional: Add Database connection
4. Add admin user in Keycloak to all relevant groups (so that he has access to the tables, so he can create datasets, charts and dashboards).
5. `pgdump` the Postgres and update the dump in Git. For that shell into `postgresql-superset-0` and execute
```sh
export PGPASSWORD="$POSTGRES_POSTGRES_PASSWORD"

pg_dumpall -Upostgres | gzip -c > /tmp/dump.sql.gz
```

Afterwards copy the dump to your local machine using

```sh
kubectl cp postgresql-superset-0:/tmp/dump.sql.gz postgres_superset_dump.sql.gz
```
