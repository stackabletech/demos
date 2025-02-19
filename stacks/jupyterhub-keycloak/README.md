# Setup

Deploy the scripts:

```shell
stackablectl stack install jupyterhub-keycloak --release dev -s stacks/stacks-v2.yaml

# deploy jhub by extracting the values from the jupyterhub.yaml
export TARGET_FILE=stacks/jupyterhub-keycloak/jupyterhub.yaml
helm upgrade --install $(yq '.releaseName' $TARGET_FILE) $(yq '.name' $TARGET_FILE) --repo $(yq '.repo.url' $TARGET_FILE) --version $(yq '.version' $TARGET_FILE) -f <(yq '.options' $TARGET_FILE)
```
