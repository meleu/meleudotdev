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


