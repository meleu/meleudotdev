---
dg-publish: true
---
### Causes of Complexity

Complexity is caused by two things:

- dependencies 
- obscurity

#### dependencies

> A dependency exists when a given piece of code cannot be understood and modified in isolation.

Although it's one of the causes of complexity it's a fundamental part of software design, and cannot be completely eliminated. Sometimes we even create dependencies to prevent duplication, for example when we create a function to be called in several other parts of our code.

#### obscurity

> Occurs when important information is not obvious.

Examples:

- when the name of a variable is not clear or too generic (e.g.: `time`)
- when it's not obvious to guess the units used in a variable, and the only way to find out is to scan code for places where the variable is used.

> If a system has a clean and obvious design, then it will need less documentation. The need for extensive documentation is often a red flag that the design isn't quite right. **The best way to reduce obscurity is by simplifying the system design.**

### Strategic vs. Tactical programming

- Tactical programming:
    - focused on getting features working as quickly as possible.
    - usual argument: time to market 
- Strategic programming
    - invest more time to produce clean designs and fix problems.
    - usual argument: project longevity

Using only the tactical approach creates technical debt and soon the project will loose its capability to change. Progress starts to lag.

How much to invest on each style?

> A huge up-front investment, such as trying to design the entire system, won't be effective.

That's what we call "waterfall method".

> The ideal design tends to emerge in bits and pieces, as you get experience with the system. (...) the best approach is to make lots of small investments on a continual basis. **I suggest spending about 10-20% of your total development time on investments**.

Quick calculation: in a 5 work-day week, 20% means one of those work days. And 10% means a half of a work-day.


