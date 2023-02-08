# Deploy EFK on Kubernetes
## Prerequirement
Configure nfs-provisioner well

## Deploy elasticsearch
### Install CR
```
kubectl create -f https://download.elastic.co/downloads/eck/2.6.1/crds.yaml
```

### Install operator
```
kubectl apply -f https://download.elastic.co/downloads/eck/2.6.1/operator.yaml
```

### Deploy an elastic cluster
* Create CustomResource
Deploy CR, nameing `main`, in monitor namespace:
```
cd elasticsearch
k apply -f cr.yaml
```
* Get status
```
kubectl get elasticsearch
```
the `HEALTH` will be green

### Access Elasticsearch
* Grant Password
```
PASSWORD=$(kubectl get secret -n monitor main-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
```
* Port-forward
```
kubectl port-forward -n monitor service/main-es-http 9200
curl -u "elastic:$PASSWORD" -k "https://localhost:9200"
```

### Support
https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-elasticsearch.html


## Install kibana
* Create CR
```
cd kibana
k apply -f cr.yaml
```
### Access kibana
* Grant Password
```
kubectl get secret -n monitor main-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

## Install fluentd
>Under testing
* Modify `fluentd/fluent-ds.yaml`
```
edit password env parameter
```

* Apply
```
kubectl apply -f fluentd/
```
