# Setup

Deploy the scripts:

```shell
stackablectl stack install jupyterhub-keycloak --release dev -s stacks/stacks-v2.yaml

kubectl apply -f ./demos/jupyterhub-keycloak/load-gas-data.yaml
```
