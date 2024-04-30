---
dg-publish: true
---
- how to test CLI programs?
- exemplos de repositórios open source que podem ser boas inspirações


## Questions

### The concrete vs. abstract sweet spot

It's a kinda philosophical question...

In the section 1.1 of your book "Simplifying Code" you mention an interesting way to think about our jobs as a programmer.

You ask us to imagine a continuum with "most concrete" at one end and "most abstract" at the other. And that there's a sweet spot in the middle that represents the perfect compromise between comprehension and changeability, and it's our job as a programmer to find this sweet spot.

My question is: do you think that the knowledge level of the team working in the codebase can influence where this sweet spot is?


### Material to improve test writing skills

I'm currently facing the very same scenario you mention in chapter 2 of the book, where you talk about avoiding the echo-chamber:

I'm frustrated because making a change that preserves the behavior breaks apparently unrelated tests

It's pretty apparent in this project that the tests impede change and increase costs.

I'm following your guidance:

> If your tests are flawed such that they interfere with refactoring, improve them first, and then refactor.

That being said, here goes my question:

Can you suggest good books (or any other kind of media) about writing good tests (and maybe about rewriting bad ones)?

I want to something I can use to practice and improve my test writing skills.

Real world problems sometimes have a lot of noise and strict deadlines, making them not so good for the purpose of practicing.

**UPDATE**
I think this is a good answer: [books from Emily Bache](https://leanpub.com/b/codekatas#bundle-page-mocks-fakes-stubs), about Coding Dojos / Code Katas


### Open Source project for inspiration

Can you suggest some open-source projects we can use as inspiration or a learning material for good OO design or even good tests?