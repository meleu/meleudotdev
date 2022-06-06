---
dg-publish: true
---
## Pragmatic Microservices - Randy Shoup

**Note:** very good talk! About how to do Microservices correctly.

- <https://youtu.be/9vS7TbgirgY>

During the talk the speaker mentions 4 cases of big companies that at some point migrated their architecture to microservices.

> There's two things to notice here:
> 1. Companies at large scale ultimately end up evolving to microservices.
> 2. None of them started that way.


### Pragmatic Evolution

- Monolithic Architectures
- Microservice Architecture
- Deciding to Rearchitect
- Rearchitecture Tactics


#### Monolithic Architecture

##### Monolithic Application

- Pros
    - Simple at first
    - In-process latencies
    - Single codebase, deploy unit
    - Resource-efficient at small scale

- Cons
    - Coordination overhead as team grows
    - Poor enforcement of modularity
    - Poor scaling (vertical only)
    - Single point of failure


##### Monolithic Database

- Pros
    - Simple at first
    - Join queries are easy
    - Transactions
    - Resource-efficient at small scale

- Cons
    - Coupling over time
    - Performance and scalability bottleneck
    - Difficult to tune properly
    - Single point of failure


##### Improving the Monolith (without going to microservices)

- Exploit "Natural Partitions"
    - Many domains cleanly partition into independent applications
    - E.g.: buyer/seller, rider/driver, etc.

- Modularity Discipline
    - Internal componentization bounds cognitive load
    - Easier to modify or replace
    - "Force your team to have the discipline around keeping modular boundaries within the components."


- Continuous Delivery
    - Rapid deployment allows rapid evolution



#### Microservice Architecture

- Single-purposed
- Simple, well-defined interface
- Modular and independent
- Isolated persistence (!)

> Microservices are nothing more than SOA done properly.
> -- Randy Shoup (ex-Google, ex-eBay)

- Pros
    - Each unit is simple
    - Independent scaling and performance
    - Independent testing and deployment
    - Can optimally tune performance

- Cons
    - Many cooperating units
    - Network latencies
    - No transactions
    - Requires more sophisticated tooling and dependency management


##### Prerequisites for Success

- Process Maturity
- Organizational Maturity
- Operational Maturity

###### Process Maturity: Continuous Delivery

- Repeatable Deployment Pipeline
    - Low-risk, push-button deployment
    - Rapid release cadence
    - Rapid rollback and recovery

- Automated Testing
    - Developers write tests and code together
    - "I'm not done with my code change until I've written the code that implement the change and the code that test it."
    - Confidence to make risky changes

- Continuous Integration
    - System components assembled an tested together on each checkin


###### Organizational Maturity: Conway's Law

- Organization constraints architecture
    - Design of a system will be a reflection of the communication paths within the organization

- Modular system requires modular organization
    - Small, independent teams lead to more flexible, composable systems
    - Larger, interdependent teams lead to larger, more monolithic systems

- To get the system we want, we need to engineer the organization

> If you're considering moving to microservices, one of the first things you should consider doing is breaking up your organization in smaller pieces that parallel the services that you wanna build.


###### Organizational Maturity: Conway's Law

- Teams Aligned to Domains
    - Clear, well-defined area of responsibility
    - Single service or set of related services

- Cross-functional Teams
    - Team has inside it all skill sets needed to do the job
    - Depends on other teams for supporting services, libraries, and tools

- End-to-end Ownership
    - Team owns services from design to deployment to retirement
    - DevOps philosophy of "You build it, you run it".


###### Organizational Maturity: Conway's Law

- Strong practice of detailed, end-to-end monitoring of production systems.

- Ability to detect and alert on issues anywhere in the system.

- Sufficient monitoring to be able to do remote runtime diagnosis.


#### Deciding to Rearchitect

When to move from monolith to microservices


##### Why Rearchitect?

- Velocity
    - Time to markedt is constrained by coupling and lack of isolation in the monolith
    - Teams step on each others' toes, and can no longer develop independently
    - Difficult for new enginneers to be productive

- Scaling
    - Vertical scaling of the monolith no longer works
    - Parts of the system need to scale independently of others

- Deployment
    - Parts of the system need to deploy independently of others
    - Monolithic release is too slow, too complicated, too risky


> Getting to rearchitect a system is a sign of success, not failure.

> If you don't end up regretting your early technology decisions, you probably over-engineered.

> There's a reason why we never heard of a eBay competitor that started building a distributed system rather than a monolith.
> It's because the companies that were successful focused on meeting the needs of their customers, finding a business model, making sure they had a product-marked fit, and moving forward in an evolutionary way rather than over-engineering from the beginning.


#### Rearchitecture Tactics

> The only thing a Big Bang migration guarantees is a big *Bang*.
> -- Martin Fowler

##### Incremental Migration

- Step 0: Pilot Implementation
    - Choose initial end-to-end vertical experience to migrate / create
    - Opportunity to learn and adjust
    - Demonstrate feasibility and gain confidence
    - Bound investment and risk
    - Provide real customer value

- Initial step is the hardest
    - Learning how to do things in the new way
    - Building out basic supporting capabilities

- Step 1-N: Incremental Migration
    - Prioritize business value -- highest ROI areas first
    - Focus on areas with greatest rate of change
    - Maximize near-term payoff from investment
    - Confront and solve hard problems sooner rather than later

- Residual monolith may remain indefinitely
    - Lowest business value
    - Most stable and least changing
    - Can migrate - or not - opportunistically

##### Carving up the Monolith

- Look for (or create) a "seam" in the monolith
    - This is often the hardest part

- Wall it off behind an interface

- Write automated tests around the interface

- Replace implementation with a remote service

- **Rinse and Repeat**



#### Service Anti-Patterns

- The "Mega-Service"
    - Overbroad area of responsibility is difficult to reason about, change
    - Leads to unsustainable amount of upstream / downstream dependencies

- "Leaky Abstraction" Service
    - Interface reflects __provider's__ implementation, not the __consumer's__ model
    - Consumer's model is typically more aligned with the domain, simpler, more abstract
    - Leaking provider's model in the interface constrains evolution of the implementation

- Shared persistence
    - Breaks encapsulation, encourages "backdoor" interface violations
    - Unhealthy and near-invisible coupling of services
    - Initial eBay SOA efforts


#### Microservices may not be for you if...

- ... you have a simple system
- ... you have a small team
- ... you are not able to invest in continuous delivery, monitoring, etc.
- ... they don't __solve the problems you actually have__
