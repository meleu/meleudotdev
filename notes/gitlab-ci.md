---
dg-publish: true
---
# gitlab-ci

## learn

- [[GitLab CICD - Nana course]]
- [[gitlab-ci-udemy]]
- <https://www.youtube.com/playlist?list=PLu-nSsOS6FRLA_6gcYKS0lGzZ4dkracbt>
- Set a complete GitLab pipeline for Angular
    - part 1: <https://indepth.dev/posts/1374/craft-a-complete-angular-gitlab-pipeline>
    - part 2: <https://indepth.dev/posts/1398/craft-a-complete-angular-pipeline-part-2>


## tool

- <https://docs.gitlab.com/runner/install/> - install the runner to test your `.gitlab-ci.yml` scripts locally.


## gitlab-ci rules

[[gitlab-ci-rules]]


## gitlab-ci templates

[[gitlab-ci-templates]]


## test gitlab-ci locally

> [!note]
> The method I had more comfort using was this: <https://github.com/firecow/gitlab-ci-local>

- install gitlab-runner: <https://docs.gitlab.com/runner/install/linux-manually.html>

- <https://blog.asksven.io/posts/testing-gitlab-ci-pipelines-locally/>

### How to Test Gitlab Ci Locally

From: https://medium.com/@umutuluer/how-to-test-gitlab-ci-locally-f9e6cef4f054

I have a gitlab-ci.yml file and I want to test this file locally?

I have decided to write this article to not watch pipeline in gitlab site and to give some useful tip for other developers.

I will show this steps by my system. It is Mac OSX. [**_Click_**](https://docs.gitlab.com/runner/install/) for other systems.

First of all, lets install [**_gitlab-runner_**](https://docs.gitlab.com/runner/) via [**_brew_**](https://brew.sh/index_tr) and then we must register gitlab-runner by url and token that is in **Setup a specific Runner manually** section in Project Settings > CI / CD tab. Also, we must enter executor type. (Gitlab provide a few executor type for runners. I user shell type but you can choose docker and some think like that. Check other executor types this [**_link_**](https://docs.gitlab.com/runner/executors/)) I will use **_shell_** because my all codes will run on command line.

gitlab-runner register

When this command runs, A wizard will open. You can write something that is about your project for description and alias. These will show in your Project Settings > CI / CD > Runners tab.

Now, lets create gitlab-ci.yml file in project root directory. I will use two stage in this section. Test and deploy. Also, I will define cache file locations, variables that used by script and lastly, commands are in stages.

```yaml
**stages**:  
  - test  
  - deploy  
  
**cache**:  
  **paths**:  
    - vendor/  
    - node_modules/  
    - storage/framework/cache  
  
**variables**:  
  **DEPLOYMENT_PATH**: /usr/local/my_project  
  **PROJECT_ROOT**: /home/gitlab-runner/my_project  
  
**my_project_test**:  
  **stage**: test  
  **script**:  
    - composer install  
    - php vendor/bin/phpunit --colors  
  
**my_project_deploy**:  
  **stage**: deploy  
  **script**:  
    - rsync -a -e 'ssh -p 1881' --delete-before -r ${PROJECT_ROOT}/* root@$STAGE_SERVER:${DEPLOYMENT_PATH}
```

Finally, lets make test locally. In this section, we will use _gitlab-runner exec_ command with executor type and stage title. I will run test stage. Furthermore, I will share deploy stage to be reference. You can run in your computer but you have to add ssh key to server otherwise it does not connect.

```
gitlab-runner exec shell my_project_test
```

This command will clone your project from gitlab, install the dependencies and run the tests.

Happy Coding!
