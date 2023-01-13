# ArgoCD with Traefik ingress

## Modify `argocd-cmd-params-cm`
>The API server should be run with TLS disabled. Edit the argocd-server deployment to add the --insecure flag to the argocd-server command or set server.insecure: "true" in the argocd-cmd-params-cm ConfigMap
```
# The `argocd-cmd-params-cm` in install.yaml was modified
kubectl apply -n argocd -f install.yaml
```

## Apply ingress
The `host` was configured as `argocd.winlab.nycu.org`, modify the host part in files if you want to change it.
The host needs to match the wirecard host (*.winlab.nycu.org) define in Traefik configuration.
```
kubectl apply -f ingress-route.yaml
kubectl apply -f ingress.yaml
```

## Support
https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#traefik-v22
https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#argocd-server-and-ui-root-path-v153