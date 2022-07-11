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
- [[Running a shell inside containers]]
- [[Docker Networks]]
- [[Docker Container Images]]
- [[Dockerfile basics - Building Docker Images]]

---

## New Intro

The 3 docker innovations:

- docker image
- docker registry
- docker container


Major Linux features used by Docker:

- Namespaces
- cgroups
- veth
- iptables
- union mount


Why Docker? Why now?

3 reasons:

- isolation: better isolation in a single OS
- environments: reduced environment variances
- speed: increase speed of change



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






