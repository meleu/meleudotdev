---
dg-publish: true
---
# How to fall in love with TDD - Gui Ferreira

video link: <https://www.youtube.com/watch?v=vXnTMjMe5Eg>

Here are my main takeaways.

## 4 phases of TDD (not 3)

(around 13 minutes)

There's a missing step in the Red-Green-Refactor cycle, which is the "Test List".

![[TDD-4-phases.png]]

### Test List

It's when you **think**: what's the best next step to take?

If you're in the middle of a test case, or coding the feature, and have an idea for another test case, write it in the test list and continue your current task.

This is important because if you go after every single thing that pops up in your mind, you'll lose track if what you're doing.

> My (meleu) personal note:
> 
> I once saw a statement that resonated in me: "first you solve the problem, then you write the code". I thought it made sense, but it was hard to solve the problem without experimentations.
> 
> TDD made me change this a little bit: "first you write the test, then you write the code". This forces me to think in the solution from the consumer of an "already solved problem", and that helps me to think in better solutions.

### Red

- Write **ONE** test. Only one.
- If it doesn't compile, it's a red test.
- If it doesn't fail, is the test useful?

### Green

- If it's obvious, just do it. (it's not a waste)
- Do eXtreme Go Horse programming
  - your code can be ugly at this stage

### Refactor

- It's optional, but don't skip it.
- Make it good code (maintainable, simple, readable).
- Make it good test code.
- **Don't add tests here**.


## Unit Tests

(around 28:30 minutes)

The speaker credit this to Michael Feathers.

> A test is **not** a Unit Test if:
>
> - It talks to the **database**
> - It communicates **across the network**
> - It touches the **file system**
> - It **can't run at the same time** as any of your other unit tests
> - You have to do **special things** to your **environment** (such as editing config files) to run it.


## Hexagonal Architecture

(around 29:40)

Architecture designed with testing in mind.

Clean Architecture and Onion Architecture came from Hexagonal Architecture.

## Misconception

(around 39 minutes)

- ~~new method ⚡ new test~~
- new **behavior** ⚡ new test

You don't need to test all methods, just the external interface. Write a new test when you have a new (external) behavior.

> Do not test internals!

> Test **behaviors**, not implementation details.
> - behaviours are stable
> - implementation details change

> Test the **what**, not the how.

## "random" quotes

> [!important]
> **TDD is GTD for code**

> I don't trust things that I never see failing.

> Use **mutation** testing as a learning tool.
