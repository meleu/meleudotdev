# Evolutionary Architecture & Microservices - Rebecca Parsons

- <https://youtu.be/WhHtVUlJNA0>

Inspiração interessante até os 16 minutos

## SOA

### SOA got some things right

- break monoliths down into independent services
- integration over internal coupling
- **encouraged greater acceptance of eventual consistency**
- at least made us think differently about the old approach


### SOA still tended to mess up

- monster services
- producer driver services
- orchestration (vs. coreography)
    - orchestration implies a lot of centralization of control
    - in coreography, the actors tend to know how to interact to each other
- tooling often got in the way
- much harder to change (even though that's why we did it)
- much harder to test


## Microservices

> ... an approach to developing a single application as a suite of small services, each running in its own process and communicating with lightweight mechanisms, often an HTTP resource API.


### Characteristics

- Small
- **Built around business capabilities**
- Independently deployable
- Little centralized management
- Smart end points and dumb pipes
- Lack of centralized, shared database


#### **Built around business capabilities**

Because the way our business users are going to reconfigure their business processes is going to be the fundamental units of how they think about the business. They don't care about how it's implemented. They think about this thing from the perspective of the business concepts. So we should build around these business capabilities.



### Implications of using microservices

- granularity question is crucial
    - must balance cohesion and coupling
- independently scalable
- **monitoring crucial**
- explicit design for service failures
- infrastructure automation and deployment automation essential
- platform flexibility must be managed
- eventual conssitency must be managed
- interface churn must be managed


#### granularity question is crucial

When you're trying to decide where's your service boundaries should be, that's probably the biggest single design decision you're goint to make.

Havin something that is a cohesive whole with the amount of coupling.


## How do I decompose my monolith

16 - 22 minutes

Quote attributed to Martin Fowler:

> Don't start developing a greenfield application using microservices. You probably don't know enough about the domain to even get close on the service boundaries.


## Microservices and the evolutionary architecture

- Microservices exhibit many of the principles of the evolutionary architecture.
    - **Focus on evolvability** (allowing us to change as fast as possible)
    - Tolerant reader
    - **Exploiting Conway's Law**
    - Appropriate coupling
    - Contracts
    - **Testability**


## Role of Continuous Delivery

28:30

- Microservices increase the burden on operations
    - more things to deploy
    - monitoring must be more sophisticated
    - more permutations of failure
- inadvisable without a strong DevOps culture
- inadvisable without rigor of Continuous Delivery
    - Infrastructure automation
    - Deployment automation
    - Test automation


aos 34 minutos começa um discurso muito bom sobre como a arquitetura de microsserviços habilita a mudança rápida para que nos adaptemos aos requisitos que mudam constantemente.

(...) putting a pressure on us to be able to change are systems more rapidly. And microservices is an aproach to that, but it comes with a cost.

Microservices is not what something you want to do, unless you have Continuous Delivery.

