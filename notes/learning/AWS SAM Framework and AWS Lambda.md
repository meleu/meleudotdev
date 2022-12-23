---
dg-publish: true
---
# AWS SAM Framework and AWS Lambda

- <https://www.udemy.com/course/aws-sam-framework-and-aws-lambda/>
- official docs for AWS SAM Framework: <https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html>

SAM = Serverless Application Model

> [!note]
> The AWS Serverless Application Model is a different framework than [**The** Serverless Framework](https://serverless.com).


## 3. Development Environment Setup

### Setup an AWS Profile

AWS Console -> IAM -> Users -> Add users

- User name: `serverless-admin`
- Select AWS credential type:
    - [ ] Access key - Programmatic access
- next ->
- Attach existing policies directly
    - [ ] `AdministratorAccess`
- next ->
- Tags (do whatever you want)
- next ->
- Confirm create user

Take note of your **Access key ID** and **Secret access key**.

Then run:
```shell
# apparently it needs the 'serverless' tool to be installed
# check https://serverless.com
serverless config credentials \
  --provider aws \
  --key "${accessKeyId}" \
  --secret "${secretAccessKey}" \
  --profile serverless-admin
```


### Install VSCode and Setup AWS Toolkit

Install VSCode and install the plugin named "AWS Toolkit".

If you're already connected to AWS through the CLI, just run in your VSCode `Ctrl+Shift+P` and then `AWS: Connect to AWS` (maybe you'll need to run `AWS: Create Credentials Profile`, go figure it out).

### Install AWS CLI

I've installed on Linux using [the instructions here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions).
```shell
curl \
  "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
  -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```


### Setting up AWS Configurations

To know which user is logged into AWS, use this command:
```shell
aws sts get-caller-identity
```

If you want to change the user:
```shell
aws configure
```


### Install Docker

Recently I've been using the Docker Desktop. But I have these notes about docker installation:

- [[Docker Installation]]
- [[Docker Installation - udemy]]


### Install AWS SAM CLI

Followed the installations from [the docs here](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html).
```shell
# installed with brew
brew tap aws/tap
brew install aws-sam-cli
```



## 4. AWS SAM Framework in depth

AWS SAM stands for **Serverless Application Model**, it's used to define your serverless application

AWS SAM consists of the following components:

- **AWS SAM Template Specification** - you write properties to a file to describe functions, APIs, permissions, etc.
- **AWS SAM CLI** - to invoke function, packages and deploy serverless applications to AWS Cloud and so on.

AWS SAM CLI aims to ease the pain of creating, deploying managing and debugging lambda functions.


### Creating and Running our first AWS SAM Application

```shell
# initialize and follow the instructions for a HelloWorld
sam init
# that will create a directory with the name of the app

# assuming the app name is 'sam-hello-world'
# open the project in vscode
code sam-hello-world

# building the project
sam build

# invoking the function locally
sam local invoke
```

I had this issue to run the function locally (even with Docker Desktop running):
```
$ sam local invoke
Error: Running AWS SAM projects locally requires Docker. Have you got it installed and running?
```

Solved following the instructions [here in the issue tracker](https://github.com/aws/aws-sam-cli/issues/4329#issuecomment-1289588827).
```shell
# check the docker context
# (it was 'desktop-linux')
docker info | grep -i context

# get the DOCKER_ENDPOINT for 'desktop-linux'
docker context ls

# run the 'sam' command with DOCKER_HOST properly filled
DOCKER_HOST=unix:///home/meleu/.docker/desktop/docker.sock sam local invoke
```

What was awesome from this technique is that the function was not even deployed to AWS. Everything ran locally!


### Deploying the AWS SAM App

```shell
sam deploy --guided
```

Answers used during the course:
![[aws-sam-deploy-guided.png]]

After it finishes, test the endpoint created.


### Hosting the API locally

```shell
sam local start-api
```

Then test it by sending a GET request to `localhost:3000/hello`.

### Invoke your Lambda Function directly

Check the `Resources` in the `template.yaml` file. In this case we want to invoke the `HelloWorldFunction`:

```shell
sam local invoke "HelloWorldFunction"

# in the video he used this
sam local invoke "HelloWorldFunction" -e events/event.json
# I didn't get why exactly the 
# '-e events/event.json' is needed
```


### Deleting the Stack

```shell
# list the stacks you have
aws cloudformation list-stacks

# delete the one created in the previous sections
aws cloudformation delete-stack \
  --stack-name ${appName}
  --region ${awsRegion}
```



## 5. AWS SAM and AWS Toolkit in VSCode

In VSCode, `> AWS: Create Lambda SAM Application` and follow the instructions on the screen to create a Hello World with Python

It'll create a directory with the app files.

Again, a VSCode command: `> AWS: Deploy SAM Application`.

In my system, for some reason, that 👆 command is not present. Then I deployed via CLI: `sam deploy --guided`.






## 6. AWS SAM Deep Dive - SAM Specifications

```shell
sam init
# 1 - quickstart
# 2 - serverless api
# 3 - nodejs16
# n - no X-Ray
# Project name: test-sam-app

# then build the project
cd test-sam-app
sam build
```


### YAML Crash Course

I learned something useful in this lecture: the `&` and `*` notations in a YAML file.

Example: this input:
```yaml
author: &jPaul
  name: James
  lastName: Paul

books:
  - 1923:
      author: *jPaul
  - My Biography:
      author: *jPaul
```

Generates this JSON output:
```json
{
  "author": {
    "lastName": "Paul", 
    "name": "James"
  },
  "books": [
    {
      "1923": {
        "author": {
          "lastName": "Paul", 
          "name": "James"
        }
      }
    }, 
    {
      "My Biography": {
        "author": {
          "lastName": "Paul", 
          "name": "James"
        }
      }
    }
  ]
}
```


### AWS Lambda and SAM Framework Core Concepts

- Function
    - independent unit of deployment
    - best practice: does a single job.
    - examples:
        - save user to DynamoDB
        - convert large image into a thumbnail
- Events
    - anything that triggers a Lambda function
    - examples:
        - API Gateway HTTP endpoints
        - S3 bucket upload
- Resources
    - infrastructure components used by the Lambda function
    - examples:
        - DynamoDB Table (saving a comment)
        - S3 bucket (saving audio files)
        - SNS (sending messages asynchronously)
- Services
    - Framework's unit organization (project file).
    - Where you define the Functions, the Events and the Resources.
    - Can be described in YAML or JSON


### AWS Functions Timeout and Memory

Let's define two Lambda functions and tweak the timeout and memory.

```shell
sam init
# 1 - template
# 1 - HelloWorld
# Python
# X-Ray: no
# name: sam-time-memory
```