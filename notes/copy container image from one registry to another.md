---
dg-publish: true
---
# copy container image from one registry to another

```sh
# install skopeo
sudo apt install skopeo

skopeo copy \
  docker://my-registry.com/my-app:my-tag \
  docker://another-registry.com/my-app:my-tag
```



## references

- <https://www.redhat.com/en/blog/skopeo-copy-rescue>


