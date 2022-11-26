---
dg-publish: true
---
# managing complexity

In software literature there are many references from the "great masters" talking about how important it is to **manage complexity**.


## Problems caused by complexity

From [[O Mitico Homem-Mes]] (The Mythical Man Month).

- Complexity causes:
    - harder communication between team members, which leads to deficiencies in the product, **increased costs**, and **delayed schedule**.
    - difficulty in list and understand all possible states of a program, which causes lack of confidence.
    - difficulty to evolve the software without creating side effects.
    - unnoticed states, which leads to security vulnerabilities


## Software's Primary Technical Imperative: Managing Complexity

From [[Code Complete]].

![[Code Complete - 5.2. Sotfware's Primary Technical Imperative - Managing Complexity]]


## Lehman's Law of Increasing Complexity

> As a system evolves, it's complexity increases **unless work is done to reduce it**.

We can't have software teams as blind feature factories, piling more and more features on to software in the hope it will survive in the long run.

We **must** keep managing the complexity of the system as the knowledge of our domain changes.


## Tesler's Law of Conservation of Complexity

> Every application has an inherent amount of complexity that cannot be removed or hidden. Instead, it must be dealt with, either in product development or in user interaction.

We should never use this 👆 as an excuse to tolerate "artificial" complexity.

This law refers to the "minimal amount of complexity" in a system. Such complexity cannot be reduced, but "shifted" from a step in the value stream to another. Despite this law, you must always keep your eyes open and avoid increasing the "artificial" complexity (the complexity caused by bad design, bad coding practices, etc.).


## references

- [[O Mitico Homem-Mes]]
- [[Code Complete]]
- [Lehman's laws of software evolution](https://en.wikipedia.org/wiki/Lehman%27s_laws_of_software_evolution)
- Learn Go with tests - [Why unit tests and how to make them work for you](https://quii.gitbook.io/learn-go-with-tests/meta/why)