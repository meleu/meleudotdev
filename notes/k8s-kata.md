---
dg-publish: true
---
# k8s-kata

-  <https://github.com/eficode-academy/kubernetes-katas>


## 00. install minikube and kubectl

## 00. setup namespace

```bash
kubectl create namespace k8s-kata

# get current context
kubectl config current-context

# overwrite the default namespace for your current context
kubectl config set-context $(kubectl config current-context) --namespace=k8s-kata

# check it
kubectl config get-contexts
```

## 01. pods and deployments

- Goals
    - imperative way to create a Deployment
    - check that a Deployment automatically creates a ReplicaSet and Pods
    - create a yaml file using the imperative command and `--dry-run=client`
    - create a Deployment based on a yaml manifest.
    - delete a Pod of a Deployment (and a new one will be created)
    - cleanup your namespace (delete everything)

```bash
# create a deployment
kubectl create deployment multitool --image=ghcr.io/eficode-academy/network-multitool

# check the objects created
kubectl get deployment,replicaset,pod

# another deployment, with an specific version of nginx:1.7.9
kubectl create deployment nginx --image nginx:1.7.9

# let's delete this nginx deployment and create it from a yaml file
kubectl delete deployment nginx

# create the yaml file taking advantage of the kubectl command
kubectl create deployment nginx --image nginx:1.7.9 --dry-run=client -o yaml > nginx-deployment.yml

# create a deployment based on a yaml file
kubectl apply -f nginx-deployment.yml

# delete a pod and see the deployment creating anew one
kubectl get pods # check the name of the nginx pod
kubectl delete pod nginx-6ffffd8d5b-csjvs
kubectl get pods --watch # <-- keep watching and see a new nginx pod being created

# cleanup everything
kubectl delete deployment nginx
kubectl delete deployment multitool
kubectl delete service multitool
```


## 02. service discovery and loadbalancing

```bash
# create some deployments to expose
kubectl create deployment multitool \
  --image=ghcr.io/eficode-academy/network-multitool \
  --dry-run=client -o yaml > multitool-deployment.yaml
kubectl apply -f multitool-deployment.yaml
kubectl create deployment nginx \
  --image nginx:1.7.9 \
  --dry-run=client -o yaml > nginx-deployment.yaml
kubectl apply -f nginx-deployment.yaml
```

### ClusterIP

Only create a DNS entry with the name of the service, as well as an internal cluster IP that routes traffic over to the deployments hit by the selector part of the service.

The service type ClusterIP does not have any external IP, therefore inaccessible over internet, but we can still access it from within the cluster using its `CLUSTER-IP`.

```bash
# Service type: ClusterIP
#########################

# create a ClusterIP yaml to expose nginx
kubectl expose deployment nginx --port 80 \
  --dry-run=client -o yaml > nginx-service.yaml
kubectl apply -f nginx-service.yaml
# now nginx is exposed internally, within the cluster

# let's connect to the multitool container
# Options:
# -i, --stdin=false: Pass stdin to the container
# -t, --tty=false: Stdin is a TTY
# -c, --container='': Container name. If omitted, use the kubectl.kubernetes.io/default-container
# annotation for selecting the container to be attached or the first container in the pod will be
# chosen
kubectl exec -it multitool-85bccc856f-slgg5 -c network-multitool -- bash
# once in the container, curl the nginx Service
curl -s nginx | grep h1

# try specifying <service name>.<namespace>.svc.cluster.local
curl -s nginx.k8s-kata | grep h1

```


### Service type: NodePort

Creates a port on the service that is reachable from the outside. We still don't have an external IP, but we now have an extra port for this service. This port is a **NodePort** exposed on the worker nodes. If we know the IP of our nodes, we can access this service from the internet.

```bash
# Service type: NodePort
#########################

# the example didn't work 🙁
```


### Service type: LoadBalancer

Only available for use if your cluster is setup in a public cloud provider...




## 03. rolling updates

This exercise is interesting to see the `maxSurge` e `maxUnavailable` options taking effect.

