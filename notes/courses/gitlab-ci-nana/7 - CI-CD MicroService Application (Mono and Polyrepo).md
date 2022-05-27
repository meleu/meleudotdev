## 7 - CI-CD MicroService Application (Mono and Polyrepo)

### 01 - What are Microservices?

#### How to break down a monolithic code base into microservices?

- Split based on business functionalitites
- Separation of concerns (1 service for 1 specific job)
- Self-contained & Independent (developed, deployed and scaled separately)

#### Downsides of Microservices Architecture

- Added complexity just by the fact that a microservices application is a distributed system
- Configure the communication between services
- More difficult to monitor with multiple instances of each service distributed across servers


### 02 - Monorepo vs. Polyrepo

#### Monorepo

Best suited for smaller microservice applications

- characteristics:
    - 1 git repository that contains many projects
    - 1 directory for each service/project
    - Makes the code management and development easier
    - clone and work only with 1 repo
    - changes can be tracked, tested and released together
    - share code and configurations
- challenges
    - tight coupling of projects
    - easier to break this criterion and develop more tightly coupled code
    - big source code means git interactions becomes slow
    - additional logic necessary to make sure only the service that had changed is built and deployed
        - pipeline logic becomes complex
    - all projects/teams are affected if there is an issue
- fact:
  - many big companies, like Google and Facebook use monorepos
  - they developed tools to scale build systems and version control with a large volume of code

#### Polyrepo

Best suited for microservice applications with separate teams.

- characteristics:
    - 1 repository for each service
    - code is completely isolated
    - clone and work on them separately
    - in gitlab you can group projects together in a **Group**
        - helps to keep an overview
        - create shared secrets, CI/CD variables, Runners, etc.
    - each project has its own pipeline
- Downsides:
    - cross-cutting changes is more difficult
    - changes spreaded across projects must be submitted as separate Merge Requests instead of a having a single one
    - Switching between projects is tedious
    - Searching, testing and debugging is more difficult
    - Sharing resources is more difficult


### Monorepo Example

- <https://gitlab.com/nanuchi/mymicroservice-cicd>
- `git@gitlab.com:nanuchi/mymicroservice-cicd.git`

### 05 - Prepare Deployment Server

Create an ubuntu machine, log into it and:

```bash
# update application repositories
sudo apt update

# install docker
sudo apt install docker.io

# install docker-compose
sudo apt install docker-compose

# add current user to the 'docker' group
sudo usermod -aG docker $USER
```

### 06 - Build Micro Services (Monorepo)

Run a job only when there are changes in the `frontend/` directory:
```yaml
build_frontend:
  # ...
  only:
    changes:
      - "frontend/**/*" # can NOT use variables here
```

Basically, the techniques used to create a pipeline for microservices in a a monorepo setup involves:

- use the `only:changes` config
- use a `.template-job` and `extends`

### 07 - Deploy Micro Services (Monorepo)

- <https://techworld-with-nana.teachable.com/courses/1769488/lectures/39904402>

In this lecture there are some interesting docker network tricks.


### 08 - CI-CD Pipeline for a Polyrepo

- <https://gitlab.com/mymicroservice-cicd>

Main takeaway: use `include` to get the yaml files from a dedicated repo.

- `include`
    - `local` reference from same repository
    - `file` reference from another private project (same GitLab instance)
    - `remote` include from a different location (full URL necessary)
    - `template` include GitLab's templates
 
