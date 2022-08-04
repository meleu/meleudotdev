---
dg-publish: true
---
## Docker for NodeJS - 3. Node Dockerfile Best Practices

- back to [[Docker for NodeJS]]

### Dockerfile Best Practice Basics

- use `COPY`, not `ADD`
- use the `npm` or `yarn` that comes with the image (do not reinstall them unnecessarily)
- `RUN npm install && npm cache clean --force` so the image is small as possible
- to launch your app with `CMD` use `node`, not `npm`.
    - Reasoning: using `npm` is bad because it...
        - requires another application to run
        - is not as literal in Dockerfiles (what actually runs is in the `package.json`)
        - doesn't work well as an init or PID 1 process - [[linux - why PID 1 is so important]]?
- use `WORKDIR`, not `RUN mkdir` (unless you need `chown`)


### FROM Base Image Guidelines

"The most important line in your Dockerfile"

Note: these guidelines refers to the use of the `node` image.

- stick to even numbered major releases
- start with Debian-based images if you're containerizing an application
- move to alpine later
- don't use
    - `:latest`
    - `:slim`
    - `:onbuild`


### Assignment: Making a CentOS Node Image

This is an interesting exercise to create a Node image based on a not officially available base distro.

https://www.udemy.com/course/docker-mastery-for-nodejs/learn/lecture/13545434

The usefulness of the assignment is not exactly related to Node neither CentOS, but how to research things to build custom images.


### Running non-root containers users

"Least privilege security with node user"

- official `node` images **have** a node user
- but it's not used by default (because usually you want to `apt install`, or `npm install --global`).

The trick below should be done:

- after `apt`, `apk` and `npm i -g`
- before `npm i`
- it may cause permissions issues with write access
- may require `chown node:node`

```Dockerfile
# This is how to set `node` as the user
USER node

# After that, the RUN, CMD, and ENTRYPOINT run as the `node` user.
# This 👆 causes an issue when you use WORKDIR to create a directory.
# The workaround is to use this:
RUN mkdir directory && chown -R node:node .
```

If this causes permissions issues when using `docker-compose`, call it like this:
```bash
docker compose exec -u root
```

> [!important]
> After `USER node`, all executions of `RUN`, `CMD` and `ENTRYPOINT` run as the `node` user. All the other Dockerfile instructions are executed as `root`.
> 
> This [video lecture](https://www.udemy.com/course/docker-mastery-for-nodejs/learn/lecture/14274050) is useful to show this behavior.


### Making Images Efficiently

- Pick proper `FROM` (preferably an alpine based image)
- Line order matters
    - Things that rarely change should come at the top
- `COPY` twice: `package.json` then `. .`
- installations with `apt`/`apk` should come at the top

Look at this example:
```Dockerfile
# if this comes first, it'll be recreated a lot of times
COPY . .
RUN npm install && npm cache clean --force
```

You should do this instead:
```Dockerfile
# 1. copy only the "dependencies file"
COPY package.json package-lock.json* ./

# 2. install the dependencies
RUN npm install && npm cache clean --force

# 3. copy your code
COPY . .
```

Pro-tip: using `package-lock.json*` (with the trailing asterisk) makes the build NOT break if the file doesn't exist.

