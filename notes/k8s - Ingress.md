---
dg-publish: true
---
# k8s - Ingress

- An Ingress Controller is a set of Deployment+Service (type LoadBalancer)
- The `kind: Ingress` files are known as Ingress Resources 
- Ingress Resources
    - is a collection of rules for the inboud traffic to reach Services
    - define rules to be "consumed" by the Ingress Controller
- Interesting: When using NginX as Ingress Controller, the rules defined in the Ingress Resources are converted into NginX configurations inside `/etc/nginx/conf.d`

## Good docs

1. https://devopscube.com/kubernetes-ingress-tutorial/
2. https://devopscube.com/setup-ingress-kubernetes-nginx-controller/
3. https://devopscube.com/configure-ingress-tls-kubernetes/

## Tips & Tricks

Create an ingress resource from command line:
```bash
kubectl create ingress INGRESS-NAME \
  --rule=HOST/PATH=SERVICE_NAME:PORT \
  --dry-run=client -o yaml > INGRESS-NAME.yaml
```


## Ingress with NginX controller on GKE

- <https://cloud.google.com/community/tutorials/nginx-ingress-gke>

Summing up:
```bash
# requirements
# - able to 'kubectl' the cluster
# - helm installed

# add the helm repo
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# install it on the cluster
helm install nginx-ingress ingress-nginx/ingress-nginx

# check if they're installed
kubectl get svc,deployment nginx-ingress-ingress-nginx-controller

# wait a few minutes and check if an external IP was allocated to the Service
kubectl get service nginx-ingress-ingress-nginx-controller
```

**IMPORTANT**: Create the Ingress Resources with the following annotations:
```yaml
metadata:
  annotations:
    kubernetes.io/ingress.class: "nginx"
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
```

There's a trick to use `[ANY-IP].nip.io` to get `[ANY-IP]`.


## How does an Ingress Controller work?

Example of NginX ingress controller implementation.

![[k8s - Ingress.png]]

1. The `nginx.conf` file inside NginX controller pod is a lua template that can talk to the Kubernetes Ingress API and get the latest values for traffic routing in real time.
2. The NginX controller talks to Kubernetes Ingress API to check if there is any rule created for traffic routing (aka Ingress objects).
3. If it finds any ingress rules, the NginX controller generates a routing configuration inside `/etc/nginx/conf.d` location inside each nginx pod.
4. For each ingress resource you create, NginX generates a configuration inside `/etc/nginx/conf.d` location.
5. The main `/etc/nginx/nginx.conf` file contains all the configurations from `/etc/nginx/conf.d`.
6. If you update the ingress object with new configurations, the NginX config gets updated again and does a graceful reload of the configuration.

If you connect to the NginX ingress controller pod using `exec` and check the `/etc/nginx/nginx.conf` file, you can see all the rules specified in the ingress object applied in the conf file.


## references

- <https://devopscube.com/kubernetes-ingress-tutorial/>
