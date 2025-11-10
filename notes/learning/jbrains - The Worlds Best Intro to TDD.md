# The World's Best Intro to TDD

[link](https://online-training.jbrains.ca/courses/wbitdd-01/lectures/34779823)

## 4 Stages of TDD

1. Test-First Programming
    - bottleneck: bugs
2. Test-Driven Development
    - bottleneck: design
3. Predictability
    - bottleneck: volatility
4. Virtuosity
    - bottleneck: changing context

## Writing a test list

- Step 1: Write down any example that comes to mind.
- Step 2: Write simpler examples.
    - The simplest one is called the "kernel".
    - If we build the kernel first, then we can build everything else in (almost) any order we want (or need).
- Step 3: Write examples for all the variations, edge cases, and cool ideas that come to mind

Tips:
- Variation: think about that programmer who is obsessed to coding only what is specified.
- Always have a place to write things down and get them out of your head quickly.
- The goal of the technique always matter more than the mechanics of the technique.

[Useful video](https://online-training.jbrains.ca/courses/wbitdd-01/lectures/133490) demonstrating how to write a test list.

## microtechniques

[link](https://online-training.jbrains.ca/courses/wbitdd-01/lectures/133485)

### write the assertion first

The idea of writing the test starting with the assertion and then work backwards, helps me avoid copying and pasting fluff into my test. So write the assertion first and then figure out how to work backwards to everything I need in order to make that test run.

### worry about one thing at a time
In the assert_equal, we can't simply compare 0 with a Fraction object, unless we do one of this two things:
- implement an equals method
- access the internal value

While I don't like to access internal values of an object, at this point we don't want to get distracted with the implementation of an equals method. So, let's err on the side of safety. Take a note about your desire to create an equals method, and go ahead with your current task.

### all new tests must fail at least once

If the most basic implementation is enough to make the test pass, write incorrect code to see the test failing.

### rush to get a green

Even if you have to write an ugly workaround to make the test pass, that's the best step to take. Because if you're on red, try something that fails, you'll have to go back to red. And it's really dangerous to go from failing code to other failing code. Because you can't be 100% sure that the failing code you have now is failing for the same reasons as the code you had minutes ago.

### defect injection

Intentionally write incorrect code to ensure that a test fails. That's one way to test the tests.

### don't change things (when refactoring)

Don't cut code. Copy -> paste -> migrate.
Pretty much what is taught by Sandi Metz in 99 bottles.

### simplest way to add a new behavior

Add an if statement for the new case, else do the old thing.

### test files are named after the behavior being tested

Create a new test file when you want to test a new behavior.

### TDD vs. Unit Testing

They can look like the same activity, but the way of thinking is different.
- **TDD**:
  focus on driving the design and using examples to justify adding complications
- **Unit Testing**:
  add more confidence about what is already built, to check if it works as intended.


---

## To Read

Ward Cunningham, "[The CHECKS Pattern](https://c2.com/ppr/checks.html)". One of the first papers I read about the Whole Value pattern and related ideas. It provided me my first understandings of Primitive Obsession.

Martin Fowler, Refactoring: Improving the Design of Existing Code. The classic text on evolutionary design, which includes a thorough discussion of code smells, including Primitive Obsession, which the Whole Value pattern seeks to address.

Eric Evans, Domain-Driven Design: Tackling Complexity in the Heart of Software. The classic text that introduced me to the concepts of Value, Entity, and Service, as ways of classifying objects/modules in a system. Value corresponds to what people generally call "Value Objects".