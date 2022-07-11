---
dg-publish: true
---
# Docker Mastery

### course links

- <https://www.udemy.com/course/docker-mastery/>
- Course repository: <https://github.com/bretfisher/udemy-docker-mastery>
- Discord community: <https://discord.gg/AnP5pgM>


### contents

- [[Docker Installation - udemy]]
- [[Getting a shell inside containers]]
- [[Docker Networks]]
- [[Docker Container Images]]

---

## My goals

Besides the foundational knowledge needed to go on with kubernetes, I also want the docker knowledge to achieve these:

- use a `docker-compose` to make it simple to run the RetroAchievements website in a development environment.
- get the tools needed to deploy <https://docs.retroachievements.org/>.
- get the tools needed to deploy <https://news.retroachievements.org/>.
- create a network like the one illustrated in the first page of the book "TCP/IP Illustrated" (vol 1, 1st edition) by Richard Stevens.
- **ambitious**: get the tools needed to build RetroArch for Windows, Linux, Android, Raspberry Pi (ARM processors).

---


## Running a NginX container

```sh
# start a new container
docker container run --publish 80:80 nginx
# use the --detach option to run nginx in background

# list running containers
docker container ls
# old: docker ps
# also accepts the -a option

# stop a container
docker container stop 123
# the number at the end must be enough to be an unique ID
```

**Note:** `docker container run` always start a new container. Use `docker container start` to start an existing stopped one.

Starting a container with a custom name: use the `--name containerName` option.
```sh
docker container run --publish 80:80 --detach --name webhost nginx

# see the logs:
docker container logs webhost

# see the running processes
docker container top webhost
```

Removing containers:
```sh
docker container rm 123 456 789
# use 'rm -f' to force removal
```

## What happens in `docker container run nginx`

1. Looks for that image locally in image cache. If doesn't find anything...
2. Then looks in remote image repository (defaults to Docker Hub)
3. Downloads the latest version (nginx:latest by default)
4. Creates new container based on that image and prepares to start
5. Gives it a virtual IP on a private network inside docker engine
6. Opens up port 80 on host and forwards to port 80 in container
7. Starts container by using the CMD in the image Dockerfile

You can changes the defaults via command line arguments:
```sh
docker container run --publish 8080:80 --name webhost -d nginx:1.11 nginx -T
#  --publish 8080:80  # change host listening port
#  nginx:1.11         # change version of image
#  nginx -T           # change CMD to be launched on start
```


## What's going on in containers

- `docker container top`: process list in one container
- `docker container inspect`: details of one container config
- `docker container stats`: continuous monitor performance stats for all containers







## Building Images: The Dockerfile Basics

- The default filename is `Dockerfile`, but you can specify with `docker build -f <some-dockerfile>`.

```Dockerfile
# FROM tells which image we want to use as a base.
# a good reason to use debian, ubuntu, fedora, centos, etc. is to be
# able to use their package managers (`apt`, `yum`, etc.)
FROM debian:stretch-slim

# ENV is used to set environment variables
# that's the preferred way to inject key/value into a container
ENV NGINX_VERSION 1.13.6-1~stretch

# RUN is used to execute shell commands inside the container
# pro-tip:  use && to chain multiple relative commands in order avoid
#           creating multiple unnecessary layers (saves time and space)
RUN apt-get update && apt-get install -y something...

# It's also a good practice to spit logs in stdout/stderr
# The line below forwards request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# EXPOSE sets the port to be exposed (by default there's no port being exposed)
# you still need to use -p or -P to open/forward these ports on host
EXPOSE 80 443

# CMD required. It's the final command that will be run everytime you
# launch a new container from the image or start a stopped one.
# only one CMD is allowed, so if there are multiple, last one wins
```

## Buildiung Images: Running Docker Builds

```sh
# build a new image from Dockerfile present in the current directory
# and tag it as 'customnginx'
docker image build -t customnginx .
```

## Building Images: Extending Official Images

```Dockerfile
# extending an existing official image from Docker Hub

FROM nginx:latest
# it's hightly recommended to always pin versions for anything beyond dev/learn

WORKDIR /usr/share/nginx/html
# change working directory to root of nginx webhost,
# it's a preferred method than using 'RUN cd /some/path'

# COPY <source> <destination>
COPY index.html index.html
# some notes about COPY:
# - <source> path must be inside the context of the build (you can't use '..')
# - if <source> is a directory, the entire contents of it is copied
# - for more info check <https://docs.docker.com/engine/reference/builder/#copy>

# no need to specify EXPOSE or CMD as they're already set in the FROM image
```


