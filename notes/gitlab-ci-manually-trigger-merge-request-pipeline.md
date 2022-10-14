---
dg-publish: true
---
# gitlab-ci-manually-trigger-merge-request-pipeline

```bash
token='...' # permissions needed: api and read_api
gitlabServer='https://my-gitlab/'
projectId='123'
mergeRequestId='321'

curl \
  --silent \
  --request POST \
  --header 'PRIVATE-TOKEN: ${token} \
  "https://${gitlabServer}/api/v4/projects/${projectId}/merge_requests/${mergeRequestId}/pipelines"
```

## references

- <https://docs.gitlab.com/ee/api/merge_requests.html#create-mr-pipeline>
