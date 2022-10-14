---
dg-publish: true
---
# gcloud

## Install via Dockerfile

Single `RUN` step to install in a debian-based image:
```
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
  | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
  && apt-get update -y \
  && apt-get install google-cloud-sdk -y
```


## get the list of clusters

```bash
# output in human-friendly format
gcloud container clusters list

# output in json
gcloud container clusters list --format=json

# only clusters name
gcloud container clusters list --format=json \
  | jq '.[].name'
```