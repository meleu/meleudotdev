---
dg-publish: true
---

# GKE Ingress

- <https://cloud.google.com/kubernetes-engine/docs/concepts/ingress>

> When you create an Ingress object, the [GKE Ingress Controller](https://github.com/kubernetes/ingress-gce) creates a [Google Cloud HTTP(S) Load Balancer](https://cloud.google.com/load-balancing/docs/https) and configures it according to the information in the Ingress and its associated Services.

> [Ingress for external and internal traffic](https://cloud.google.com/kubernetes-engine/docs/concepts/ingress#ingress_for_external_and_internal_traffic)
> 
> GKE Ingress resources come in two types:
> 
> Ingress for External HTTP(S) Load Balancing deploys the global external HTTP(S) load balancer (classic). This internet-facing load balancer is deployed globally across Google's edge network as a managed and scalable pool of load balancing resources. Learn how to set up and use Ingress for HTTP(S) Load Balancing.
> 
> Ingress for Internal HTTP(S) Load Balancing deploys the internal HTTP(S) load balancer. These internal HTTP(S) load balancers are powered by Envoy proxy systems outside of your GKE cluster, but within your VPC network. Learn how to set up and use Ingress for Internal HTTP(S) Load Balancing.