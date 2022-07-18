---
dg-publish: true
---
# Docker - Starting a dev-mode container

We can achieve the development workflow by doing the following:

- mount our source into the container
- install all dependencies
- start nodemon to watch for filesystem changes

Let's do it:

1. remove previous `getting-startged` containers.
2. make sure you're in app's code directory.
3. run
```bash
docker run \
  -dp 3000:3000 \
  -w /app \
  -v "${PWD}:/app" \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```
4. you can watch the logs with `docker container logs -f <container-id>`
5. you can edit your code as you wish.
6. check the results of your changes.
7. once you're happy with your changes, build the new image with `docker image build ...`


## references

- <https://github.com/docker/getting-started>, running the tutorial container and reading "Using Bind Mounts" chapter