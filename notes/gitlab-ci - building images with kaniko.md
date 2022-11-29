---
dg-publish: true
---
# gitlab-ci - building images with kaniko

já fiz isso e esqueci de anotar algumas coisas que eu gostaria de ter a resposta ao alcance aqui nas minhas anotações. Por exemplo:

- pq precisa `kaniko:debug`?
- pq precisa de `entrypoint: [""]`?
- pq precisa de `--context`?


## check if image exists before building it

- from [kaniko issue tracker](https://github.com/GoogleContainerTools/kaniko/issues/958#issuecomment-1078712894)

Create a custom kaniko image with [crane](https://github.com/google/go-containerregistry/tree/main/cmd/crane):
```Dockerfile
FROM gcr.io/go-containerregistry/crane:v0.8.0 as crane

FROM gcr.io/kaniko-project/executor:v1.8.0-debug

COPY --from=crane /ko-app/crane /usr/local/bin/
```

Call the following before `/kaniko/executor` but after setting up the registry credentials:
```shell
crane manifest ${IMAGE} && echo "image already exists"
```


## references

- <https://docs.gitlab.com/ee/ci/docker/using_kaniko.html>