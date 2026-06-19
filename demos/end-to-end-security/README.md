# How to persist changes in Superset

Note: User role assignments no longer need to be maintained in the dump.
They are assigned by OPA on every login based on the Keycloak group memberships
(see `stacks/end-to-end-security/superset-regorules.yaml`).

1. Log into Superset via `Sign in with Keycloak` as the user `admin` (default password `adminadmin`).
   The user is part of the demo realm in `keycloak-realm-config.yaml` and is automatically assigned the Superset `Admin` role by OPA.
2. Optional: Add Database connection
3. Add admin user in Keycloak to all relevant groups (so that he has access to the tables, so he can create datasets, charts and dashboards).
4. `pgdump` the Postgres and update the dump in Git. For that shell into `postgresql-superset-0` and execute

```sh
export PGPASSWORD=$(cat "${POSTGRES_POSTGRES_PASSWORD_FILE}")

pg_dumpall -Upostgres > /tmp/dump.sql
```

Afterwards copy the dump to your local machine using

```sh
kubectl cp postgresql-superset-0:/tmp/dump.sql postgres_superset_dump.sql
```
