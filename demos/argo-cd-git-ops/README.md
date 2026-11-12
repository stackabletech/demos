# argo-cd-git-ops

## How to create sealed secrets

This demo uses [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) to decrypt secrets stored in a Git repository.

The CLI tool `kubeseal` must be installed as described in the [Sealed Secrets readme](https://github.com/bitnami-labs/sealed-secrets?tab=readme-ov-file#kubeseal).

The easiest way to seal secrets via `kubeseal` is to have the `argo-cd-git-ops` Stack installed.
It provides the Sealed Secrets controller and a generated certificate that is automatically used for signing via `kubeseal`.

```sh
kubeseal -n stackable-airflow --format=yaml < airflow-admin-credentials.yaml > sealed-airflow-admin-credentials.yaml
kubeseal -n stackable-airflow --format=yaml < airflow-postgresql-credentials.yaml > sealed-airflow-postgresql-credentials.yaml
kubeseal -n stackable-airflow --format=yaml < airflow-s3-connection.yaml > sealed-airflow-s3-connection.yaml
kubeseal -n garage --format=yaml < s3-credentials.yaml > sealed-s3-credentials.yaml
```

For "offline" usage you can first fetch the CA from the `sealed-secrets-controller` and use that for encryption when the demo / stack is not available.

```sh
kubeseal --fetch-cert --controller-name sealed-secrets-controller --controller-namespace sealed-secrets > sealed-secrets.crt
kubeseal --cert sealed-secrets.crt -n stackable-airflow --format=yaml < airflow-admin-credentials.yaml > sealed-airflow-admin-credentials.yaml
```

After sealing, re-add the Stackable labels to `spec.template.metadata` of the generated SealedSecret manually (they are not part of the encrypted payload):

```yaml
      labels:
        stackable.tech/vendor: Stackable
        stackable.tech/demo: argo-cd-git-ops
```

IMPORTANT: These manifests are synced by Argo CD directly from Git, so Jinja2 template expressions like `"{{ DEMO }}"` are never rendered here.
Kubernetes rejects them as invalid label values, which breaks unsealing — label values must be hardcoded in everything under `manifests/`.

## Plaintext secrets used in this demo

The sealed secrets under `manifests/airflow/` and `manifests/garage/` were created from the following plaintext manifests.
These are demo-only credentials: the Sealed Secrets controller key for this stack is committed to this repository (`stacks/argo-cd-git-ops/secrets/sealed-secrets-key.yaml`), so the sealed secrets provide no confidentiality here — sealing only demonstrates the GitOps workflow.
Never use this pattern for real credentials.

`airflow-admin-credentials.yaml`:

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: airflow-admin-credentials
type: Opaque
stringData:
  adminUser.username: admin
  adminUser.firstname: Airflow
  adminUser.lastname: Admin
  adminUser.email: airflow@airflow.com
  adminUser.password: adminadmin
```

`airflow-postgresql-credentials.yaml` (must match the credentials the PostgreSQL chart is provisioned with, see `manifests/airflow-postgres/`):

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: airflow-postgresql-credentials
type: Opaque
stringData:
  username: airflow
  password: airflow
```

`s3-credentials.yaml` (namespace `garage`). Garage requires the `GK<24 hex characters>` key id format and a 64 hex character secret, so these are not free form values:

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: s3-credentials
type: Opaque
stringData:
  accessKey: GK31c0ffee31c0ffee31c0ffee
  secretKey: deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
```

`airflow-s3-connection.yaml` (must use the key pair from `s3-credentials.yaml`):

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: airflow-s3-connection
type: Opaque
stringData:
  airflow-s3-connection: aws://GK31c0ffee31c0ffee31c0ffee:deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef@/?endpoint_url=https%3A%2F%2Fgarage.garage.svc.cluster.local%3A9000
```

TODO: We should probably create a script that seals all secrets and puts them in the respective stack / demo folders
