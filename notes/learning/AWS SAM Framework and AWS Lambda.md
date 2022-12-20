---
dg-publish: true
---
# AWS SAM Framework and AWS Lambda

- <https://www.udemy.com/course/aws-sam-framework-and-aws-lambda/>
- official docs for AWS SAM Framework: <https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html>

SAM = Serverless Application Model


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