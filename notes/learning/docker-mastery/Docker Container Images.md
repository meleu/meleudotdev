---
dg-publish: true
---
## Container Images

- from [[Docker Mastery - udemy]]

What's in an image?

- App binaries and dependencies.
- Metadata about the image data and how to run the image.
- Official definition:
    - "An image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime."


### Docker Hub

Official docker registry: <https://hub.docker.com>


### Image Layers

Union File System - making layers about the changes.

Fundamental concept of cache of image layers: An image can have a change on top of the same layer already present in the cache. It saves a lot of time and space, because there's no need to download layers already present in cache. Remember: it uses a unique SHA for each layer so it's guaranteed to be the exact layer it needs.

Biggest benefits: we're never storing the same image data more than once in our file system. It also means that when we're up/downloading, we don't need to up/download the same layers already present on the other side.

#### Copy on Write

When running a container you have a "living" layer on top of the previous one. And when you change something in the filesystem, the changed file is copied from the original layer into the contaner's one. This technique is called **Copy on Write**.


#### image `history` and `inspect` commands

Checking the history of layers:
```sh
# show layers of changes made in image
docker image history nginx:latest
docker image history mysql
```

Inspecting an image:
```sh
docker image inspect nginx
```

It shows some useful information, specially in `ContainerConfig`. Examples:

- exposed ports (which you may probably `--publish`)
- environment variables
- command to be ran by default when starting a container with this image


#### Review

- Images are made up of file system changes and metadata.
- Each layer is uniquely identified and only stored once on a host.
- This saves storage space on host and transfer time on push/pull.
- A container is just a single read/write layer on top of image.
- `docker image history` and `inspect` can show useful info about images and its layers.

**Read more**: <https://docs.docker.com/storage/storagedriver/>


## Image Tagging

`<user>/<repo>:<tag>`

- default tag is `latest` if not specified.
- `latest` usually means the latest stable version of an image.
- `<user>` can be omitted for "official" images.

```sh
# tagging an image
docker image tag <orignalImage> <hubUser>/<repo>:<tag>

# example (remember: default tag is latest)
docker image tag nginx meleu/nginx

# login to the registry (default is Docker Hub, but you
# can override by adding server URL)
docker login

# check your credentials:
cat .docker/config.json

# don't forget to logout when using machines not owned by you
# docker logout

# uploading it to Docker Hub
docker image push meleu/nginx

# tagging another image
docker image tag meleu/nginx meleu/nginx:testing
docker image push meleu/nginx:testing
```

**Note**: in order to create a private repo for your images, you need create it on the Docker Hub website first, before uploading it.