---
dg-publish: true
---
# livro: Kubernetes Básico

- [[01-introducao]]
- [[02-containers]]
- [[03-cluster-kubernetes]]
- [[04-kubectl]]
- [[05-pods]]
- [[06-labels-annotations]]


## Capítulo 7: Descoberta de serviços

Os exemplos do livro (p. 102) não funcionam exatemente daquela forma pois `kubectl run` não é mais usado para criar deployments.

Mas adaptando, dŕa pra fazermos o seguinte para criar um Service do tipo `ClusterIP`:

```sh
# criando o deployment
kubectl create deployment alpaca-prod \
  --image=gcr.io/kuar-demo/kuard-amd64:blue \
  --replicas=3 \
  --port=8080

# expondo o deployment (equivale a criar um ClusterIP)
kubectl expose deployment alpaca-prod

# criando outro deployment
kubectl create deployment bandicoot-prod \
  --image=gcr.io/kuar-demo/kuard-amd64:green \
  --replicas= 2 \
  --port=8080

# expondo
kubectl expose deployment bandicoot-prod

# ver os selectors
kubectl get services -o wide

# encaminhamento de portas para acessar o app
ALPACA_POD="$(kubectl get pods -l app=alpaca-prod \
  -o jsonpath='{.items[0].metadata.name}')"
kubectl port-forward "${ALPACA_POD}" 48858:8080

launch http://localhost:48858
```

### demonstração do `readinessProbe`

```sh

```


