---
dg-publish: true
---
# GitLab CI/CD - From Zero to Hero

by Nana

<https://techworld-with-nana.teachable.com/courses/enrolled/1769488>

---

## Things to try at work

- deploy jobs should have the name of the environment (dev/stage/us-prod/ca-prod)
- tests generating a JUnit report <https://www.npmjs.com/package/jest-junit>
- integrate the JUnit report with GitLab's UI <https://docs.gitlab.com/ee/ci/yaml/artifacts_reports.html#artifactsreportsjunit>
- use the environment keyword in the deploy job <https://docs.gitlab.com/ee/ci/yaml/#environment>
- use the `artifacts:report:dotenv` to pass environment variables to the next stages/jobs <
- use cache based on `package.json` (depends on removing tests from cloudbuild)
    - <https://docs.gitlab.com/ee/ci/caching/>
    - advanced `config.toml` configuration: <https://docs.gitlab.com/runner/configuration/advanced-configuration.html>
- use GitLab's SAST (but with `allow_failure`): <https://docs.gitlab.com/ee/user/application_security/sast/>
    - I've noticed in the `gl-sast-report.json` that some vulnerabilities were found but the job finished successfully.


---


Nothing really new for me in sections 1, 2 and 3.

- [[4 - GitLab Architecture]]
- [[5 - CI-CD pipeline for Node.js Application]]
- [[6 - Optimize CI-CD Pipeline & Configure Multi-Stage Pipeline]]
- [[7 - CI-CD MicroService Application (Mono and Polyrepo)]]

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

