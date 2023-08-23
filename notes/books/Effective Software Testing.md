---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: 2023
author: Mauricio Aniche
deck: programming::testing
---

# Effective Software Testing


See also: <https://github.com/meleu/effective-software-testing-ruby>

> Testing and test code can guide you through software development. But software testing is about finding bugs, and that is what this book is primarily about.

## 01. Effective and systematic software testing

<!-- basicblock-start oid="ObsFgnixHyh7gmmukJ1ekm0T" -->
### The 7 Testing Principles
::
1. Exhaustive testing is impossible.
2. Know when to stop.
3. Pesticide paradox: variability is important.
4. Bugs happen in some places more than others.
5. Testing will never be perfect or enough ("test show the presence of bugs, not absence").
6. Context is king.
7. Absence-of-errors fallacy: verification is not validation.
<!-- basicblock-end -->

### Testing Pyramid

![[Effective Software Testing - testing pyramid.png]]

#### 1.2.6 Systematic testing

> Being *systematic* means that for a given piece of code, any developer should come up with the same test suite.

#### 1.3.1 Exhaustive testing is impossible

We do not have the resources to completely test our programs.

> Suzenne, a junior software tester, has just joined  very large online payment company. As her first task, Suzanne analyzes the past two years' worth of bug reports. Shue observes that more than 50% of the bugs happen in the international payments module. Suzanne promises her manager that she will design test cases that completely cover the international payments module and thus find all the bugs.
> 
> The "exhaustive testing" principles may explain that this is not possible.

#### 1.3.3 Variability and the pesticide paradox

Variability is important! Use different strategies to test your software. Otherwise you can suffer from the **pesticide paradox**: when the methods used to prevent bugs leaves a residue of subtler bugs against which those methods are ineffectual.

> Kelly, a very experienced software tester, visits Books!, a social network focused on matching people based on the books they read. Users do not report bugs often, as the Books! developers have strong testing practices in place. However, users say that the software is not delivering what it promises.

### Exercises

#### 1.1 Systematic testing

> In your own words, explain what systematic testing is and how it is different from non-systematic testing

Systematic testing is testing based in shared principles, so all developers can (ideally) come with the same test suite for a given piece of code to be tested.

A non-systematic testing strategy would be when different developers create very distinct test suites.
