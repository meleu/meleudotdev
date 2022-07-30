## Docker for NodeJS - 3. Node Dockerfile Best Practices

### Dockerfile Best Practice Basics

- use `COPY`, not `ADD`
- use the `npm` or `yarn` that comes with the image (do not install them unnecessarily)
- `RUN npm install && npm cache clean --force` so the image is small as possible
- to launch your app with `CMD` use `node`, not `npm`.
    - Reasoning: using `npm`...
        - requires another application to run
        - not as literal in Dockerfiles (what actually runs is in the `package.json`)
        - doesn't work well as an init or PID 1 process - [[linux - why PID 1 is so important]]?
- use `WORKDIR`, not `RUN mkdir` (unless you need `chown`)


### FROM Base Image Guidelines

