---
dg-publish: true
---
# kubectl tricks

## Delete all evicted pods

```bash
kubectl get pods -o jsonpath='{.items[?(@.status.reason == "Evicted")].metadata.name}' | xargs kubectl delete pods
```

### Why delete evicted pods?

When we have too many evicted pods in our cluster, this can lead to network load as each pod, even the evicted ones, is connected to the network. In case of a cloud Kubernetes cluster, they will block an IP address, which can lead to exhaustion of IP addresses too if you have a fixed pool of IP addresses for your cluster.

Also, when we have too many pods in Evicted status, it becomes difficult to monitor the pods by running the kubectl get pod command as you will see too many evicted pods, which can be a bit confusing at times.


## tricks I'd like to know

- list all k8s artifacts using `apiVersion: *beta*z`