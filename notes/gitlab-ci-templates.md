# gitlab-ci templates

- <https://youtu.be/PkHt6jyMy7E?t=1320> (yeah, it starts at 22 minutes)

Steps:

TARGET DECK: DevOps/gitlab-ci

basic gitlab-ci template #flashcard 
1. Hide your job putting a dot in front of its name. Example:
```yaml
.deploy_template:
  stage: deploy
  script:
    - # something...
```
2. Extend the template in your actual job:
```yaml
deploy_prod:
  extends: .deploy_template
```

An example to deploy in different environments:

```yaml
###########
# template
###########
.deploy_template
  stage: deploy
  script:
    - # commands
    - deploy $TARGET_SERVER
  variables:
    TARGET_SERVER: ''


###########
# prod
###########
deploy_prod:
  extends: .deploy_template
  variables:
    TARGET_SERVER: example.com
  rules:
    - if: $CI_COMMIT_BRANCH == "master"


###########
# release
###########
deploy_release:
  extends: .deploy_template
  variables:
    TARGET_SERVER: release.example.com
  rules:
    - if: $CI_COMMIT_BRANCH =~ /^release.*/

###########
# dev
###########
deploy_release:
  extends: .deploy_template
  variables:
    TARGET_SERVER: dev.example.com
  rules:
    - if: $CI_COMMIT_BRANCH == "develop"
```