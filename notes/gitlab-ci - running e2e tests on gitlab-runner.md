---
dg-publish: true
---
# gitlab-ci - running e2e tests on gitlab-runner

We were running e2e tests on cloudbuild. In cloudbuild we use a `docker-compose.yml`.

I learned that it's possible to launch those containers in gitlab-ci using [services](https://docs.gitlab.com/ee/ci/services/). This [article here](https://medium.com/@datails/e2e-test-apis-using-docker-and-gitlab-ci-ebbd0209c7a9) was really useful to take the first steps using this approach.

I've failed to complete the task because the worker-nodes of our k8s cluster doesn't have enough memory. Maybe if we had worker nodes with 8Gi of RAM, it would be possible.

**TODO**: create a convincing message that we should have more powerful machines in our node-pool. It means that we could decrease the amount of nodes, therefore the cost would be the same.

#### challenges I faced

- convert from `docker-compose.yml` to `.gitlab-ci.yml`
- configs for elasticsearch container in `.gitlab-ci.yml` has its peculiarities for passing arguments
- elasticsearch was breaking due to OOM problems (after all, it's a Java app)
- I tweaked the gitlab-runner configs (in the `values.yaml`) to allow overwriting memory requests/limits
- when trying to allocate more memory for the elasticsearch service, it wasn't possible to run the Pod in our current k8s cluster, because the worker nodes have only 2.95Gi of allocatable memory.



##### elasticsearch arguments

I struggled with elasticsearch configs, as in `docker-compose.yml` it accepts things like:

```yaml
evironment:
  - node.name=elastic
  - discovery.type=single-node
  - ...
```

But in `.gitlab-ci.yml` it's not possible to define variables with a `.` dot. I found the solution [here](https://gitlab.com/gitlab-org/gitlab-foss/-/issues/42214#note_74842882).


##### tweaking gitlab-runner to allow overwrite memory request/limit

- documentation: <https://docs.gitlab.com/runner/executors/kubernetes.html#overwriting-container-resources>

Pay special attention at the very last sentence of that section:

> [!attention]
> **If the max overwrite has not been set for a resource, the variable is ignored.**

So, I had to add `*memory_[request|limit]_overwrite_max_allowed` in the `values.yaml` of the gitlab-runner ([related documentation](https://docs.gitlab.com/runner/executors/kubernetes.html#the-available-configtoml-settings)).

With this configuration we can overwrite the memory request/limit in the `.gitlab-ci.yml` using variables like:

```yaml
variables:
  KUBERNETES_SERVICE_MEMORY_REQUEST: 400Mi
  KUBERNETES_SERVICE_MEMORY_LIMIT: 400Mi
  KUBERNETES_MEMORY_REQUEST: 1100Mi
  KUBERNETES_MEMORY_LIMIT: 1100M
```


##### k8s worker nodes doesn't have enough memory

Even after going through all these 👆 obstacles, in the end I wasn't able to run the e2e test on gitlab-runner because the k8s worker node doesn't have enough memory to run this setup 😔



## references

- <https://medium.com/@datails/e2e-test-apis-using-docker-and-gitlab-ci-ebbd0209c7a9>