---
dg-publish: true
---
# GitLab CI/CD - From Zero to Hero

by Nana

<https://techworld-with-nana.teachable.com/courses/enrolled/1769488>


Nothing really new for me in sections 1, 2 and 3.

## 04 - GitLab Architecture

### 2 - GitLab Executors

- Shell Executor
    - 👍 simplest one, but with a lot of cons
    - 👎 no clean build environment
    - 👎 maintenance burden
- Docker Executor
    - 👍 commands executed inside a container
    - 👍 jobs are isolated
    - 👎 maintenance burden
- Virtual Machine
    - only makes sense if you're completely unable to use Docker
    - 👍 isolated environment
    - 👎 overhead to instantiate a new job environment
- Kubernetes Executor
    - only makes sense if you have a kubernetes cluster
    - 👍 high availability setup
    - 👍 isolated environment (new Pod for each job)
- Docker Machine Executor
    - ⚠️ Docker Machine has been **deprecated** by Docker
  
### 3 - Job Execution Flow

- GitLab Server 
- GitLab Runner
- Executor

1. Runner requests new jobs from GitLab Server
2. Runner compiles and sends job's payload to Executor
3. Executor clones sources or downloads artifacts from GitLab instance and executes the job
4. Executor returns job output and status to the Runner
5. Runner updates job output and status to GitLab Server

### 4 - Docker Executor

- Scope of Runners:
    - Shared runners: available to all groups and projects in a GitLab instance
    - Group runners: available to all projects in a group
    - Specific runners: associated with a specific project

- [AWS Pre-Requisite](https://techworld-with-nana.teachable.com/courses/gitlab-cicd-course/lectures/39895935) - Useful lecture for me to get used with AWS web interface.