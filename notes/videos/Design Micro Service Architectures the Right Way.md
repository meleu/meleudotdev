---
dg-publish: true
---
# Design Micro Service Architectures the Right Way

## Misconceptions

### Misconception #1

Microservices enable our teams to choose the best programming languages and frameworks for their tasks.

#### Reality

We'll demonstrate just how expensive this is.

Team size and investment are critical inputs.


### Misconception #2

Code Generation is Evil

(hein?)

#### Reality

What's important is creating a defined schema that is 100% trusted.

We'll demonstrate one technique leveraging code generation.


### Misconception #3

The event log must be the source of truth.

#### Reality

Events are critical parts of an interface.

But it's okay for services to be the system of record for their resources.


### Misconception #4

Developers can maintain no more than 3 services each.

#### Reality

Wrong metric; we'll demonstrate where automation shines.

Flow developers today each maintain ~5 services. Weekly maintenance <5% of time.


## Database Architecture

Each microservice application owns its database.

No other service is allowed to connect ot the database.

Other services use only the service interface (API + Events).

> This is really important. Because once you let other software connect to your database, you lose the ability to know if a change is safe.


## Continuous Delivery

> Continuous Delivery is a prerequisite to managing micro service architectures.


## Events

> We have an amazing API, but please subscribe to our event streams instead.
 
Another cool quote (not necessarily related to events):

> If develops lose trust in specification it turns into a huge bottleneck in software development.


## Summary: Critical Decisions

- Design schema first for all APIs and Events
    - consume events (not API) by default

- Invest in automation
    - deployment, code generation, dependency management

- Enable teams to write amazing and simple tests
    - drives quality, streamlines maintenance, enables continuous delivery

