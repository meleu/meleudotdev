---
dg-publish: true
---
## Capítulo 3: Implantação de um cluster Kubernetes

Neste capítulo há instruções para criar um cluster kubernetes para começar a praticar.

Instalei o minikube (devido ao curso da [Nana](DevOps%20Bootcamp%20-%20Nana.md))

- Instalando kubernetes em um cloud provider:
    - Google Kubernetes Engine
    - Azure Kubernetes Service
    - Elastic Kubernetes Service
- Instalando kubernetes localmente
    - minikube
    - kind


### Comandos

```sh
# mostra versão do kubectl a da versão da API kubernetes
kubectl version

# verificando status do cluster
# obs.: the output says it's deprecated
kubectl get componentstatuses

# lista os worker nodes
kubectl get nodes

# obtém mais informações sobre um node específico
kubectl describe nodes [nodeName]
```

### Alguns Componentes de um Cluster

Observação: alguns desses comandos não funcionou no meu minikube 1.20.

- Kubernetes proxy:
    - responsável por encaminhar tráfego de rede para load balancers
    - cada nó tem o seu `kube-proxy`
    - `kubectl get daemonSets --namespace=kube-system kube-proxy`
- Kubernetes DNS:
    - servidor DNS
    - cada cluster pode ter um ou mais
    - `kubectl get deployments --namespace=kube-system core-dns`
    - `kubectl get services --namespace=kube-system core-dns`
- Kubernetes UI
    - `kubectl get deployments --namespace=kube-system kubernetes-dashboard`