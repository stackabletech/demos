# Setup

```shell
# cd ~/<path-to-repos>/demos
# and then:-
# deploy kc etc.

stackablectl op in secret commons listener
kubectl apply -f stacks/jupyter-keycloak/serviceaccount.yaml
kubectl apply -f stacks/jupyter-keycloak/kc.yaml

# deploy jhub by extracting the values from the jupyterhub.yaml

export TARGET_FILE=stacks/jupyter-keycloak/jupyterhub.yaml
helm upgrade --install $(yq '.releaseName' $TARGET_FILE) $(yq '.name' $TARGET_FILE) --repo $(yq '.repo.url' $TARGET_FILE) --version $(yq '.version' $TARGET_FILE) -f <(yq '.options' $TARGET_FILE)

# check token retrieval

HUB_POD=$(kubectl -n default get pod -l app=jupyterhub,component=hub -o name | head -n 1 | sed -e 's#pod/##')
kubectl exec -it $HUB_POD -- curl -v -X POST -d "grant_type=client_credentials&client_id=jupyterhub&client_secret=jupyterhubjupyterhub" https://keycloak.default.svc.cluster.local:8443/realms/jupyterhub/protocol/openid-connect/token

# start port forward (for local testing)

kubectl port-forward svc/keycloak-external 31093:8443
```

## Navigate to

```shell
http://proxy-public.default.svc.cluster.local:31095
```

and log in.

This currently fails with:

```log
[I 2025-01-09 10:00:08.661 JupyterHub _xsrf_utils:125] Setting new xsrf cookie for b'None:65hjvV7aYFWnijeJzYqo99ftO7ruoYCNaCuJWSUAF6k=' {'path': '/hub/', 'max_age': 3600}
[I 2025-01-09 10:00:08.682 JupyterHub log:192] 200 GET /hub/login?next=%2Fhub%2F (@::ffff:10.244.0.1) 20.92ms
[I 2025-01-09 10:00:15.712 JupyterHub oauth2:127] OAuth redirect: http://proxy-public.default.svc.cluster.local:31095/hub/oauth_callback
[I 2025-01-09 10:00:15.712 JupyterHub log:192] 302 GET /hub/oauth_login?next=%2Fhub%2F -> https://keycloak.default.svc.cluster.local:31093/realms/jupyterhub/protocol/openid-connect/auth?response_type=code&redirect_uri=http%3A%2F%2Fproxy-public.default.svc.cluster.local%3A31095%2Fhub%2Foauth_callback&client_id=jupyterhub&code_challenge=[secret]&code_challenge_method=[secret]&state=[secret]&scope=openid (@::ffff:10.244.0.1) 0.83ms
[E 2025-01-09 10:00:42.674 JupyterHub oauth2:832] Error fetching 599 POST https://keycloak.default.svc.cluster.local:31093/realms/jupyterhub/protocol/openid-connect/token: HTTP 599: Connection timed out after 20000 milliseconds
[E 2025-01-09 10:00:42.674 JupyterHub web:1875] Uncaught exception GET /hub/oauth_callback?state=...=https%3A%2F%2Fkeycloak.default.svc.cluster.local%3A31093%2Frealms%2Fjupyterhub&code=... (::ffff:10.244.0.1)
    HTTPServerRequest(protocol='http', host='proxy-public.default.svc.cluster.local:31095', method='GET', uri='/hub/oauth_callback?state=eyJzdGF0ZV9pZCI6ICIyMTY2NTkwNzg0ZTA0OGYxYjAwNzA4NGNiZTE4NGRiMyJ9&session_state=375571c5-84ce-46eb-a52f-a0a0794b347e&iss=https%3A%2F%2Fkeycloak.default.svc.cluster.local%3A31093%2Frealms%2Fjupyterhub&code=8a544009-5f75-4cbd-991a-7e5de8e9dea5.375571c5-84ce-46eb-a52f-a0a0794b347e.9d285994-c31c-43e6-a11c-e3e27b2bdc62', version='HTTP/1.1', remote_ip='::ffff:10.244.0.1')
    Traceback (most recent call last):
      File "/usr/local/lib/python3.12/site-packages/tornado/web.py", line 1790, in _execute
        result = await result
                 ^^^^^^^^^^^^
...
      File "/usr/local/lib/python3.12/site-packages/oauthenticator/oauth2.py", line 812, in fetch
        resp = await self.http_client.fetch(req, **kwargs)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    tornado.curl_httpclient.CurlError: HTTP 599: Connection timed out after 20000 milliseconds

[E 2025-01-09 10:00:42.691 JupyterHub log:184] {
      "X-Forwarded-Host": "proxy-public.default.svc.cluster.local:31095",
      "X-Forwarded-Proto": "http",
      "X-Forwarded-Port": "31095",
      "X-Forwarded-For": "::ffff:10.244.0.1",
      "Cookie": "_xsrf=[secret]; oauthenticator-state=[secret]",
      "Accept-Encoding": "gzip, deflate",
      "Accept-Language": "en-GB-oxendict,en;q=0.5",
      "Sec-Gpc": "1",
      "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
      "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
      "Upgrade-Insecure-Requests": "1",
      "Cache-Control": "max-age=0",
      "Connection": "keep-alive",
      "Host": "proxy-public.default.svc.cluster.local:31095"
    }
[E 2025-01-09 10:00:42.691 JupyterHub log:192] 500 GET /hub/oauth_callback?state=[secret]&session_state=[secret]&iss=https%3A%2F%2Fkeycloak.default.svc.cluster.local%3A31093%2Frealms%2Fjupyterhub&code=[secret] (@::ffff:10.244.0.1) 20019.81ms
```
