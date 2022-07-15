---
dg-publish: true
---
# Docker Compose

Why Docker Compose?

- to configure relationships between containers
- save our docker container run settings in yaml file
- startup an environment with a simple command


Docker Compose is comprised of 2 related things:

1. a yaml file describing options for:
    - containers
    - volumes
    - networks
2. a CLI tool `docker-compose` used to read the yaml file.

For practicing, clone the [course's repo](https://github.com/BretFisher/udemy-docker-mastery) and check the `compose-sample-2/` directory. The `docker-compose.yml` contains configs for an nginx container, to run as a proxy for an apache server, acting as a web server.



