# Setup

Deploy the scripts:

```shell
stackablectl stack install jupyterhub-keycloak --release dev -s stacks/stacks-v2.yaml

# deploy jupyterhub by extracting the values from the jupyterhub.yaml
export TARGET_FILE=stacks/jupyterhub-keycloak/jupyterhub.yaml
KEYCLOAK_ADDRESS=$(kubectl get cm keycloak-address -n default -o jsonpath='{.data.address}')

helm upgrade --install $(yq '.releaseName' $TARGET_FILE) $(yq '.name' $TARGET_FILE) \
--repo $(yq '.repo.url' $TARGET_FILE) \
--version $(yq '.version' $TARGET_FILE) \
-f <(yq '.options' $TARGET_FILE)

# --set hub.config.GenericOAuthenticator.authorize_url="http://$KEYCLOAK_ADDRESS/realms/demo/protocol/openid-connect/auth" \
# --set hub.config.GenericOAuthenticator.token_url="http://$KEYCLOAK_ADDRESS/realms/demo/protocol/openid-connect/token" \
# --set hub.config.GenericOAuthenticator.userdata_url="http://$KEYCLOAK_ADDRESS/realms/demo/protocol/openid-connect/userinfo" \
```
