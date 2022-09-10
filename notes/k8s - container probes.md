---
dg-publish: true
---
# k8s - container probes

The liveness, readiness and startup probe are configured **per container** (not per Pod).

- `livenessProbe`
    - why?: to know when to restart a container.
    - if successful: do nothing.
    - if fails: restart the container.
    - **default behavior: ???**
    - question: it restarts the specific container or all containers in the Pod?
- `readinessProbe`
    - why?: to know when a container is ready to accept traffic.
    - if successful: tells to load balancer the Pod is ready to receive requests.
    - if successful: tells to load balancer to not send requests to this Pod.
    - **default behavior: ???**
- `startupProbe`
    - why?: to know when a container app has started, and then kubelet can start running the liveness and readiness probes.
    - if successful: enables liveness and readiness probes.
    - if fails: the container is killed and subject to the pod's `restartPolicy`
    - default behavior: run livenessProbes right after the container is started



## references

- <https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/>