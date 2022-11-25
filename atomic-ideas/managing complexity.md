---
dg-publish: true
---
# managing complexity

Ideas to add here:

- [[Code Complete]] on managing complexity as the primary imperative of a software developer
- [[O Mitico Homem-Mes]] - Não existe bala de prata


## Lehman's laws of software evolution

The text below is from [[learn-golang-with-tdd]], specifically [this page](https://quii.gitbook.io/learn-go-with-tests/meta/why#software).

> The laws describe a balance between forces driving new developments on one hand, and forces that slow down progress on the other hand.

### The Law of Continuous Change

> Any software system used in the real-world must change or become less and less useful in the environment.

How often is this 👆 ignored?

Many teams are incentivised to deliver a project on a particular date and then move on to the next project. The next set of individuals who will maintain the project didn't write it, of course.

People often concern themselves with trying to pick a framework which help them "deliver quickly" but not focusing on the longevity of the system in terms of how it needs to evolve.

(This trade-off "deliver fast" vs. "long-term maintainability" is somehow addressed in [[Code Complete - 3.2. Determine the Kind of Software You're Working On]])

Even if you're an incredible software engineer, you will still fall victim to not knowing the future needs of your system. As the business changes some of the brilliant code you wrote is now no longer relevant.

### The Law of Increasing Complexity

> As a system evolves, it's complexity increases **unless work is done to reduce it**.

What he's saying here is we can't have software teams as blind feature factories, piling more and more features on to software in the hope it will survive in the long run.

We **must** keep managing the complexity of the system as the knowledge of our domain changes.


## references

- [[Code Complete]]
- [Lehman's laws of software evolution](https://en.wikipedia.org/wiki/Lehman%27s_laws_of_software_evolution)
- Learn Go with tests - [Why unit tests and how to make them work for you](https://quii.gitbook.io/learn-go-with-tests/meta/why)