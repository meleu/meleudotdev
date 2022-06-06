---
dg-publish: true
---
# Successful Kubernetes Development Workflows - Ellen Körbes

- <https://youtu.be/9csPAXYEf7M>

## protagonists

- datadog
    - 800 devs
- unu
    - 25 engineers
- mindspace
    - 4 engineers
- cluster api
    - 230+ contributors

## development cluster

> If your code is meant to run on kubernetes and you're developing on localhost (or docker without a cluster) and you don't really run your code on kubernetes in this part of development, you're just settint a setup for a headache.

- datadog
    - self-managed cluster on public cloud
    - 300+ services - won't fit a laptop

- mindspace
    - microk8s on linux

- unu
    - docker for mac (troublesome)
    - hitting limits!

- cluster api
    - use **kind** as the local dev cluster


### takeaway

- small companies -> local cluster
- big companies -> remote cluster

Local clusters are easier to start, and companies migrate to remote once things don't fit a laptop anymore.
    
    
## managing config files

13:55 - You should use a template solution.

- datadog
    - helm templates

- mindspace
    - helm templating creates yaml
    - helm is further automated with Tilt

- unu
    - helm templating
    - semi-custom Tilt/bash yaml generator

- cluster api
    - kustomize templating

### takeaways

**Everyone uses a templating solution**

Almost everyone uses Helm templates.




## feedback loop

Roughly, we want the following operations to be automatic:

- docker build
- docker push
- kubectl apply

- datadog
    - rolling out Tilt
    - Tilt wraps Helm

- unu
    - Tilt + tons of automation

- Mindspace
    - Tilt

- cluster api
    - Tilt



### takeaways

- Pattern:
    - Uniform services fit a common structure, and allow for recycling configs, live reload settings, etc.
    - DevEx teams automate everything



## problem solving

- datadog & unu
    - no debuggers. output to logs, then use tracing

- mindspace
    - remote debugging (hard)

- cluster api
    - debugging: printlines - no support for debuggers
    - quick feedback loop means this is fine


### takeaways

- integration with tracing (datadog & unu) and debugging tools (mindspace) is still rare but growing.


## problem solving

copy&paste logs is naive

- datadog
    - devs work in public, shareable namespaces
    - use wrapper tool to switch namespaces
    - any dev can access another dev's namespace

- mindspace
    - no need for high-tech when it's a small team sharing the same office

- cluster api
    - snapshots

### takeaways

- big companies: you have a namespace and your colleague logs into it
- middle ground: snapshots
- small companies: analog solutions


## custom workflows

- there's no ideal workflow
- everyone needs their own setup
- kubernetes won because it's flexible
- helm/kustomize integration

