---
dg-publish: true
tags:
  - books
read-timestamp: %%insert the year%%
author: %%insert the author%%
---
# Implementation Patterns

## Chapter 2 - Patterns

Most programs follow a small set of laws:

- Programs are read more often than they are written.
- There is no such thing as "done". Much more investment will be spent modifying programs than developing them initially.
- Programs are structured using a basic set of state and control flow concepts.
- Readers need to understand programs in detail and in concept. Sometimes they move from detail to concept, sometimes from concept to detail.

## Chapter 3 - A Theory of Programming

Patterns, values and principles.

> The values are the universal overarching themes of programming. (...) I hold dear the importance of communicating with other people, removing excess complexity from my code, and keeping my options open. These values - communication, simplicity and flexibility - color every decision I make while programming.

- Values:
    - are universal
    - but often difficult to apply directly
- Patterns:
    - clear to apply
    - specific
- Principles
    - is the bridge between values and patterns

- The patterns describe what to do.
- The values provide motivation.
- The principles help translate motive into action.

### Values

- communication
- simplicity
- flexibility

### Simplicity

> Eliminating excess complexity enables those reading, using, and modifying programs to understand them more quickly. Some of the complexity is essential, accurately reflecting the complexity of the problem to be solved.

> Simplicity is in the eye of the beholder. What is simple to an expert programmer, familiar with the power tools of the craft, might be overwhelmingly complex to a beginner. Just as good prose is written with an audience in mind, so good programs are written with an audience in mind. Challenge your audience a little is fine, but too much complexity will lose them.

> Computing advances in waves of complexity and simplification. mainframe architectures became more and more baroque until mini-computers came along. The mini-computer didn't solve all the problems of a mainframe, but it turned out that for many applications those problems weren't all that important.

> Apply simplicity at all levels. Format code so no code can be deleted without losing information.

> Communication and simplicity often work together. The less excess complexity, the easier a system is to understand. The more you focus on communication, the easier it is to see what complexity can be discarded. Sometimes, however, I find a simplification that would make a program harder to understand. **I choose communication over simplicity in these cases.**

### Flexibility

> **Flexibility is the justification used for the most ineffective coding and design practices.** (...) Programs should be flexible, but only in ways they change.

> Flexibility can come at the cost of increased complexity. For instance, user-configurable options provide flexibility but add the complexity of a configuration file and the need to take the options into account when programming. Simplicity can encourage flexibility