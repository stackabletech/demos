# argo-cd-git-ops

## How to create sealed secrets

This demo uses [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) to decrypt secrets stored in a Git repository.

The CLI tool `kubeseal` must be installed as described in the [Sealed Secrets readme](https://github.com/bitnami-labs/sealed-secrets?tab=readme-ov-file#kubeseal).

The easiest way to seal secrets via `kubeseal` is to have the `argo-cd-git-ops` Stack installed. It provides the Sealed Secrets controller and
a generated certificate that is automatically used for signing via `kubeseal`.

```sh
kubeseal -n stackable-airflow --format=yaml < airflow-credentials.yaml > sealed-airflow-credentials.yaml
```

For "offline" usage you can first fetch the CA from the `sealed-secrets-controller` and use that for encryption when the demo / stack is not available.

```sh
kubeseal --fetch-cert --controller-name sealed-secrets-controller --controller-namespace sealed-secrets > sealed-secrets.crt
kubeseal --cert sealed-secrets.crt -n stackable-airflow --format=yaml < airflow-credentials.yaml > sealed-airflow-credentials.yaml
```

TODO: We should probably create a script that seals all secrets and puts them in the respective stack / demo folders
