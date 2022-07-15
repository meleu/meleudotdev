---
dg-publish: true
---
# Docker Container Lifetime and Persistent Data

## Overview

- Defining the problem of persistent data
- Key concepts with containers: immutable, ephemeral
- Learning and using Data Volumes
- Learning and using Bind Mounts

#### See also

- [File permissions across multiple containers](https://www.udemy.com/course/docker-mastery/learn/lecture/31063670#questions)
- [An introduction to immutable infrastructure](https://www.oreilly.com/radar/an-introduction-to-immutable-infrastructure/)

## Container Lifetime & Persisitent Data

Containers are meant to immutable and ephemeral. In the ideal scenario the "immutable infrastructure" only re-deploy containers, but never change (unless a new image is created).

But what about databases or unique data?

Fortunately Docker gives us some features to ensure these "separation of concerns" (application vs. data):

1. volumes: make special location outside of container UFS
2. bind mounts: link container path to host path


### Volumes

**Pro-tip**: researching the Dockerfile of a database image (like mysql or postgresql) can be a good inspiration, as they probably follow "best-practices".

We can see [in the mysql:debian Dockerfile](https://github.com/docker-library/mysql/blob/6cb73371396bdfcc048a701fa4a4c9e3eee4fde4/8.0/Dockerfile.debian#L88) that it creates a `VOLUME` for `/var/lib/mysql`.

```bash
# let's create a container:
docker container run \
  --detach \
  --name mysql \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
  mysql:debian

# check if it's running
docker container ls

# inspecting the container
docker container inspect mysql
# look for Config.Volumes and Mounts
# In the "Mounts", you'll see a property
# with Type: volume. The "Source" is where
# the data is placed in the host OS, and
# the "Destination" is the path inside the
# container.

# list the volumes
docker volume ls
# tip: you'll probably want to do a
# `docker volume prune` sometimes.

# inspecting the volume (use <tab> for autocompletion)
docker volume inspect <tab><tab>
# in the "Mountpoint" you'll see where the
# data lives in the host OS.
```

**Problem**: if you create a new container with a new volume, it'll create a volume with a random hash, and it's hard to know which volume is being used by which container.

**Solution**: _named volumes_

With named volumes you can delete the container and keep the data and then reuse the data in different containers.

Example:
```bash
# let's create a mysql container with
# a named volume 'mysql-db'
docker container run \
  --detach \
  --name mysql \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
  -v mysql-db:/var/lib/mysql \
  mysql:debian

# inspect the container's Mounts
docker container inspect mysql
# check that it says
# "Source": "/var/lib/docker/volumes/mysql-db/_data"

# delete the container
docker container rm -f mysql

# list the volume and confirm the volume still exists
docker volume ls
# it should list the volume 'mysql-db'

# create a new container using the 'mysql-db' volume
docker container run \
  --detach \
  --name new-mysql \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
  -v mysql-db:/var/lib/mysql \
  mysql:debian
```

**Note**: There are cases where we may want to create the named volume before the `docker container run` command. For this, use the `docker volume create` command.


### Bind Mounting

- Maps a host file/dir to a container file/dir
- Skips UFS, and host files overwrite any file in container
- Can't be defined in `Dockerfile`, only in `docker container run`.

