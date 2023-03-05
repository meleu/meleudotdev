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




