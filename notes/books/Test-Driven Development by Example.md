---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: "2024"
author: "Kent Beck"
---

# Test-Driven Development by Example

## Patterns for TDD

![[Test-Driven Development by Example#TDD Patterns - main takeaways]]
![[Test-Driven Development by Example#Red Bar Patterns - main takeaways]]
![[Test-Driven Development by Example#Green Bar Patterns - main takeaways]]

### TDD Patterns

#### TDD Patterns - main takeaways

- test must be automated
  - (to prevent "no time for testing" death spiral)
- write a list of all test you know you will have to write
- tests must be isolated (no side effects)
- write the test before the production code
- (sometimes it's useful to) write the assertions first

#### Test (noun)

The "no time for testing" death spiral:

```mermaid
graph LR
  Stress --o tests[Run tests] --o Stress
```

In the graph above an increase in one node implies a decrease in the second node.

> The more stress you feel, the less testing you will do. The less testing you do, the more errors you will make. The more errors you make, the more stress you feel. Rinse and repeat.

To solve this we need **Automated Testing**.

#### Test List

> What should you test? Before you begin, write a list of all the tests you know you will have to write. The first part of our approach to dealing with programming stress is never to take a step forward unless we know where our foot is going to land. When we sit down to a programming session, what is it we intend to accomplish?


#### Test First

> When should you write your tests? Before you write the code that is to be tested.
> 
> You won't test after. Your goal as a programmer is running functionality. However, you need a way to think about design, you need a method for scope control.


#### Assert First

I liked this as a way to fight against a possible mental block when you need to write a test.

Start asking yourself: "What's the right answer?"

Example: we want to communicate with another system over a socket.

When we're done, the socket should be closed and we should have read the string `abc`

```ruby
def test_complete_transaction
  # ...
  assert reader.closed?
  assert_equal 'abc', reply.contents
end
```

Where does the `reply` come from? The socket:

```ruby
def test_complete_transaction
  # ...
  reply = reader.contents
  assert reader.closed?
  assert_equal 'abc', reply.contents
end
```

And the socket? We create it by connecting to a server:

```ruby
def test_complete_transaction
  # ...
  reader = Socket.new('localhost', default_port)
  reply = reader.contents
  assert reader.closed?
  assert_equal 'abc', reply.contents
end
```

But before this, we need to open a server:

```ruby
def test_complete_transaction
  writer = Server.new(default_port, 'abc')
  reader = Socket.new('localhost', default_port)
  reply = reader.contents
  assert reader.closed?
  assert_equal 'abc', reply.contents
end
```

Now we may have to adjust the names based on actual usage, but we have created the outlines of the test in teeny-tiny steps, informing each decision with feedback within seconds.


### Red Bar Patterns

#### Red Bar Patterns - main takeaways

- one step test
  - each test should represent one step toward your overall goal.
  - pick a test (from your test list) that will teach you something and that you are confident you can implement.
- starter test
  - start by testing a variant of an operation that doesn't do anything
- learning test (externally produced software)
  - write a little test that verifies that the API works as expected
- regression test
  - reproduce reported bugs in a test

#### One Step Test

> Which test should you pick next from the list? Pick a test that will teach you something and that you are confident you can implement.
>
> Each test should represent one step toward your overall goal.

#### Starter Test

> Which test should you start with? Start by testing a variant of an operation that doesn't do anything.
> 
> The first question you have to ask with a new operation is, "Where does it belong?" (...)
> 
> If you write a realistic test first, then you will find yourself solving a bunch of problems at once

#### Learning Test

> When do you write tests for externally produced software? Before the first time you are going to use a new facility in the package.
> 
> \[when] we are about to use a new method of a new class, instead of just using it, we write a little test that verifies that the API works as expected.

#### Break

> You're getting tired, so you're less capable of realizing that you're tired, so you keep going and get more tired.

#### Do Over

Sometimes it's better to just delete and do it all over again.



### Testing Patterns

#### Broken Test

> How do you leave a programming session when you're programming alone? Leave the last test broken.

The idea here is that the broken test will help you to get back the context in the next programming session.


### Green Bar Patterns

Patterns to make the code pass as quickly as possible (even if the result isn't something you want to live with for even an hour).

#### Green Bar Patterns - main takeaways

- patterns to go to green as quickly as possible
- fake it 'til you make it
  - return a constant (to get a green) and gradually transform it into an general expression.
- triangulation
  - write a simple test, then the implementation returning a constant, then another test to force a generalization (then cleanup the test duplication if the repetition bring no value)
- obvious implementation
  - if you know how to implement, just do it. But...
  - Solving the "clean code" at the same time that you solve the "that works" can be too much.


#### Fake It ('Til You Make It)

> What is your first implementation once you have a broken test? Return a constant. Once you have the test running, gradually transform the constant into an expression using variables.

This is a useful way to validate your test.

Effects that make Fake It powerful:

- Psychological: When the bar is green, you know where you stand. You can refactor with confidence.
- Scope control: Starting with one concrete example and generalizing from there prevents you from prematurely confusing yourself with extraneous concerns.


#### Triangulation

> How do you most conservatively drive abstraction with tests? Abstract only when you have two or more examples.

Example:

test:
```ruby
def test_sum
  assert_equal 4, plus(3, 1)
end
```

implementation
```ruby
def plus(augend, addend)
  4
end
```

back to test:
```ruby
def test_sum
  assert_equal 4, plus(3, 1)
  assert_equal 7, plus(3, 4)
end
```

now we can go back to implementation:
```ruby
def plus(augend, addend)
  augend + addend
end
```

> Once we have two assertions and we have abstracted the correct implementation for `plus`, we can delete one of the assertions on the grounds that it is completely redundant with the other.

#### Obvious Implementation

> How do you implement simple operations? Just implement them.
>
> (...) However, by using only Obvious Implementation, you are demanding perfection of yourself. (...) What if what you write isn't really the simplest change that could get the test to pass?
> 
> Solving "clean code" at the same time that you solve "that works" can be too much to do at once. As soon as it is, go back to solving "that works," and then "clean code" at leisure.



---

## Chapter 1

Main takeaways:
- create a todo list of what you need to do
- "when we write a test, we imagine the perfect interface for our operation"

### Quotes

> **When we write a test, we imagine the perfect interface for our operation.** We are telling ourselves a story about how the operation will look from the outside. Our story won't always come true, but it's better to start from the best-possible API.

> \[about the first failing tests] Failure is progress. Now we have a concrete measure of failure. That's better than just vaguely knowing we are failing.

> Do these steps seem too small to you? Remember, TDD is not about taking teeny-tiny steps, it's about *being able to* take teeny-tiny steps. (..) If you can make steps too small, you can certainly make steps the right size. If you only take larger steps, you'll never know if smaller steps are appropriate.

## Chapter 6

### Quotes

> You will often be implementing TDD in code that doesn't have adequate tests. When you don't have enough tests, you are bound to come across refactorings that aren't supported by tests. You could make a refactoring mistake and the tests would all still run. What do you do?
> 
> Write the tests you wish you had. If you don't, you will eventually break something while refactoring.


## Chapter 8

After replacing the usage of `Dollar.new` constructor with `Money.dollar` factory in the tests...

> We are now in a slightly better position than before. No client code knows that there is a subclass called `Dollar`. By decoupling the tests from the existence of the subclasses, we have given ourselves freedom to change inheritance without affecting any model code.

