---
dg-publish: true
---
# k8s basico - Capítulo 5: Pods

[TOC]

---

## Raciocinando com Pods

- Pergunta: O que devo colocar em um Pod?
    - Resposta: Containers que precisam escalar juntos.
    
Como decidir se devemos colocar containers em Pods diferentes?

Devemos nos perguntar:

- Estes containers funcionarão corretamente se estiverem em máquinas diferentes?
    - Se sim -> colocar em Pods diferentes é provavelmente a melhor solução.
    - Se não -> melhor agrupá-los no mesmo Pod.


## Manifesto do Pod

Vários Pods podem ser colocados na mesma máquina, desde que haja recursos suficientes. No entanto, escalonar várias réplicas da mesma aplicação na mesma máquina é pior no que diz respeito à confiabilidade, pois a máquina é um domínio único de falha. Desse modo, o escalonador do Kubernetes tenta garantir que Pods da mesma aplicação sejam distribuídos em máquinas distintas.


## Criando um Pod

```sh
kubectl run kuard \
  --generator=run-pod/v1 \
  --image=gcr.io/kuar-demo/kuard-amd64:blue

# criando e mandando para um arquivo
kubectl run kuard \
  --generator=run-pod/v1 \
  --image=gcr.io/kuar-demo/kuard-amd64:blue \
  --dry-run=client \
  -o yaml > kuard-pod.yaml
```

Exemplo de um Pod:
```yaml
# kuard-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: kuard
spec:
  containers:
    - image: gcr.io/kuar-demo/kuard-amd64:blue
      name: kuard
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP
```

```sh
# executando o pod
kubectl apply -f kuard-pod.yaml

# detalhes sobre o pod
kubectl describe pods kuard

# removendo o pod
kubectl delete pods/kuard

# remover utilizando o arquivo yaml
kubectl delete -f kuard-pod.yaml

# fazendo encaminhamento de portas
kubectl port-forward kuard 8080:8080

# executar comandos no container do pod
kubectl exec kuard date
kubectl exec -it kuard ash

# copiando arquivos de/para os containers
kubectl cp ${podName}:/path/to/file ./local/file
kubectl cp ./local/file ${podName}:/path/to/file
```


## container probes

Observação: o livro não fala de `startupProbe`.

### resumo

Ver também: [[k8s - container probes]].

| probe       | liveness                                            | readiness                                              | startup                                                  |
| ----------- | --------------------------------------------------- | ------------------------------------------------------ | -------------------------------------------------------- |
| **why?**    | to decide when to restart a container               | to decide when a container is ready to receive traffic | to allow kubelet start running liveness/readiness probes |
| **when?**   | after startupProbe and then continuously            | after startupProbe and then continuously               | after container starts / stops after success or failure  |
| **success** | do nothing                                          | tells the load balancer it's ready to receive traffic  | tells kubelet to start running liveness/readiness probes |
| **failure** | container killed and restarted (see: restartPolicy) | tells load balancer to stop sending traffic            | container killed and restarted (see: restartPolicy)      |
| **default** | same as success                                     | same as success                                        | same as success                                          |


### liveness probe

No exemplo a seguir estamos usando `httpGet`, mas também existem outros métodos: `exec.command` e `tcpSocket`.
```yaml
# ... pods definition file
spec:
  containers:
  - image: # ...
    livenessProbe:
      httpGet:
        path: /healthy
        port: 8080
      initialDelaySeconds: 5
      timeoutSeconds: 1
      periodSeconds: 10
      failureThreshold: 3
# ... rest of the file
```

- `httpGet:` - será feita uma requisição HTTP `GET`
- `path: /healthy | port: 8080` - a requisição será feita no endpoint `/healthy` via porta 8080
- `initialDelaySeconds: 5` - só começa a fazer checagem 5 segundos após todos os containers terem sido criados
- `timeoutSeconds: 1` - a requisição deve retornar dentro de um segundo com um HTTP status code > 200 e < 400
- `periodSeconds: 10` - o teste será realizado a cada 10 segundos
- `failureThreshold: 3` - se 3 probes consecutivos falharem, o container será reiniciado.

Vendo o liveness probe funcionando:

```yaml
# kuard-pod-health.yaml
apiVersion: v1
kind: Pod
metadata:
  name: kuard
spec:
  containers:
    - image: gcr.io/kuar-demo/kuard-amd64:blue
      name: kuard
      livenessProbe:
        httpGet:
          path: /healthy
          port: 8080
        initialDelaySeconds: 5
        timeoutSeconds: 1
        periodSeconds: 10
        failureThreshold: 3
      ports:
        - containerPort: 8080
          name: http
          protocol: TCP
```

```sh
# inicie o pod
kubectl apply -f kuard-pod-health.yaml

# torne-o acessível via localhost
kubectl port-forward kuard 8080:8080

# monitore-o
launch http://localhost:8080
```

No navegador, vlique na aba "Liveness Probe" e observe a tabela sendo atualizada. Ao clicar no link "Fail" o kuard começará a devolver falhas nas verificações de sanidade. Espere tempo suficiente e o kubernetes reiniciará o container. Ao reiniciar o container, a contagem mostrada na tela irá reiniciar também.


### readiness probe

O kubernetes faz a seguinte distinção entre *liveness* e *readiness*:

- **liveness**:
    - vitalidade
    - descreve se uma aplicação está executando de forma apropriada
    - **containers com falha no liveness probe serão reiniciados**
- **readiness**
    - prontidão
    - descreve quando um container está pronto para atender requisições
    - **containers com falha no readiness serão removidos dos load balancers**


## gerenciamento de recursos

Duas métricas diferentes para recursos: `requests` e `limits`.

- `requests`
    - especifica quantidade **mínima** de um recurso que uma aplicação precisa
- `limits`
    - especificam a quantidade **máxima** de um recurso que uma aplicação pode consumir.

Exemplo:
```yaml
# ... pods definition ...
spec:
  containers
    - image: # ...
      resources:
        requests:
          cpu: "500m"
          memory: "128Mi"
        limits:
          cpu: "1000m"
          memory: "256Mi"
# ...
```

TODO: adicionar aqui anotações sobre burstable, bestEffort e a outra situação que significa garantia que o Pod não será Evicted.