---
dg-publish: true
---
## Capítulo 4: Comandos comuns do kubectl

### Namespaces

O kubernetes utiliza *namespaces* para organizar objetos no cluster. É como se fosse uma pasta que armazena um conjunto de objetos.

Por padrão o namespace é `default`, mas é possível usar o namespace diferente usando o argumento `--namespace=mystuff`

Para obter informações sobre todos os namespaces: `--all-namespaces`.


### Contextos

É possível mudar o namespace default usando um contexto.

Geralmente armazenado em `$HOME/.kube/config`.

Alterar o namespace default:
```sh
# cria novo contexto
kubectl config set-context my-context --namespace=mystuff

# utilizando novo contexto
kubectl config use-context my-context
```

Também é possivel gerenciar diferentes clusters ou usuários para autenticação usando `--clusters` ou `--users` com o comando `set-context`.


### Visualizando objetos da API do Kubernetes

```sh
kubectl get <nomeDoRecurso> <nomeDoObjeto>
```

O formato das informações pode ser determinado pela opção `-o`:

- `-o json`
- `-o yaml`
- `-o jsonpath`

Obs.: conhecer [[jsonpath]] pode ser útil.

Exemplo:
```sh
kubectl get pods my-pod -o jsonpath --template={.status.podIP}
```

Para ver mais detalhes:
```sh
kubectl describe <nomeDoRecurso> <nomDoObjeto>
```



### Criando, atualizando e removendo objetos Kubernetes

```sh
# não precisa especificar o recurso, está tudo escrito no yaml
kubectl apply -f object.yaml

# para alterar objetos, basta editar o yaml e rodar o mesmo comando:
kubectl apply -f object.yaml

# se quiser ver o que o comando fará sem realmente fazer:
kubectl apply -f object.yaml --dry-run

# modificações interativas
kubectl edit <nomeDoRecurso> <nomeDoObjeto>

# histórico de de configurações anteriores podem ser obtidas com:
# - edit-last-applied
# - set-last-applied
# - view-last-applied
# exemplo:
kubectl apply -f myobj.yaml view-last-applied

# deletar um objeto (obs.: não pede confirmação)
kubectl delete -f object.yaml
```


### Usando labels e annotations

```sh
# adicionar label `color=red` em um pod chamado `bar`:
kubectl label pods bar color=red

# remover o label (basta adicionar o sinal de `-` menos)
kubectl label pods bar color-
```


### Comando de depuração

```sh
# ver logs no pod
kubectl logs <nomeDoPod>

# acompanhar os logs em tempo real
kubectl logs -f <nomeDoPod>

# executar um shell interativo no pod (assume que bash está presente)
kubectl exec -it <nomeDoPod> -- bash 

# fazer um "attach" do processo em execução
kubectl attach -it <nomeDoPod>

# copiar arquivos de/para o pod
kubectl cp <nomeDoPod>:</path/para/arquivo> </path/para/arquivo/local>

# encaminhar tráfego via port-forwarding
kubectl port-forward <nomeDoPod> 8080:80

# utilização de recursos (namespace default, para ver
# tudo: --all-namespaces)
kubectl top nodes
kubectl top pods
```
