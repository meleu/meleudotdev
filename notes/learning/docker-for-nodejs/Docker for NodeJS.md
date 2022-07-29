---
dg-publish: true
---
# Docker for NodeJS

- Udemy Course: <https://www.udemy.com/course/docker-mastery-for-nodejs/>
- Repo with course resources: <https://github.com/BretFisher/docker-mastery-for-nodejs>

---


## Docker for NodeJS - 2. Docker Compose Basics

The instructor recommends that in day to day activities we should be using docker-compose YAML files instead of complex docker commands on terminal.

The first insight I had (as a DevOps Eng.), was to have a docker-compose setup for each job on a pipeline. Being able to quickly reproduce the pipeline locally.

### docker-compose up

- build/pull image(s) if missing
- create volume/network/container(s)
- starts container(s) in foreground (`-d` to detach)
- `--build` to always build


### docker-compose down

- stop and delete network/container(s) (keeps the volumes by default)
- use `-v` to delete volumes


### docker-compose ...

- many commands take "service" name as option (not the container name)
- `build` just [re]build image(s)
- `stop` just stop containers, don't delete
- `ps` list "services"
- `push` images to registry
- `logs` same as docker CLI
- `exec` same as docker CLI

