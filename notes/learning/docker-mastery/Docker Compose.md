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