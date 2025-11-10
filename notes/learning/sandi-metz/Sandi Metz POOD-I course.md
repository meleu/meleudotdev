---
dg-publish: true
---
# POOD-I course

- based on book [[99 Bottles of OOP]]
- [link to the course](https://courses.sandimetz.com/courses/take/poodi/)

See also [[anki.sandimetz]].

[Re-read this part](https://courses.sandimetz.com/courses/take/poodi/texts/55822252-seriously-does-any-of-this-work-in-real-life) after completing block 21.

## What to read next?

- Refactoring 
- Legacy Code
- Design Patterns
- Refactoring to Patterns
- Growing Object-Oriented Software, Guided by Tests
- xUnit Test Patterns: Refactoring Test Code

## Questions?

### Have you heard about TCR?

Falar um pouco sobre como fiquei impressionado com a maneira que as refatorações são feitas de maneira extremamente meticulosa e sempre under green. Isso me lembrou o Kent Beck's `Test && Commit || Revert`.


### 8.8 Pushing object creation to the edge

One of the last refactorings, in the BottleVerse class was the "push object creation to the edge". When I was first watching the lecture I assumed you were create the BottleNumber in the constructor method. But ok, it was created in the lyrics class method, and it's indeed the nearest to the edge possible.

My question is: do you see any issue in instantiating the BottleNumber in the constructor method?

### Next books?

The whole 99 bottles book makes us, I think most of us, to go ahead and read the Fowler's Refactoring book right after. But I'm in doubt if it would be better to go after "Working Effectively with Legacy Code". What do you recommend?

### Still about books: GOOS

Recently I saw a conversation between Nat Pryce and another guy, Nat Pryce being one of the authors of Growing Object Oriented Software Guided by Tests.

At some point of the conversation he mentions that the software being built in the book is a desktop application that uses a communication protocol that doesn't exist anymore or no one really uses.

That said, do you think it still worth to invest time time studying it?

---

## Recorded AMA sessions

- [2025-03](https://www.youtube.com/watch?v=R5PyfYlYyY4)
- [2025-02](https://www.youtube.com/watch?v=eL4-xIs1is0)
    - focus on the design of what changes more frequently
- [2024-11](https://www.youtube.com/watch?v=MwQQ6U2_23o) parei em 40min
    - new to a codebase
    - read the tests
    - UML class diagrams
    - https://blog.thecodewhisperer.com/permalink/integrated-tests-are-a-scam


---

Important concept:

> The reason we cost money is the time we spend reading code.

It doesn't matter if it's a human or an AI agent, the sentence is true in both situations.


---

## Open/Closed Principle

[link](https://courses.sandimetz.com/courses/take/poodi/texts/52234533-read-block-3-introduction)

### Listening to change

> And there's this weird fact of programming: Things that change, do. And what I mean by that is that the stuff that changes, the things that change at the highest rate in your application often are concepts or ideas that are core to your domain. And so the most changeable things are the most valuable to your business. And they're the things that you most need to be changeable. And now that this code is starting to change, we need to make it more amenable to change, which means we need OO.

### Starting with the Open/Closed Principle

> Open/Closed: Open for extension and Closed for modification. This principle says that when you're adding code to fulfill a new requirement, you should not **simultaneously** change existing code.

> If code is open, adding new features is easy. And if the cost of code is in the reading, this minimizes the amount of code you have to read in order to add new features, which by definition is going to reduce costs.

Flowchart for when you need to add a new feature to the code:

![[Sandi Metz POOD-I course - Open-Closed flowchart.png]]

One interesting approach Sandi mentions in section 8.2:

> if [the code is] not open and you don't know how to make it open, we fall back and look at code smells. And it's not clear, in this code, that there really are any smells, or what we would do about them even if we could find them. (...) The way for us to figure out what to do next, is to really go and write the worst code possible, the kind of code that we've been telling you throughout this book that you should not write.
>
> **The useful thing about writing some bad code is that, often, it will introduce code smells and it will give us some glimpse of the future that we can then, preemptively, decide what code smells we're going to have and use refactorings to remove them.**

### Code Smells

- **Bloaters** - unnecessarily increase the volume of code (more code to understand and maintain)
  - long function
  - large class
  - data clumps
  - long parameter list
  - primitive obsession
- **Abusers** - things you could do in OO but maybe you should be a little careful of, and then not do too much.
  - repeated switches
  - refused bequest
  - alternative classes with different interfaces
  - temporary field
  - global data
  - mutable data
- **Preventers** - prevent people to easily make changes in code.
  - divergent change
  - shotgun surgery
  - mysterious name
- **Dispensables** - arbitrary additions in code that increase its length and don't add much value (most of these things can be done in a simpler way)
  - lazy element
  - speculative generality
  - data class
  - duplicated code
  - comments
  - loops
- **Couplers** - bind objects together.
  - feature envy
  - insider trading
  - message chains
  - middle man

## Refactoring techniques

### Techniques to find a good name

- What's the responsibility of the method I'm about to create?
- One layer of abstraction above the concrete code.
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
> The point of Liskov is: the objects have to be what they say they are. They have to behave like you expect. They can't do anything that forces folks that interact with them to check what kind of thing they are in order to know how to talk to them.
>
> (...) even though you're in a dynamically-typed language, you should never check the return type in order to know what message to send. Just because you can do it doesn't mean you should. Instead, make up a role, define a duck type, be clear about what its API is, and teach all the players, all the objects that play that role, to conform to the API.

Good judgement:

> Good judgment comes from experience, and experience comes from bad judgment.

Object-Oriented

> One of the most fundamental concepts in OO is to isolate the behavior you want to vary.


Tests help the design:

> An object that's hard to test is attempting to warn you that it will be difficult to reuse.

Design with the message sender POV:

> Don't be trapped by what's currently true, but instead loosen coupling by _designing_ a conversation that embodies what the message sender wants.


Class methods:

> Putting domain behavior on the class side rather than on the instance side places a bet that this domain concept will never involve data that varies.
>
> (...) Part of your programming aesthetic is to reflexively put domain behavior on instances.

> Uncertainty about the future is not a license to guess; it's a directive to decouple.

## Block 7

Relates to the book sections 5.3 and 5.4.

- Appreciating immutability.


- Assuming fast enough
    - "Don't complicate code based on guesses."
        - Write simple code
        - Profile the slow parts
        - Fix what's slow
    - Initial solution
        - use immutable objects
        - treat object creation as free
        - avoid caching

> The cost of code is in the reading, then straightforward code should be your first shot at solving any problem.


### Inheritance

> When inheritance goes wrong, it goes wrong for a couple of reasons.
>
> The **first** reason is the hierarchies get too big. If you have a very deep--lots of levels down--and a very wide--lots of objects at each level--inheritance hierarchy, deep and wide, what happens is that people tend to understand the levels at the top and the ones at the very bottom, and then the middle becomes some big ball of mushy mud where bugs lurk. It's very difficult for people to know how to change things in such a way that won't break everything. And so deep, wide hierarchies are to be avoided. You should write the code another way if you find your inheritance leading to that. It's also likely to go wrong if you create a subclass that overrides or specializes just a tiny portion of a much larger superclass.


### Block 11

> my biggest goals in writing code. (...) I want my code to be understandable, and I want to reduce the cost of these inevitable changes.
> Writing understandable code--all you have to do is get names right and don't speculate about stuff. Don't put a bunch of code in there that's not being used for current requirements.


### Factories

> And this is the essence of factories. Factories don't know what to do, they know how to choose who does. They consolidate the choosing, and they separate the chosen.

### Monkey Patching

About changing the behavior of `+` in Integer, for example.

> **You may not alter the behavior of the standard library**, never, ever, under any circumstances whatsoever. If there's something you need to do, you should figure out a different way to do it.


## Extract Class

1. choose a name
2. add `attr_reader`/`initialize`
3. **copy** methods from old to new
4. wire new class into old
5. clean up extra args

## Inverting Dependencies

> Depend on abstractions, not on concretions.

The "inversion" suggests that you flip something from one state to its opposite. The state and the opposite in this case is "concrete" and "abstract". The inversion is about depending on abstractions, not on concretions.


## Law of Demeter

An object should interact only with it's direct (collaborators) dependencies. "Don't talk to strangers"

> If you violate Demeter by talking to your friends' friends, you tightly couple yourself to a network of objects.  This makes your application fragile, that is, your object might break because of an unexpected change to a distant and apparently unrelated thing.

> Now that you understand the Law of Demeter, following it should become a part of your programming aesthetic. **Be extremely biased towards fixing violations**. The overall cost of dealing with each transgression as it occurs is guaranteed to be less than the ultimate cost of repairing the few spiral out of controla fter infecting your code for several years.

> [The value of fixing Demeter violations is that] they force you to step back from the current structure of your code and to create messages that embody **what the sending object wants**.


## Process used to create a template role

1. Identify the code you want to vary
2. Name the underlying concept
3. Extract the identified code into its own class.
4. Inject this new role-playing object back into the object from which it was extracted.
5. Forward messages from the original class to the injected object.


## OO aesthetics

### Push object creation to the edge

> Applications that use dependency injection evolve naturally and of necessity, into systems where object creation begins to separate from object use. Object creation gets pushed more towards the edges, towards the outside, and the objects themselves interact more towards the middle, or the inside.

> Experienced OO programmers know that applications most easily adapt to the unknown future if they:
>
> - resist giving instance methods knowledge of concrete class names
> - seek opportunities to move the object creation towards the edges of the application.
>
> (...) you should be eternally alert for instance methods that reference class names and perpetually on the lookout for ways to remove those references.


### 5 precepts of OOP aesthetics

1. Put domain behavior on instances.
2. Be averse to allowing instance methods to know the names of constants.
3. Seek to depend on injected abstractions rather than hard-coded concretions.
4. Push object creation to the edges, expecting objects to be created in one place and used in another.
5. Avoid Demeter violations, using the temptation to create them as a spur to search for deeper abstractions.


## Tests

> You can write poorly coded tests for nicely designed code, but the opposite is not possible. Poorly designed code is usually hard to test.

