---
dg-publish: true
---
# Intro to gcloud

```shell
# list all projects you have access
gcloud projects list

# list IAM policy
gcloud projects get-iam-policy $PROJECT_NAME

# set a default config to create resources
# short example:
gcloud config set project $PROJECT_NAME
gcloud config set compute/zone us-east1-b
gcloud config configurations create project1-config
gcloud config configurations create project2-config
gcloud config configurations list
gcloud config configurations activate project1-config

# components
gcloud components list
gcloud components install $COMPONENT_NAME
gcloud components remove $COMPONENT_NAME
# it's useful to upodate in a regular basis
gcloud components update
```

## references

- [cloudacademy Introduction to Google Cloud SDK](https://cloudacademy.com/course/introduction-google-cloud-sdk-1675/using-google-cloud-sdk/?context_id=56&context_resource=lp)