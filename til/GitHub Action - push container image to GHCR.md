---
dg-publish: true
---
# GitHub Action - push container image to GHCR

Simple #github actions workflow to push a container image to GitHub Container Registry:

```yaml
name: Build and Push container image

on:
  workflow_call:
  push:
    branches:
      - main

jobs:
  build_and_push:
    name: Build and Push container image
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write

    env:
      IMAGE_ID: ghcr.io/${{ github.repository }}:${{ github.run_id }}

    steps:
      - uses: actions/checkout@v4

      - name: Build container image
        run: docker image build --tag "${IMAGE_ID}" .

      - name: Log into GHCR
        run: |
          echo "${{ secrets.GITHUB_TOKEN }}" \
          | docker login https://ghcr.io -u "${{ github.actor }}" --password-stdin

      - name: Push image to GHCR
        run: docker image push "${IMAGE_ID}"
```


## references

- [Video](https://youtu.be/WjzA9dfk5w4?si=m-28Ccf25V7spYDd&t=110) (with incomplete workflow file)
- <https://stackoverflow.com/a/76610067>
