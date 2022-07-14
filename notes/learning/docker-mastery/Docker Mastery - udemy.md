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
- [[Docker Basic Usage]]
- [[Running a shell inside containers]]
- [[Docker Mastery - Whats going on inside the containers]]
- [[Docker Networks]]
- [[Docker Container Images]]
- [[Dockerfile basics - Building Docker Images]]
- [[Docker Container Lifetime and Persistent Data]]
- [[Docker Compose]]



---

Troubleshooting problems with permissions in containers:
<https://www.udemy.com/course/docker-mastery/learn/lecture/31063670#questions>

---

## Intro

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

## Random thoughts about Docker

Main concepts here:

- immutable and ephemeral infrastructure
- container images are just files/binaries used to run an applicaation (kernel/drivers are provided by the host OS)
- UFS = Union File System
- each change in the file system creates a new layer
- container images are created in Dockerfiles
- to have persistent data we use volumes




