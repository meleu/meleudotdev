---
dg-publish: true
---
## Docker Networks

- From [[Docker Mastery - udemy]]

### Concepts

- Quick port check: `docker container port <containerName>`.
- Each container connected to a private virtual network "bridge".
- Each virtual network routes through NAT firewall on host IP.
- All containers on a virtual network can talk to each other without `-p`.
- Best practice is to create a **new virtual network for each app**:
    - network `my_web_app` for mysql and php/apache containers
    - network `my_api` for mongo and nodejs containers
- Make new virtual networks (one per app).
- Attach containers to more than one virtual network (or none).
- Skip virtual networks and use host IP (`--net=host`) - less secure, use with caution.
- Use different Docker network drivers to gain new abilities.

### Commands

```sh
# show networks
docker network ls

# inspect network
docker network inspect <networkName>

# create a network
docker network create <newNetworkName>

# attach a network to container
docker network connect <networkName> <containerName>

# detach a network from container
docker network disconnect <networkName> <containerName>
```

Other command tricks:
```sh
# which containers are connected to a specific network:
docker network inspect <networkName> | jq '.[].Containers'

# which networks the container is connected to
docker container inspect <containerName> | jq '.[].NetworkSettings.Network'
```

### DNS

Containers are constantly launching and disappearing, so forget about IPs. Static IPs and using IPs for talking to containers is an anti-pattern. Do your best to avoid it.

Fortunately the Docker daemon has a built-in DNS server that containers use by default. It defaults the hostname to the container's name, but you can also set aliases.

**Note**: the default `bridge` network does NOT have the DNS built-in by default. So, it's better to create a new network.

Example:
```sh
# creating a new network
docker network create NewNetwork

# creating two containers connected to NewNetwork
docker container run -d --name container1 --network NewNetwork alpine sleep 1000
docker container run -d --name container2 --network NewNetwork alpine sleep 1000

# it's possible to ping one each other using the container name
docker container exec -it container2 ping container1
```

### Assignment: DNS Round Robin Test

- Since Docker 1.11 we can have multiple containers on a created network responde to the same DNS address.
- Create a new virtual network.
- Create two containers from `elasticsearch:2` image.
- Research and use `--network-alias search` when creating them to give them an additional DNS name to respond to.
- Run `alpine:3.10 nslookup search` with `--net` to see the two containers list for the same DNS name.
- Run `centos:7 curl -s search:9200` with `--net` multiple times until you see both "name" fields show.

**Note**: due to a [bug introduced in alpine 3.11.3](https://github.com/gliderlabs/docker-alpine/issues/539), use `alpine:3.10`.

#### Assignment solution

```bash
# create a network
docker network create elastic

# create two containers, connected to the new
# network and with a network alias.
docker container run \
  --detach \
  --network elastic \
  --network-alias search \
  --name esearch1 \
  elasticsearch:2
docker container run \
  --detach \
  --network elastic \
  --network-alias search \
  --name esearch2 \
  elasticsearch:2

# check the DNS with alpine
docker container run \
  --rm \
  --network elastic \
  alpine:3.10 \
  nslookup search
# it should show the IPs of both containers
# esearch1 and esearch2

# check with curl using centos
docker container run \
  --rm \
  --network elastic \
  centos:7 \
  curl -s search:9200
# try this 👆 command a few times and see
# that it randomly gets response from different
# containers (check the 'name' property).

# to conclude, just remove the containers
docker container rm -f esearch1 esearch2
```



