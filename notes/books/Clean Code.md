---
dg-publish: true
tags:
  - books
read-timestamp: 2022
author: Robert Martin
---

# Clean Code

#books/tech 

[TOC]

---

## Clean Code - 1. Clean Code

### Quality vs. Business Pressure

In the Chapter 1 I found an inspiring and powerful analogy for when I think about "how to encourage people to care about quality, despite business pressure":

> what if you were a doctor and had a patient who demanded that you stop all the silly hand-washing in preparation for surgery because it was taking too much time? Clearly the patient is the boss; and yet the doctor should absolutely refuse to comply. Why? Because the doctor knows more than the patient about the risks of disease and infection. It would be unprofessional (never mind criminal) for the doctor to comply with the patient.

It somehow made remember the [[Regra 02 - Cuide de si mesmo como cuidaria de alguém sob sua responsabilidade]], where Jordan Peterson says that we are more susceptible to external pressure (a doctor being unprofessional can be considered a crime) than internal motivation (a doctor just wanting to be "professional").

Another good thing to keep in mind is that:

> [managers] may defend the schedule and requirements with passion; but that's their job. It's *your* job to defend the code with equal passion.


### Reading vs. Writing

**We want the reading of code to be easy, even if it makes the writing harder.**

We read code much more than we write. In fact there's no way to write code without reading code.

> the ratio of time spent reading vs. writing is well over 10:1. We are *constantly* reading old code as part of the effort to write new code.
> 
> Because this ratio is so high, **we want the reading of code to be easy, even if it makes the writing harder.** Of course there's no way to write code without reading it, so *making it easy to read actually makes it easier to write*.
> 
> (...) if you want your code to be easy to write, make it easy to read.


### The Boy Scout Rule

> Leave the campground cleaner than you found it.

Replace *campground* with *code* above. 🙂

---

## Clean Code - 2. Meaningful Names

### use intention-revealing names

👎 don't:
```c
int d; // elapsed time in days
```

👍 do:
```c
int elapsedTimeInDays;
```

Example: a mine sweeper game. Here's a function to get all flagged cells.

👎 don't:
```cpp
public List<int[]> getThem() {
  List<int[]> list1 = new ArrayList<int[]>();
  for (int[] x : theList)
    if (x[0] == 4)
      list1.add(x);
  return list1;
}
```

👍 do:
```cpp
// Note the meaningful names, directly related
// with the "solution domain", not with the
// technical/implementation details.
public List<Cell> getFlaggedCells() {
  List<Cell> flaggedCells = new ArrayList<Cell>();
  for (Cell cell : gameBoard)
    if (Cell.isFlagged())
      flaggedCells.add(cell);
  return flaggedCells;
}
```


### avoid disinformation

Example: avoid `accountList` if it's not an actual list (the data structure). Simply use `accounts`.


### make meaningful distinctions

Name your functions with blatant differences.

Imagine the cognitive load if we had in the same code base these three different functions:

```c
getActiveAccount();
getActiveAccounts();
getActiveAccountInfo();
```

### use pronounceable names

You want to discuss your code with your colleagues without sounding like an idiot.

👎 don't:
```java
class DtaRcrd {
  private Date genymdhms;
  private Date modymdhms;
  /* ... */
}
```

👍 do:
```java
class Customer {
  private Date generationTimestamp;
  private Date modificationTimestamp;
  /* ... */
}
```

Intelligent conversation is now possible: "Hey, Mikey, take a look at this record! The generation timestamp is set to tomorrow's date!"

### use searchable names

**Avoid single-letter names and numeric constants.** They are not easy to locate across a body of text.

Note: using `i`, `j` and `k` for loops is acceptable **if the scope is small** (but never `l` as it can look like the number `1`).


### method/function names

> Accessors, mutators, and predicates should be named for their value and prefixed with `get`, `set`, and `is`.


### pick one word per concept

It's confusing to have in the same codebase, functions/methods with:

- `fetch`
- `retrieve`
- `get`

or

- `controller`
- `manager`
- `driver`

it will make you spend an awful lot of time browsing docs and code samples to understand the difference.

Pick one word per concept and be consistent!


### use solution domain names

> Remember that the people who read your code will be programmers. So go ahead and use computer science terms, algorithm names, pattern names, math terms, and so forth. It is not wise to draw every name from the problem domain because we don't want our coworkers to have to run back and forth to the customer asking what every name means when they already know the concept by a different name.

(I think this topic is also addressed in [[Domain Driven Design]], but I didn't read it yet)


### add meaningful context

> Imagine that you have variables named `firstName`, `lastName`, `street`, `houseNumber`, `city`, `state`, `zipcode`. Taken together it's pretty clear that they form and address. But what if you just saaw the `state` variable being used alone in a method? Would you automatically infer that it was part of an address?
> 
> You can add context by using prefixes: `addrFirstName`, `addrLastName`, `addrState`, and so on. At least readers will understand that these variables are part of a larger structure.

> `Address` is a fine name for a class. If I need to differentiate between MAC address, port addresses, and Web addresses, I might consider `PostalAddress`, `MAC`, and `URI`. The resulting names are more precise, which is the point of naming.


### don't add gratuitous context

> In an imaginary application called "Gas Station Deluxe", it is a bad idea to prefix every class with `GSD`. Frankly, you are working against your tools. You type `G` and press the completion key and are rewarded with a mile-long list of every class in the system. Is that wise? Why make it harder for the IDE to help you?


## Functions

Some rules for functions:

- Small
- Do one thing
- One level of abstraction per function
- Read code from top to bottom
- Use descriptive names
- Use as less arguments as you can (ideally zero)

### Small!

The functions should be small.

> Functions should not be 100 lines long. Functions should hardly ever be 20 lines long.

#### Blocks and Indenting

> [Small functions] implies that the blocks within `if`, `else`, `while` statements should be one line long. Probably that line should be a function call. Not only does this keep the enclosing function small but it also **adds documentary value because the function called within the block can have a nicely descriptive name**.

### Do One Thing

> Functions should do one thing. They should do it well. They should do it only.

> the reason we write functions is to decompose a larger concept (in other words, the name of the function) into a set of steps at the next level of abstraction.

> [one] way to know that a function is doing more than "one thing" is if you can extract another function from it with a name that is not merely a restatement of its implementation.

### One Level of Abstraction per Function

> Mixing levels of abstraction within a function is always confusing. Readers may not be able to tell whether a particular expression is an essential concept or a detail. Worse, like broken windows, once details are mixed with essential concepts, more and more details tend to accrete within the function.


### Reading Code from Top to Bottom: *The Stepdown Rule*

> We want the code to read like a top-down narrative. We want every function to be followed by those at the next level of abstraction so that we can read the program, descending one level of abstraction at a time as we read down the list of functions.


### Use Descriptive Names

> You know you are working on clean code when each routine turns out to be pretty much what you expected.

> Half of the battle to achieving that principle is choosing **good names** for **small functions** that **do one thing**.

> Don't be afraid to make a name long. A long descriptive name is better than a short enigmatic name. A long descriptive name is better than a long descriptive comment.



### Function Arguments

> The ideal number of arguments for a function is zero. Next comes one, followed closely by two. Three arguments should be avoided where possible. More than three requires very special justifications - and then shouldn't be used anyway.

Besides the "easy to read and understand" reason, another one that I liked while reading the book is that "the more arguments a function has, the harder it is to write tests for it".



