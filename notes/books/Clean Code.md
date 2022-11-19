---
dg-publish: true
tags:
  - books
read-timestamp: 2022-11
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
// Observe the meaningful names, directly related
// with the "business logic", not with the
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


