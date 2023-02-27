---
dg-publish: true
---
# Node JS

Cool playlist with Node.JS contents related to DevOps topics (containers, CI pipelines, etc.).

https://youtube.com/playlist?list=PL5Dc_611BqV1kvspy-QqAk_xMniaojPRt

## Why you should always set `NODE_ENV` in your production node.js docker images

[video](https://youtu.be/FFAWp9qoX4M)

1. Size
2. Security
3. Performance

When using `NODE_ENV=production` npm doesn't install the devDependencies. Looks like it has the very same result as using `--production` option.