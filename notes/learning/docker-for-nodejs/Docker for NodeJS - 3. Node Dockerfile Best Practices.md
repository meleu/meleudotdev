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



