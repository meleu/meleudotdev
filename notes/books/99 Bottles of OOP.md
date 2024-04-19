---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: "2024"
author: "Sandi Metz"
---

# 99 Bottles of OOP

Note: I'm reading this book together with the [POOD-I course](https://courses.sandimetz.com/courses/poodi).

## 1. Rediscovering Simplicity

> When you were new to programming you wrote simple code. (...) Since then, you've learned new skills, tackled harder problems, and produced increasingly complex solutions. Experience has taught you that most code will someday change, and you've begun to craft it in anticipation of that day. **Complexity seems both natural and inevitable**.
> 
> Where you once optimized code for *understandability*, you now focus on its *changeability*. Your code is less *concrete* but more *abstract* - you've made it initially harder to understand in hopes that it will ultimately be easier to maintain.
> 
> **This is the basic promise of Object-Oriented Design** (OOD): that if you're willing to accept increases in the complexity of your code along *some* dimensions, you'll be rewarded with decreases in complexity along *others*.  OOD doesn't claim to be free; it merely asserts that its benefits outweigh its costs.

TBD: add the highlighted quotes here...

---

## 2. Test Driving Shameless Green

### Writing the Tests

#### Question 1: What decisions must be made *before* you can write this first test?

- my answers:
    - What's the expected output for the given input?
    - If there are too many possibilities, choose one and write the test.


#### Question 2: Is it better to interpolate 'number' or to add a conditional?

- my answers:
    - interpolate

> as the tests get more specific, the code get more generic.


#### Question 3: Why not just interpolate a conditional?!?

- my answers:
    - because it's confusing... it requires a time to analyze the conditional while reading.


#### Question 4: Why is duplication in `verse` acceptable but not in `verses`?

- my answers
    - because `verses` should just reference `verse`.

#### Question 5: What should the expectation in the song test be?

- my answers:
    - I feel like the "right" answer is the whole song in a string, but that bothers me a bit...


#### Question 6: What design flaw forces you to write this annoying test?

- my answers: I don't know... 🤷

