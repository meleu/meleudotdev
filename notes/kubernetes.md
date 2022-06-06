# kubernetes

## videos

- [The Illustrated Children's Guide to Kubernetes](https://www.youtube.com/watch?v=4ht22ReBjno)

## books

- [[Kubernetes Basico]]
- [[Cloud Native DevOps with Kubernetes]]


## certification practice

- <https://github.com/dgkanatsios/CKAD-exercises/>
- <https://github.com/lucassha/CKAD-resources>


## liveness/readiness -> rolling update

Sempre use liveness/readiness probes em produção. Pois na hora de um rolling update, o pod antigo só vai morrer quando o novo estiver live/ready

## YAML básico de alguns elementos

NOTE: strings starting with `$` means that they should be changed to something else

### campos obrigatórios

```yaml
apiVersion:
kind:
metadata:
spec:
```

### POD

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: $pod-name
  labels:
    $key: $value
spec:
  containers:
    - name: $container-name
      image: $docker-image
    # it can have multiple containers here
```


### ReplicaSet

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: $replicaset-name
  labels:
    $key: $value
spec:
  replicas: $number
  template
    $pod-metadata
    $pod-spec
  selector:
    matchLabels: # could be 'matchExpressions'
      $pod-label-key: $pod-label-value
```


### Deployment

Same thing as ReplicaSets, but in the field `kind:` replace `ReplicaSet` with `Deployment`.


## videos

- <https://youtu.be/RRCzgVI4ptY> 7 Tips and Tricks to Enjoy Your Kubernetes Journey


## links

- [kubectl productivity](https://learnk8s.io/blog/kubectl-productivity)
- [validating kubernetes YAMLs](https://learnk8s.io/validating-kubernetes-yaml)
- [load balancing and scaling long-lived connections in Kubernetes](https://learnk8s.io/kubernetes-long-lived-connections)

## cursos

- [[10-kubernetes]]
- [[notes/learning/kubernetes-for-absolute-beginners/index]]
- [[notes/learning/kubernetes-ckad-with-tests/index]]


## livros

- [[Kubernetes Basico]]
- [[Padroes para Kubernetes]]

