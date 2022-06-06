## The Problem with Microservices - Dave Farley

- <https://youtu.be/V3NQt5KP7EM>

Microservices is a distributed system architecture. Distributed systems is a way more complicated than non distributed systems.

### Characteristics of Microservices

- Small
- Focused on One Task
- Aligned with a Bounded Context
- Autonomous
- Independently Deployable
- Loosely-Coupled


#### Small

What's "small"?

- "Fits inside James Lewis' head." - reasonably easy to understand
- Could you rewrite it in a week or two? If the idea of having to rewrite it from scratch scares you, than it's probably too big.

#### Focused on One Task

- ... and doing it well! (Unix Philosophy)
- Separation of Concerns, but in the Problem Domain
- Accomplishes one task when viewed from outside.

#### Aligned with a Bounded Context

Inspiration: Domain-Driven Design, from Eric Evans

> A bounded context is a defined part of software where particular terms, definitions and rules apply in a consistent way.

Prefer services aligned with 'Seams' in the Problem Domain

Arbitrary division, not really microservice.

Natural 'Fire-Breaks' in the Problem Domain.

#### Autonomy

We can change implementation without coordinating with others

This is the Real Value of microservices.

Service Based Design != Microservice

> Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure
> ~ Melvin Conway, 1967 

Instead of grouping teams by specialization (e.g.: UI team, busines team, DB team), prefer to group them as cross-functional autonomous teams.


#### Independently Deployable

 Deployability is an important aspect of autonomy.
 
 Teams that can decide when to deploy are significantly more effective
 
 If your service is not independently deployable, it's not a microservice.
 
 If you always test your service with others before release, it's not independently deployable.
 
 Build, test and deploy services independently of other services
 
 This is the **REAL** value of microservices.
 
 ... **and also the REAL cost!**
 
 #### Important Note
 
Microservices are an organization de-coupling strategy. 

#### Loosely Coupled

Make external & internal representations different.

The interface to a microservice *is* a public API.

It should be changed only with great care.

When consuming an API, use the minimum data that you can to reduce coupling.