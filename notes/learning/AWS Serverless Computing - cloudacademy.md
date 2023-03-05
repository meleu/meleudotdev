---
dg-publish: true
---
# AWS Serverless Computing - cloudacademy

[link](https://cloudacademy.com/learning-paths/getting-started-serverless-computing-25/)


## What is Serverless Computing

AWS Lambda - Function as a Service

Serverless = Don't worry with server-related tasks (delegate it to the cloud provider)

FaaS makes sense for event-based applications.

An event triggers the function, and then the function does something, putting the output of its computation somewhere else.

### Strengths of Serverless Computing

- Pay as you use
- Scales quickly
- Highly available and fault-tolerant
- Easily deploy new code

### Weakness of Serverless Computing

- Limited runtime
- **Testing is difficult** ☹️
- Expensive

Limited runtime: Serverless doesn't play well with long running applications. In AWS Lambda the limit is 15min.

Testing is difficult because it's not that simple to replicate the "Serverless" infrastructure locally so you can test and troubleshoot your app. There are tools to help with this, though (SAM Framework).


### Architectures that work well with Serverless

#### Event-driven architecture

Production > Detection > Consumption

![[AWS Serverless Computing - event-driven architecture.png]]

#### Microservice-based arechitecture

Monolith vs. Microservice

By separating the components of the monolith into microservices, these components can scale separately.


## Understanding AWS Lambda to Run and Scale your Code

### An Overview of AWS Lambda

[cool fundamental video](https://cloudacademy.com/course/understanding-aws-lambda-run-scale-your-code-4006/serverless-compute/?context_id=25&context_resource=lp)


### Invoking a Lambda Function

Methods:

- AWS Management Console
- AWS CLI
- AWS SDKs
- Triggers

Each one of these 👆 methods go to the Lambda API. And the Lambda API provides three different invocation models:

- Synchronous (push-based) invocation
    - sends a request
    - receives a response
    - the triggerer client is the interested part
    - **use case**: if your application needs to wait for a response
    - **advantages**: helps maintain order
- Asynchronous (event-based) invocation
    - sends a request and does not wait for a response
    - the triggerer client is not interested in what the function does with the information
    - **use case**: if your function runs for long periods of time and does not need to wait for a response
    - **advantages**: offers automatic retries, a built-in queue, and a dead letter queue for failed events.
- Stream (poll-based) invocation
    - puts a Lambda Service (Event Source Mapping) to process a source of data stream, filtering the messages that matches the use case
    - once a message matches, the Lambda function is triggered
    - **use case**: processing message from a stream or queue
    - **advantages**: message filtering

> [!note]
> If an AWS Service invokes your function, you cannot select an invocation type. The AWS Service selects it for you.

