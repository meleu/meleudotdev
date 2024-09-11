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

## Main Takeaways

### Working on a new feature

Steps to be taken when working on a new feature:

1. Improve the tests (if needed)
    - good test writing skills?
2. Refactor
    - Open-Closed principle (from SOLID)
    - Remove code smells (Refactoring book)
    - Repeat until your code is "open" to the new requirement
3. Implement the new feature


### Questions to measure cost of a code

> While it's difficult to get exact figures for value and cost, asking the following questions will give you insight into the potential expense of a bit of code:
> 
> 1. How difficult was it to write?
> 2. How hard is it to understand?
> 3. How expensive will it be to change?
> 
> Questions 1 \["was it", past] and 3 \["will it", future] may or may not concert you, but question 2 \["is it", present] always applies.

> **Code is easy to understand when it clearly reflects the problem it's solving**



---

##  Introduction

> Writing code is the _process_ of working your way to the next stable end point, not the end point itself. You don't know the answer in advance, but instead, you are seeking it.


## 1. Rediscovering Simplicity

> When you were new to programming you wrote simple code. (...) Experience has taught you that most code will someday change, and you've begun to craft it in anticipation of that day. (...)
> 
> Where you once optimized code for *understandability*, you now focus on its *changeability*. **Your code is less _concrete_ but more _abstract_** - you've made it initially harder to understand in hopes that it will ultimately be easier to maintain.
> 
> **This is the basic promise of Object-Oriented Design** (OOD): that if you're willing to accept increases in the complexity of your code along *some* dimensions, you'll be rewarded with decreases in complexity along *others*.  OOD doesn't claim to be free; it merely asserts that its benefits outweigh its costs.

### 1.1 Simplifying code

> The code you write should meet two often-contradictory goals. It must remain concrete enough to be understood while simultaneously being abstract enough to allow for change.
> 
> Imagine a continuum with "most concrete" at one end and "most abstract" at the other. (...)
> 
> The best solution for most problems lies not at the extremes of this continuum, but somewhere in the middle. **There's a sweet spot that represents the perfect compromise between comprehension and changeability, and it's your job as a programmer to find it.**


#### Consistency

> Every time the style of the conditionals changes, the reader has to press a mental reset button and start thinking anew. Inconsistent styling makes code harder for humans to parse; it raises costs without providing benefits.

#### Duplication

> Duplication of logic suggests that there are concepts hidden in the code that are not yet visible because they haven't been isolated and named.


#### Calling methods vs. Sending messages

> Referring to the act of invoking behavior as "calling" a method or function suggests (albeit mildly) that you know what that called code does. Alternately, describing this act as "sending a message" leaves a bit more mental space between the sender's intention and the receiver's implementation. This virtual gap encourages you to create message senders that are willfully ignorant of implementation details, and fosters independence between senders and receivers. This independence is a core features of maintainable object-oriented code.


#### Names

> When you first write a piece of code, you obviously know what it does. Therefore, during initial development, the price you pay for poor names is relatively low. However, code is read many more times than it is written, and its ultimate cost is often very high and paid by someone else. Writing code is like writing a book; your efforts are for _other_ readers. Although the struggle for good names is painful, it is worth the effort if you wish your work to survive to be read. **Code clarity is built upon names.**


### Questions to measure cost of a code

> While it's difficult to get exact figures for value and cost, asking the following questions will give you insight into the potential expense of a bit of code:
> 
> 1. How difficult was it to write?
> 2. How hard is it to understand?
> 3. How expensive will it be to change?
> 
> Questions 1 \["was it", past] and 3 \["will it", future] may or may not concert you, but question 2 \["is it", present] always applies.

> **Code is easy to understand when it clearly reflects the problem it's solving**


#### Clever code

> Programmers love clever code. (...) Writing it, or suddenly understanding it, supplies a little burst of appreciative pleasure. However, this very pleasure distracts the eye and seduces the mind, and allow cleverness to worm its way into inappropriate places.


#### Does DRY reduce costs?

