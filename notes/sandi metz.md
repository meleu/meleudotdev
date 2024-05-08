---
dg-publish: false
---

## Questions 2

### Temporary var vs. Calling a message multiple times

As I learned to code in C and learned some low level stuff about what happens when we call a function, the values on the stack, etc... I mean, the computational cost of calling a function.

Calling `quantity(number)` several times or saving the result in a temp var?


### The wrong abstraction: `pronoun` vs. `action`





---

## Questions

### The concrete vs. abstract sweet spot

It's a kinda philosophical question...

In the section 1.1 of your book "Simplifying Code" you mention an interesting way to think about our jobs as a programmer.

You ask us to imagine a continuum with "most concrete" at one end and "most abstract" at the other. And that there's a sweet spot in the middle that represents the perfect compromise between comprehension and changeability, and it's our job as a programmer to find this sweet spot.

My question is: do you think that the knowledge level of the team working in the codebase can influence where this sweet spot is?



### Material to improve test writing skills

I'm still reading the book and going through the course, currently reading chapter 3...

Until now, one of the most impactful concept I learned is the systematic approach to do our job.

We usually get a demand in form of a ticket or whatever and we need to implement a new feature or fix a bug.

And the systematic approach you suggest is:

1. Refactor
2. Then implement the new feature.

I like how you break down the refactoring process:

1. make our code adhere the open-closed principle
2. by removing the code smells
3. until the code is open to the new requirement

I really like this systematic approach because it brings more actionable directions of what to do when we receive a ticket.

But... my experience as a programmer is mostly working on other people's code. And (unfortunately) in codebases with no tests or poorly written tests. Which impacts the refactoring process.

In some part of the book you also mention:

> If your tests are flawed such that they interfere with refactoring, improve them first, and then refactor.

So, in my experience, the systematic approach to do my job would always be:

1. **improve (or write) the tests**
2. refactor
3. implement the new feature

And here's where I feel I'm weak. I don't feel confident that I'm able to write good tests.

I mean, when I look at (let's say) "production code" I have an instinctive taste to judge if it's good or not. And I believe this happens because we're doing this for decades.

But I don't feel the same for "testing code".

That being said, what I really want to say is that my current quest is to work-out my test writing skills.

There's a `references.txt` in the course's repository and for testing it mentions Michael Feather's book, "Working Effectively with Legacy Code". It's on my plan to check that after finishing the course.

But I was googling about this topic and found some people mentioning Code Katas. And it seems aligned to what I want: practice and practice!

So, here's my question: what do you suggest for those who want to improve their test writing skills?



### Open Source project for inspiration

Can you suggest some open-source projects we can use as inspiration or a learning material for good OO design or even good tests?