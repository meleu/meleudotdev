---
dg-publish: true
---
repository: <https://github.com/PotatoCanyon/poodi_virtual>

Sequence of exercises to do with the code from the poodi_virtual repository.

My intention is just to repeatedly do the refactorings done through the book in order to cement my understanding.

## 1. Test Driving Shameless Green

```bash
git checkout block_1
rerun -x -- ruby bottles/test/bottles_test.rb
```

### Task

Start writing a 'Shameless Green' version of bottles.  

'Shameless Green' is a solution that's optimized for readability without consideration for future change.  You can think of it as the simplest version possible, or the one you'd write if you know the requirement would never change.

The `bottles_test.rb` file contains many tests.  All but the first are skipped. 

1. write code in `bottles.rb` to make the first  test pass
2. edit `bottles_test.rb` to remove the skip from the next test
3. toggle back to `bottles.rb` and update the code so that both tests pass
4. iterate until all tests pass

Un-skip the tests one at a time.  Make sure all the tests pass before un-skipping the next test!

Compare your code to the `block_1_end` branch of the repository.

If your version is significantly different than the code you see there, revisit Chapter 1 of the 99 Bottles of OOP book.


## 2. Unearthing Concepts 

### Reasoning

A new requirement arrived and before implementing it we start with the Open-Closed Principle in mind.

Steps to be taken when working on a new feature:

1. Improve the tests (if needed)
2. Refactor
    - Open-Closed principle (from SOLID)
    - Remove code smells (Refactoring book)
    - Repeat until your code is "open" to the new requirement
3. Implement the new feature

In this exercise we'll need to remove duplication in code by following the Flocking Rules, which are:

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

### Task

> if needed: `git checkout block_4`

Remove the duplication by following the flocking rules to create these methods:

- container
- quantity
- pronoun
- action
- successor

Tip: In the `case` block, the `2` and `else` cases are the most alike, except for the `bottle` vs. `bottles`. Start by remove such difference.

> TODO: Procurar no livro. horizontal refactoring required a fair amount of explanation. Here’s a reminder of the key actions:

Ending branch: `block_5_end`.

## 3. A smarter number

### Reasoning

Let's attack the Primitive Obsession by creating a smarter number.

### Task

Extract the `BottleNumber` class. This should move the recently created methods to a new `BottleNumber` class.

Ending branch: `block_6_end`.

## 4. Cache BottleNumber

### Task

Decrease the amount of object creation by caching `BottleNumber` instances.

Note: in this process you should be able to recognize a Liskov violation. We won't really solve that right now, but you should be conscious about that.

In the end of this task the message forwarding message should be deleted.

Ending branch: `block_8_end`.

## 5. Remove the Data Clump

### Reasoning

Note in `Bottles#verse` that `#quantity` and `#container` are frequently called together. This can be considered a Data Clump.

[See in the course](https://courses.sandimetz.com/courses/take/poodi/lessons/52234612-a-watch-consolidating-data-clumps)

### Task

Remove the Data Clump code smell.

Ending branch: `block_9_end`.

## 6. Replace Conditionals with Polymorphism

Move the conditionals to a factory.

Here’s a list of the recipe’s steps:

1. Create a subclass to stand in for the value upon which you switch.
    1. Copy one method that switches on that value into the subclass.
    2. In the subclass, remove everything but the true branch of the conditional.
        1. At this point, create a factory if it does not yet exist, and
        2. Add this subclass to the factory if not yet included.
    3. In the superclass, remove everything but the false branch of the conditional.
    4. Repeat steps above until all methods that switch on the value are dispersed.
2. Iterate until a subclass exists for every different value upon which you switch


## 7. Correct the Liskov violation in successor

6.4 Transitioning between types 

> The trick to moving forward using one-undo changes is to temporarily alter the factory to tolerate both kinds of input. During the transitional period where one successor method returns a bottle number and the other returns an Integer, the factory will have to handle both types. This requires doing something that is anathema to your object-oriented soul: you must change the factory to check the type of its input argument.

## 8. Making the easy change

TDD-style

## 9. Dispersing the choosing logic

7.7 Auto-registering candidates

- handles?
- registry
- register
- inherited

## 10. Extract the verse

> I need to study this part more.

Your client now wants similar songs with different lyrics.

Use pseudo code to introduce new code smells


## 11. Inverting dependencies 

8.5.1

Here’s the process used to create the verse template role:

1. Identify the code you want to vary.
2. Name the underlying concept.
3. Extract the identified code into its own class.
4. Inject this new role-playing object back into the object from which it was extracted.
5. Forward messages from the original class to the injected object.

## 12. Identify what the verse method wants

Solve the Law of Demeter violation

8.7

## 13. Push object creation to the edge

8.8 

Experienced object-oriented programmers know that applications most easily adapt to the unknown future if they:

- resist giving instance methods knowledge of concrete class names, and 
- seek opportunities to move the object creation towards the edges of the application.