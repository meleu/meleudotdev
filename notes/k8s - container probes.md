---
dg-publish: true
---
# k8s - container probes

The liveness, readiness and startup probe are configured **per container** (not per Pod).

- `livenessProbe`
    - why?: to know when to restart a container.
    - on success: do nothing.
    - on failure: restarts the container.
    - default behavior: same as success
- `readinessProbe`
    - why?: to know when a container is ready to accept traffic.
    - on success: tells to load balancer the Pod is ready to receive requests.
    - on failure: tells to load balancer to not send requests to this Pod.
    - default behavior: same as success
- `startupProbe`
    - why?: to know when a container app has started, and then kubelet can start running the liveness and readiness probes.
    - on success: enables liveness and readiness probes.
    - on failure: restarts the container
    - default behavior: same as success

| probe                | liveness                                            | readiness                                             | startup                                                  |
| -------------------- | --------------------------------------------------- | ----------------------------------------------------- | -------------------------------------------------------- |
| **why?**             | when to restart a container                         | when a container is ready to receive traffic          | when kubelet can start running liveness/readiness probes |
| **when?**            | after startupProbe and then continuously            | after startupProbe and then continuously              | after container starts / stops after success or failure  |
| **success**          | do nothing                                          | tells the load balancer it's ready to receive traffic | tells kubelet to start running liveness/readiness probes |
| **failure**          | container killed and restarted (see: restartPolicy) | tells load balancer to stop sending traffic           | container killed and restarted (see: restartPolicy)      |
| **default** | same as success                                     | same as success                                       | same as success                                        |



## references

- <https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/>
- <https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#types-of-probe>