> DRY promises that if you put a chunk of code into a method and then invoke that method instead of duplicating the code, you will save money later if the behavior of that chunk changes. Recognize, though, that **DRYing out code is not free**. It adds a level of indirection, and **layers of indirection make the _details_ of what's happening harder to understand**. DRY makes sense when it reduces cost of change more than it increases the cost of understanding the code.

> When you DRY out duplication or create a method to name a bit of code, you add levels of indirection that make it more abstract. In theory these abstractions make code easier to understand and change, but in practice they often achieve the opposite.

#### verses vs. verse

Should `verses` know how an actual verse is implemented?

> While it makes perfect sense for the `verse` method to be responsible for knowing the verse templates, once `verse` assumes this responsibility, other parts of your application should not usurp it.

#### Small steps of TDD

> The small steps of TDD act to incrementally reveal the correct implementation. If your absolute certainty turns out to be wrong, skipping these incremental steps means you miss the opportunity of being set right. An apparently "obvious" implementation that is actually an incorrect guess will cause a world of downstream pain.


> In Chapter 28 of _Test-Driven Development by Example_, Kent Beck describes different ways to make tests pass. Three of his "Green Bar Patterns" are:
> 
> - Fake It ("Til You Make It")
> - Obvious Implementation
> - Triangulate

> _Fake It_ style TDD may initially seem awkward and tedious, but with practice it becomes both natural and speedy. Developing the habit of writing just enough code to pass the tests forces you to write better tests. It also provides an antidote for the hubris of thinking you know what's right when you're actually wrong. Although it sometimes makes sense to skip the small steps and jump immediately to the final solution, exercise caution. It's best to save _Obvious Implementation_ for very small leaps.


#### Sender's amount of knowledge

```ruby
def song
  verses(99, 0)
end
```

> While it's true that `verses(99, 0)` and `song` return the same output, they differ widely in **the amount of knowledge they require from the sender**.

> Knowledge that one object has about another creates a dependency. Dependencies tie objects together, exacerbating the cost of change. Your goal as a _message sender_ is to incur a limited number of dependencies, and your obligation as a _method provider_ is to inflict few.


#### Cost-effective tests

> The first step in learning the art of testing is to understand how to write tests that confirm _what_ your code does without any knowledge of _how_ your code does it.


#### Avoiding the Echo-Chamber

```ruby
def test_the_whole_song
  bottles = Bottles.new
  assert_equal bottles.verses(99, 0), bottles.song
end
```

> This test has a major flaw that can cause it to toggle from "short and sweet" to "painful and costly" in the blink of an eye. This flaw lies dormant until something changes, so the benefits of writing tests like this accrue to the writer today, while the costs are paid by an unfortunate maintainer in the future.

> There's nothing more frustrating than making a change that preserves the behavior of an application but breaks apparently unrelated tests. If you change an implementation detail while retaining existing behavior and are then confronted with a sea of red, you are right to be exasperated. This is completely avoidable, and a sign that tests are too tightly coupled to code. Such tests impede change and increase costs.

> **Tests are _not_ the place for abstractions - they are the place for concretions.**



---


## 2. Test Driving Shameless Green

> A conditional adds a new execution path through the code, and additional execution paths increase complexity.

I found this very impactful:

> as tests get more specific, code should become more generic. Code becomes more generic by becoming more abstract.

#### Questions to ask before DRYing

- **Does the change I'm contemplating make the code harder to understand?**
    - When abstractions are correct, code is easy to understand. Be suspicious of any change that muddies the waters; this suggests an insufficient understanding of the problem.
- **What is the future cost of doing nothing now?**
    - Some changes cost the same regardless of whether you make them now or delay them until later. If it doesn't increase your costs, delay making changes. The day may never come when you're forced to make the change, or time may provide better information about what the change should be. Either way, waiting saves you money.
- **When will the future arrive, or how soon will I get more information?**
    - If you're in the middle of writing a test suite, better information is as close as the next test. Squeezing all duplication out at the end of every test is not necessary. It's perfectly reasonable to tolerate a bit of duplication across several tests, hoping that coding up a number of slightly duplicative examples will reveal the correct abstraction. It's better to tolerate duplication than to anticipate the wrong abstraction.

#### Writing the minimum amount of code to pass the tests

