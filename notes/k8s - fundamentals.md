---
dg-publish: true
---
# k8s - fundamentals

I've noticed that what I knew as "Master Node" is now known as "Control Plane".

## Labels

Labels are key/value pairs attached to objects and can be used in any number of ways:

-   Designate objects for development, test, and production
-   Embed version tags
-   Classify an object using tags


## Services

The way to expose your Pods to the "outside world" (hosts from the outside of your cluster).

Types:

- ClusterIP (default)
- NodePort
- LoadBalancer
- ExternalName

A Service routes traffic across a set of Pods.

Services are the abstraction that allows pods to die and replicate in Kubernetes without impacting your application.

Services match a set of Pods using **labels** and **selectors**.

### See also

- <https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/>


## Ingress

The yaml file we usually write with `kind: Ingress` are actually known as "Ingress Resources" ([docs](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource)). For it to work properly the cluster must have an [Ingress Controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/).

![[k8s-ingress.png]]

Useful article for when working with GKE: <https://cloud.google.com/community/tutorials/nginx-ingress-gke>

Good video explaining it:

<iframe width="560" height="315" src="https://www.youtube.com/embed/80Ew_fsV4rM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>




## references

- <https://kubernetes.io/docs/tutorials/kubernetes-basics/expose/expose-intro/>
