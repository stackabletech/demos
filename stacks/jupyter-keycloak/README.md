# Setup

Create an ingress-enabled KinD cluster:

```shell
# create a kind cluster N.B. with ingress-ready=true
cat <<EOF | kind create cluster --image kindest/node:v1.31.1 --name stackable-data-platform --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF

# This creates a ingress-nginx namespace and installs the ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

Deploy the scripts:

```shell
# cd ~/<path-to-repos>/demos
# and then:-
# deploy kc etc.

stackablectl op in secret commons listener
kubectl apply -f stacks/jupyter-keycloak/serviceaccount.yaml
kubectl apply -f stacks/jupyter-keycloak/kc.yaml
kubectl apply -f stacks/jupyter-keycloak/in.yaml

# deploy jhub by extracting the values from the jupyterhub.yaml
export TARGET_FILE=stacks/jupyter-keycloak/jupyterhub.yaml
helm upgrade --install $(yq '.releaseName' $TARGET_FILE) $(yq '.name' $TARGET_FILE) --repo $(yq '.repo.url' $TARGET_FILE) --version $(yq '.version' $TARGET_FILE) -f <(yq '.options' $TARGET_FILE)

# check token retrieval
HUB_POD=$(kubectl -n default get pod -l app=jupyterhub,component=hub -o name | head -n 1 | sed -e 's#pod/##')
kubectl exec -it $HUB_POD -- curl -v -X POST -d "grant_type=client_credentials&client_id=jupyterhub&client_secret=jupyterhubjupyterhub" https://keycloak.default.svc.cluster.local:8443/realms/jupyterhub/protocol/openid-connect/token
```

## Navigate to

```shell
http://proxy-public.default.svc.cluster.local:31095
```

and log in as

```shell
dev/dev
```

Other checks:

```shell
# check the actual auth handshake, by trying to login and then adding code found in the browser URL:
HUB_POD=$(kubectl -n default get pod -l app=jupyterhub,component=hub -o name | head -n 1 | sed -e 's#pod/##')
URLCODE=339f2de3-03be-4a81-b8bc-7bcaf6babc59.0302eaa2-8cae-4e22-a35a-abd7b35e2c4c.1f7d09f0-2b6f-4c1f-83f4-86dceabe0199
kubectl exec -it $HUB_POD -- curl -v -X POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=authorization_code&code=$URLCODE&redirect_uri=http://proxy-public.default.svc.cluster.local:31095/hub/oauth_callback&client_id=jupyterhub&client_secret=jupyterhubjupyterhub" \
  https://keycloak.default.svc.cluster.local:8443/realms/jupyterhub/protocol/openid-connect/token

# Check the user-info is returnable:
HUB_POD=$(kubectl -n default get pod -l app=jupyterhub,component=hub -o name | head -n 1 | sed -e 's#pod/##')
# Get the access token
TOKEN=$(kubectl exec -it $HUB_POD -- curl -s -d "grant_type=client_credentials&client_id=jupyterhub&client_secret=jupyterhubjupyterhub&scope=openid" https://keycloak.default.svc.cluster.local:8443/realms/jupyterhub/protocol/openid-connect/token | jq -r .access_token)
# Pass the token into the pod and use it in the curl command
kubectl exec -it $HUB_POD -- bash -c "curl -v -H \"Authorization: Bearer $TOKEN\" https://keycloak.default.svc.cluster.local:8443/realms/jupyterhub/protocol/openid-connect/userinfo"

# should return something like:
# {"sub":"a391bb10-bb56-4b87-a6a0-f8e7e9ea8231","email_verified":false,"preferred_username":"service-account-jupyterhub"}

# and for the user dev:
HUB_POD=$(kubectl -n default get pod -l app=jupyterhub,component=hub -o name | head -n 1 | sed -e 's#pod/##')
# Get the access token for the user 'dev' using the password grant
TOKEN=$(kubectl exec -it $HUB_POD -- curl -s -d "grant_type=password&client_id=jupyterhub&client_secret=jupyterhubjupyterhub&username=dev&password=dev&scope=openid" https://keycloak.default.svc.cluster.local:8443/realms/jupyterhub/protocol/openid-connect/token | jq -r .access_token)
# Pass the token into the pod and use it in the curl command
kubectl exec -it $HUB_POD -- bash -c "curl -v -H \"Authorization: Bearer $TOKEN\" https://keycloak.default.svc.cluster.local:8443/realms/jupyterhub/protocol/openid-connect/userinfo"

# {"sub":"c88186dc-5777-4401-820b-467f841073bb","email_verified":false,"name":"Dev User","preferred_username":"dev","given_name":"Dev","family_name":"User","email":"dev@noemail.com"}
```
