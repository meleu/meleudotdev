## Mastering Chaos - A Netflix Guide to Microservices

- <https://youtu.be/CZ3wIuvmHeM>

### What microservices are

> ...the microservice architectural style is an approach to developing a single application as a suite of small services, each reunning in its own process and communicating with lightweight mechanisms, often an HTTP resource API.
> - Martin Fowler

#### An Evolutionary Response

- Separation of Concerns:
    - Modularity, encapsulation

- Scalability
    - Horizontally scaling
    - Workload partitioning

- Virtualization & elasticity
    - Automated operations
    - On demand provisioning

#### Microservices are an abstraction

### Challenges & Solutions

#### What is a stateless service?

- Not a cache or a database
- Frequently accessed metadata (cached in memory)
- No instance affinity
- Loss of a node is a non-event

#### What is a stateful service?

- Databases & caches
- Custom apps which hold large amounts of data
    - "I strongly recommend you to avoid storing your business logic and your state all in just one application."
- Loss of a node is a notable event


### Continuous Learning & Automation

Incident -> Resolution -> Review -> Remediation -> Analysis -> Best Practice -> Automation -> Adoption


### Organization & Architecture

Conway's Law

> Organizations which design systems are constrained to produce designs which are copies of the communication structures of these organizations.

simple version:

> Any piece of software reflects the organizational structure that produced it.

practical example:

> If you have four teams working on a compiler you will end up with a four pass compiler.


#### Outcomes & Lessons

- Outcomes
    - Productivity & new capabilities
    - Refactored organization

- Lessons
    - Solutions first, team second
    - Reconfigure teams to best support your architecture


### Recap

Microservice architecture are complex **and organic**.

Health depends on discipline and chaos.

#### Dependency

- Circuit breakers, fallbacks, chaos
- Simple clients
- Eventual consistency
- Multi-region failover


#### Scale

- Auto-scaling
- Redundancy - avoid Single Point of Failure
- Partitioned workloads
- Failure-driven design
- Chaos under load


#### Variance

- Engineered operations
- Understood cost of variance
- Prioritized support by impact

#### Change

- Automated delivery
- Integrated practices

#### Organization & Architecture

- Solutions first, team second

