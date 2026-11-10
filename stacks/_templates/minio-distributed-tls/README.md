# MinIO with TLS from secret-operator

MinIO has a severe limitation whereby the TLS certificates must be named `public.crt`
and `private.key`. This goes against Kubernetes naming of `tls.crt` and `tls.key`.

The upstream minio chart is also too limited:

- No way to add initContainers (to rename cert files in a shared volume).
- No way to edit the container command (to rename cert files before starting minio).

Therefore, we will render the upstream chart here, and then apply the necessary
customizations on top.

```bash
helm repo add minio https://charts.min.io/
helm template minio minio/minio -f values.yaml > rendered-chart.yaml
```

MinIO no longer publishes the images referenced by the upstream chart.
After rendering, replace both the `minio` and `mc` images with `bitnamilegacy/minio:2024-debian-12`
(it contains both binaries) and adjust the image-specific paths:

- `/usr/bin/docker-entrypoint.sh minio server` -> `exec minio server`
- `/usr/bin/mc` -> `mc`