> The goal is to use green to maximize your understanding of the problem and to unearth _all_ available information before committing to abstractions.



---

## 3. Unearthing Concepts

See also: [[Code Smells]]

### SOLID

#### Open-Closed

**Objects should be open for extension, but closed for modification.**

> The decision about whether to refactor in the first place should be determined by whether your code is already "open" to the new requirement.

> The "open" principle says that you should not conflate the process of refactoring with the act of adding new features. You should instead separate these two operations. When faced with a new requirement, first rearrange the existing code such that it's open to the new feature, and once that's complete, then add the new code.

> New requirements should be implemented in two steps. First, you rearrange existing code so that it becomes open to the new requirement. Next you write new code to meet that requirement. The first of these steps is refactoring.

### Flocking Rules to create abstractions

1. Select the things that are most alike
2. Find the smallest difference between them.
3. Make the simplest change that will remove that difference.
    1. parse the new code
    2. parse and execute it
    3. parse, execute and use its result
    4. delete unused code

Following the flocking rules:
- change only one line at a time
- run tests after every change
- if the tests fail, undo and make a better change

---

## From the POOD-I course

### Writing the Tests

These are from the POOD-I course.

#### Question 1: What decisions must be made *before* you can write this first test?

- my answers:
    - What's the expected output for the given input?
    - If there are too many possibilities, choose one and write the test.

> You have to make lots of decisions! For example, you must design your API, decide on the classes you plan to create and the messages to which they respond, and determine the required inputs and expected outputs for each method.
> 
> ~ book section 2.2

#### Question 2: Is it better to interpolate 'number' or to add a conditional?

- my answers:
    - interpolate

> as the tests get more specific, the code get more generic.

> A method containing a single two-branch conditional has two execution paths. (...)
> This means that execution paths increase like bacteria dividing:
>
> - 2 branches 1 time = 2 paths
> - 2 branches 2 times = 4
> - 2 branches 3 times = 8
> - 2 branches 4 times = 16, etc
> - 2 branches 10 times = 1,023 execution paths through the method.
>
> **There's no way that a method like this has a complete test suite.**

#### Question 3: Why not just interpolate a conditional?!?

- my answers:
    - because it's confusing... it requires a time to analyze the conditional while reading.

> Interpolating a conditional to decide whether or not to add an 's' to the word bottle in the final phrase of the 2 verse adds complexity to the code without identifying a useful abstraction.

#### Question 4: Why is duplication in `verse` acceptable but not in `verses`?

- my answers
    - because `verses` should just reference `verse`.

> The Single Responsibility Principle says that every method should have one responsibility, and that it's code should be cohesive around it's purpose.  
> 
> The responsibility of the `verse` method is to return the correct lyrics for any verse. 
> 
> The responsibility of the `verses` method is to ask the `verse` method for individual verses, and to concatenate those single verses together.
> 
> The `verse` method owns the lyrics and no other place in your application should be aware of these details.  While there's a bunch of duplication within the method, you cannot see this duplication from outside.  From the point of view of external observers, this duplication is hidden, and may as well not exist...as long as you don't duplication this duplication over in `verses`!
> 
> ~ book section 2.6

#### Question 5: What should the expectation in the song test be?

- my answers:
    - I feel like the "right" answer is the whole song in a string, but that bothers me a bit...

> Whole song
>
> ~ book section 2.10

#### Question 6: What design flaw forces you to write this annoying test?

- my answers: I don't know... 🤷


### Techniques to find a good name

- What's the responsibility of the method I'm about to create?
- One layer of abstraction below the concrete code.
- Not too far away from the domain

### Choosing meaningful defaults

- use `:FIXME`
- make the `:FIXME` case be the `else` case, so you can remember to remove it later.

### Quotes

> Slow tests are an indication that there's something wrong with the design. Either something wrong in the tests or something wrong with the code.

> As the code is read many more times than it's written, the cost of code is in the reading.

> Having a style guide is not about the style, it's about the consistency.

> \[About Liskov Substitution Principle]
> 
> The point of Liskov is: the objects have to be what they say they are. They have to behave like you expect. They can't do anything that forces folks that interact with them to check what kind of thing they are in order know how to talk to them.