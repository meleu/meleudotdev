---
dg-publish: true
tags:
  - tech/docker
---
# Docker Reverse Engineering


Use `dfimage` to "reverse engineer" the Dockerfile.

```bash
# "install" dfimage
docker pull ghcr.io/laniksj/dfimage
alias dfimage='docker container run --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/laniksj/dfimage'

# the image you want to analyze MUST be present locally
docker image pull ${image}:${tag}

# when passing the image, you MUST specify the tag
dfimage ${image}:${tag}
```

 It won't be explicit. Inconsistencies you may find:
 
  - it'll show some hashes instead of filenames
  - it won't show the image used as a base (the image in the `FROM`)
  - right after the `FROM` it'll show an `ADD` directive, that probably is not useful for our purposes

The resulting Dockerfile is still enigmatic, then we'll use `dive` to analyze each layer and check which files were changed on each layer.

```bash
# "install" dive
docker image pull wagoodman/dive:latest
alias dive='docker container run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest'

# run it
dive ${image}:${tag}
```

Check the hotkeys in the bottom and find a way to filter only changes for each layer.

## references

- <https://havdevops.com/Reverse-Engineer-Docker-Images-into-Dockerfiles/>
- <https://github.com/LanikSJ/dfimage>
- <https://github.com/wagoodman/dive>

## see also

maybe this app can also be useful for docker image analysis: <https://github.com/justone/dockviz>
