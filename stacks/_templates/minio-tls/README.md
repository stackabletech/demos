# MinIO with TLS from secret-operator

MinIO has a severe limitation whereby the TLS certificates must be named `public.crt`
and `private.key`. This goes against Kubernetes naming of `tls.crt` and `tls.key`.

The upstream minio chart is also too limited:

- No way to add initContainers (to rename cert files in a shared volume).
- No way to edit the container command (to rename cert files before starting minio).

Therefore, we will render the upstream chart here, and then apply the necessary
customizations on top.

```yaml
helm template minio minio/minio -f values.yaml > rendered-chart.yaml
```
