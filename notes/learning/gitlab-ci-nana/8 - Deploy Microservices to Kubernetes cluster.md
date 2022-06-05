---
dg-publish: true
---
## 8 - Deploy Microservices to Kubernetes cluster

- <https://techworld-with-nana.teachable.com/courses/1769488/lectures/39916960>
- Useful lecture when not using ArgoCD

Create a Namespace and a ServiceAccount for the namespace:
```bash
# create the namespace "my-microservice"
kubectl create namespace my-microservice

# serviceaccount name: "cicd-saa"
kubectl create serviceaccount cicd-sa --namespace=my-microservice
```


```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: my-microservice
  name: cicd-role
rules:
- apiGroups [""]
  resources:
  - pods
  - services
  - secrets
  verbs:
  - get
  - list
  - watch
  - create
  - update
  - patch
  - delete
- apiGroups 
  - extensions
  - apps
  resources:
  - deployments
  verbs:
  - get
  - list
  - watch
  - create
  - update
  - patch
  - delete
```

Associate a ServiceAccount with a Role:
```bash
# We must define
# 1. Role
# 2. ServiceAccount
# 3. Namespace
kubectl create rolebinding cicd-rb \
  --role=cicd-role \
  --serviceaccount=my-microservice:cicd-sa \
  --namespace=my-microservice
```

ServiceAccount -> RoleBinding -> Role


### 4 - Deploy to Kubernetes (part 1)

This trick to get the docker-registry credentials is interesting:
```yaml
deploy:
  script:
  - kubectl create secret docker-registry m6-registry-key --docker-server=$CI_REGISTRY --docker-username=$GITLAB_USER --docker-password=$GITLAB_PAASSWORD -n my-microservice --dry-run=client -o yaml | kubectl apply -f -
```

