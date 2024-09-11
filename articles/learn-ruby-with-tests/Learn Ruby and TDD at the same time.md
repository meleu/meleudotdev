---
dg-publish: true
---
This is going to be the fanciest "Hello, world" program you will ever write!

---

> This article is an attempt to teach the basics of Ruby and TDD (with Minitest) at the same time.
> 
> It's mainly aimed at people who already know how to code and want to quickly learn such topics.
> 
> It's heavily inspired by the first chapter of the awesome [Learn Go with Tests](https://quii.gitbook.io/), by [Chris James](https://quii.dev/).
> 
> If you enjoy this, please leave a comment and share so I can measure the interest and **maybe** evolve this to a free book (still inspired by "Learn Go with Tests" but focused on idiomatic Ruby and Object-Oriented Programming).
> 
> It's assumed you already have Ruby installed. The code here were tested on Ruby 3.2.

---

## Hello, World

It is traditional for your first program in a new language to be [Hello, World](https://en.m.wikipedia.org/wiki/%22Hello,_World!%22_program).

Open your terminal and create a `hello` directory:
```bash
mkdir hello
```

Create a new file called `hello.rb` and put the following code inside it:
```ruby
puts("Hello, World")
```

To run it type `ruby hello.rb` in your terminal.

## How it works

The `puts` instruction stands for "Put String", and what it does is to put the string you give to it in the output.

In our code we're giving the "Hello, World" string.


## How to test

How do you test this program? It is good to separate your "domain" code from the outside world (side-effects). The `puts` is a side effect (printing to stdout), and the string we send in is our domain.

So, let's separate these concerns so it's easier to test:

```ruby
def hello()
  return("Hello, world")
end

puts(hello())
```

We have defined a new function with `def` and we're returning the string `"Hello, world"`.

### Idiomatic Ruby

I'd like to call your attention to the fact that the code above has a lot of parentheses. If you're coming from another programming language you may think it's perfectly normal.

In Ruby the use of these parentheses are usually optional. They may be required to clear up what may otherwise be ambiguous in the syntax, but in simple cases the Ruby programmers usually omit them.

Let's code like a real Rubyist and clear the unnecessary parentheses from our code:

```ruby
def hello
  return "Hello, world"
end

puts hello
```

Another Ruby syntactic sugar is that the last evaluated expression of a ruby function is always returned. Therefore the use of the `return` in the last line is unnecessary.

So, let's clear our code a little more:

```ruby
def hello
  "Hello, world"
end

puts hello
```

That's much easier on the eyes, don't you agree?

### Writing your first test

Now create a new file called `hello_test.rb` where we are going to write a test for our `hello` function.

```ruby
require 'minitest/autorun'
require_relative 'hello'

class TestHello < Minitest::Test
  def test_hello
    expected = "Hello, world"
    actual = hello
    assert_equal expected, actual
  end
end
```

The next step is to run the test.

Enter `ruby hello_test.rb` in your terminal and you should see something like this:

```
$ ruby hello_test.rb
Hello, world
Run options: --seed 20392

# Running:

.

Finished in 0.001096s, 912.1682 runs/s, 912.1682 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

If you see something similar to this 👆 then your test passed!

Don't worry (for now) if parts of this output looks cryptic, we'll learn about that soon.

Just to check, try deliberately breaking the test by changing the `expected` string. You'll notice that the `.` dot will be replaced with an `F`, meaning that a Failure happened.

### Minitest "rules"

Writing a test with Minitest is like writing a method in a class, but with some "rules" (some of them are not actual strict rules)

- The file should be named like `*_test.rb` (not mandatory, but a good practice)
- The file do `require 'minitest/autorun'` so we can easily run it from the command line.
- The file must `require_relative 'hello'` so it can access the code being tested.
- The test must be written in a subclass of `Minitest::Test` (don't worry if you still don't know what is a subclass)
- The test method must start with `test_`
- The assertion determines if the test is to be considered successful or not. In this case we are asserting that the expected value is equal to the actual value using `assert_equal expected, actual`.

In this testing code we're covering some new Ruby concepts:

#### require and require_relative

When a file needs the code defined in another file, one way to access it is requiring the "another file".

When we use `require`, we're getting the code from a package installed in our system (in Ruby we call such packages as "gems").

When we use `require_relative`, we're getting the code from a file stored in a path relative to the current file. In our case, as both `hello_test.rb` and `hello.rb` are in the same directory, we can simply use `require_relative 'hello'` (yeah, you guessed right: the `.rb` extension can be omitted).

#### creating a subclass

In the code below we're creating a new class named `TestHello` as a subclass of `Minitest::Test`:

```ruby
class TestHello < Minitest::Test
  # ...
end
```

The concept of class and subclass will be explained in another moment. For now just keep in mind that when we create the `TestHello` as a subclass of `Minitest::Test`, this means that `TestHello` inherits the behavior defined in `Minitest::Test`.


## Hello, YOU

Now that we have a test, we can iterate on our software safely.

In the last example, we wrote the test _after_ the code had been written. We did this so that you could get an example of how to write a test and declare a function. From this point on, we will be _writing tests first_.

Our next requirement is to specify the recipient of the greeting.

Let's start by capturing these requirements in a test. This is basic test-driven development and allows us to make sure our test is _actually_ testing what we want. When you retrospectively write tests, there is the risk that your test may continue to pass even if the code doesn't work as intended.

```ruby
require 'minitest/autorun'
require_relative 'hello'

class TestHello < Minitest::Test
  def test_hello
    expected = "Hello, meleu"
    actual = hello("meleu")
    assert_equal expected, actual
  end
end
```

Now run `ruby hello_test.rb` and you should see a failure like this:

```
# Running:

E

Finished in 0.001266s, 789.7771 runs/s, 0.0000 assertions/s.

  1) Error:
TestHello#test_hello:
ArgumentError: wrong number of arguments (given 1, expected 0)
    hello.rb:1:in `hello'
    hello_test.rb:7:in `test_hello'

1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

It's important to pay attention to the error message here, it gives us the information we need to figure out what's wrong with our code.

The Ruby interpreter is telling what you need to do to continue. In our test we passed an argument to the `hello` function, but the function is not prepared to receive an argument. That's why Ruby is telling us: `wrong number of arguments (given 1, expected 0)`.

Edit the `hello` function to accept an argument. Now your `hello.rb` should look like this:

```ruby
def hello(name)
  "Hello, world"
end

puts hello
```

If you try and run your tests again, it will fail with a kinda scary message:

```
/path/to/hello.rb:1:in `hello': wrong number of arguments (given 0, expected 1) (ArgumentError)
        from /path/to/hello.rb:5:in `<top (required)>'
        from hello_test.rb:2:in `require_relative'
        from hello_test.rb:2:in `<main>'
```

This output looks different from what we saw before. But we can see that it's pointing that we're still passing a wrong number of arguments, but now it's complaining that we're giving 0 while `hello` expects 1.

The error happened when our test file were doing `require_relative 'hello'` and the line `puts hello` was reached. That line is being actually executed (we should move that `puts` to a different file, but let's keep things simple for now).

The line is calling `#hello` with no arguments, but now it requires one. So let's fix that in `hello.rb`:

```ruby
puts hello("world")
```

Now when you run the tests you should see a failure with this message:

```
  1) Failure:
TestHello#test_hello [hello_test.rb:8]:
Expected: "Hello, meleu"
  Actual: "Hello, world"
```

The test is now failing because it's not meeting our requirements.

Let's make the test pass by using the `name` argument and interpolate it in the string being returned by `#hello`. In Ruby, we do interpolation with `#{variable_name}`, like this:

```ruby
def hello(name)
  "Hello, #{name}"
end
```

When you run the tests now, it should pass.

Normally, as part of the TDD cycle, we should now _refactor_.


### A note on source control

At this point, if you are using source control (which you should!) you should `commit` the code as it is. We have working software backed by a test.

Example:

```bash
git add hello.rb hello_test.rb
git commit -m 'hello-world, work in progress'
```

I _wouldn't_ push to main though, because I plan to refactor next. It is nice to commit at this point in case you somehow get into a mess with refactoring - you can always go back to the working version.


## Hello, world... again

The next requirement is when our function is called with no arguments, it defaults to printing `Hello, world`, rather than `Hello, `.

As TDD practitioners, we write the _tests first_, so let's write a new failing test.

```ruby
class TestHello < Minitest::Test
  def test_say_hello_to_people
    expected = "Hello, meleu"
    actual = hello("meleu")
    assert_equal expected, actual
  end

  def test_say_hello_world_when_called_with_no_arguments
    expected = "Hello, world"
    actual = hello
    assert_equal expected, actual
  end
end
```

Do note that the test functions now have a descriptive (and long) name. It's important to give descriptive names to your tests, so you can know what to do when they fail.

After running the tests we'll see an output like this:

```
# Running:

.E

Finished in 0.001415s, 1413.7393 runs/s, 706.8696 assertions/s.

  1) Error:
TestHello#test_say_hello_world_when_called_with_no_arguments:
ArgumentError: wrong number of arguments (given 0, expected 1)
    /path/to/hello.rb:1:in `hello'
    hello_test.rb:13:in `test_say_hello_world_when_called_with_no_arguments'

2 runs, 1 assertions, 0 failures, 1 errors, 0 skips
```

That error message is telling us that:

- the `TestHello#test_say_hello_world_when_called_with_no_arguments` failed
- it failed due to the `ArgumentError`, because the `#hello` expected 1 argument and we didn't give any.

Let's check our `#hello` again:

```ruby
def hello(name)
  "Hello, #{name}"
end
```

Now we have a dilema:

- `#hello` expects an argument so we can use `hello("meleu")`
- we also want to be able to call `#hello` with no arguments and it should respond with `"Hello, world"`

To achieve this we can define a default value for the `name` argument, like this:

```ruby
def hello(name = 'world')
  "Hello, #{name}"
end
```

As we're defining a default value for the `name` variable, calling `#hello` with an argument is optional (if none is passed, it uses the default value).

Run your tests and you should see a successful run. It satisfies the new requirement and we haven't accidentally broken the other functionality.

It is important that your tests are _clear specifications_ of what the code needs to do.

### Back to source control

Now that we are happy with the code, I would amend the previous commit so that we only check in the lovely version of our code with its test.

Example:
```bash
git add hello.rb hello_test.rb
git commit --amend
```

### Discipline

Let's go over the cycle again:

- Write a test
- Run the test, see it fails and check the error message
- Write enough code to make the test pass
- Refactor

On the face of it this may seem tedious, but sticking to the feedback loop is important.

Not only does it ensure that you have _relevant tests_, it helps ensure _you design good software_ by refactoring with the safety of tests.

Seeing the test fail is an important check because it also lets you see what the error message looks like. As a developer it can be very hard to work with a codebase when failing tests do not give a clear idea as to what the problem is.

By ensuring your tests are _fast_ and setting up your tools so that running tests is simple, you can get in to a state of flow when writing your code.

By not writing tests, you are committing to manually checking your code by running your software, which breaks your state of flow. You won't be saving yourself any time, especially in the long run.

## Keep going! More requirements

A new requirement arrived! We now need to support a second parameter, specifying the language of the greeting. If we don't recognize the language, default to English.

We should be confident that we can easily use TDD to flesh out this functionality!

### Hola

Let's write a test for a user passing in Spanish and add it to the existing suite.

```ruby
def test_say_hello_in_spanish
  expected = "Hola, Juan"
  actual = hello("Juan", "spanish")
  assert_equal expected, actual
end
```

Remember not to cheat! _Test first_.

```
# Running:

..E

Finished in 0.000772s, 3884.1235 runs/s, 2589.4157 assertions/s.

  1) Error:
TestHello#test_say_hello_in_spanish:
ArgumentError: wrong number of arguments (given 2, expected 0..1)
    /path/to/hello.rb:1:in `hello'
    hello_test.rb:19:in `test_say_hello_in_spanish'

3 runs, 2 assertions, 0 failures, 1 errors, 0 skips
```

We can see that our software is still working for the two initial tests we already have, and failing only for the new one.

We're again having an `ArgumentError: wrong number of arguments (given 2, expected 0..1)`. That's because in our test we're calling `hello("Juan", "spanish")`, with 2 arguments.

Let's fix this by adding a new argument to `#hello`:

```ruby
def hello(name = 'world', language)
  "Hello, #{name}"
end
```

That's our attempt to write just enough code to make the test pass, based on the error message. Then, let's run the test:

```
# Running:

FFE

Finished in 0.000895s, 3351.7981 runs/s, 2234.5321 assertions/s.

  1) Failure:
TestHello#test_say_hello_to_people [hello_test.rb:8]:
Expected: "Hello, meleu"
  Actual: "Hello, world"

  2) Failure:
TestHello#test_say_hello_in_spanish [hello_test.rb:20]:
Expected: "Hola, Juan"
  Actual: "Hello, Juan"

  3) Error:
TestHello#test_say_hello_world_when_called_with_no_arguments:
ArgumentError: wrong number of arguments (given 0, expected 1..2)
    /path/to/hello.rb:1:in `hello'
    hello_test.rb:13:in `test_say_hello_world_when_called_with_no_arguments'

3 runs, 2 assertions, 2 failures, 1 errors, 0 skips
```

😱 Our change broke all tests!!!

Always keep this in mind: if your change breaks tests that are unrelated to your current work, you're probably doing something wrong!

Tests are a safety net that brings confidence to change the code with no fear. If tests fail because you've broken the code, the cure is simple: undo the last change and make a better one.

In our case here we're breaking the previous tests because we added a new _mandatory_ argument: `language`. In order to fix this we should make it optional by setting a default value for it.

```ruby
def hello(name = 'world', language = 'english')
  "Hello, #{name}"
end
```

Let's run the tests:

```
# Running:

..F

Finished in 0.000799s, 3755.2759 runs/s, 3755.2759 assertions/s.

  1) Failure:
TestHello#test_say_hello_in_spanish [hello_test.rb:20]:
Expected: "Hola, Juan"
  Actual: "Hello, Juan"

3 runs, 3 assertions, 1 failures, 0 errors, 0 skips
```

Good, now we have a failing test output with a clear direction about what must be done to make it pass. It's expecting a greeting with `Hola` and our code is greeting with `Hello`, so let's fix this:

```ruby
def hello(name = 'world', language = 'english')
  if language == 'spanish'
    greeting = 'Hola'
  else
    greeting = 'Hello'
  end

  "#{greeting}, #{name}"
end
```

Run the tests and you'll see it pass.

That's great, but we want to make our fancy "Hello World" program to be not only bilingual, but a polyglot!

### Bonjour

Let's add a test for the French language.

```ruby
def test_say_hello_in_french
  expected = 'Bonjour, Jean'
  actual = hello('Jean', 'french')
  assert_equal expected, actual
end
```

The test will fail with:

```
  1) Failure:
TestHello#test_say_hello_in_french [hello_test.rb:26]:
Expected: "Bonjour, Jean"
  Actual: "Hello, Jean"
```

Then let's write enough code to make the test pass.

```ruby
def hello(name = 'world', language = 'english')
  if language == 'spanish'
    greeting = 'Hola'
  elsif language == 'french'
    greeting = 'Bonjour'
  else
    greeting = 'Hello'
  end

  "#{greeting}, #{name}"
end
```

Run the tests and you'll see it pass.

When our tests succeed after implementing a new feature, it's time to _refactor_. Let's take this opportunity to learn how to use the `case` statement.

```ruby
def hello(name = 'world', language = 'english')
  case language
  when 'spanish'
    greeting = 'Hola'
  when 'french'
    greeting = 'Bonjour'
  else
    greeting = 'Hello'
  end

  "#{greeting}, #{name}"
end
```

After the change run the tests again to make sure you didn't break anything.

The code is working as expected, but I'm starting to feel like `#hello` is accumulating too much logic in it. I want to create a new function just to handle the multilingual greeting.

```ruby
def hello(name = 'world', language = 'english')
  "#{greeting(language)}, #{name}"
end

def greeting(language)
  case language
  when 'spanish'
    greeting = 'Hola'
  when 'french'
    greeting = 'Bonjour'
  else
    greeting = 'Hello'
  end
  greeting
end
```

Run the tests and it should pass.

Passing tests triggers a decision for us: refactor or stop coding this feature?

I still want a refactoring to make the `#greeting` function more idiomatic.

Remember when I said that the last evaluated expression of a ruby function is always returned? The whole `case` block is an expression and we can make it the last evaluated one:

```ruby
def greeting(language)
  case language
  when 'spanish'
    'Hola'
  when 'french'
    'Bonjour'
  else
    'Hello'
  end
end
```

Run the tests again and it should pass.

### Olá, Hallo, Ciao, Konnichiwa...

As an exercise add greetings for other languages.

Remember the cycle:

- Write a test
- Run the test, see it failing and check the error message
- Write enough code to make the test pass
- Refactor


## Key Concepts

This is probably the fanciest `Hello, world` you have ever written, isn't it?

We learn a bunch of things here.

### Ruby

- functions are defined with `def`
- parentheses in function calls are optional
- the last evaluated expression of a function is always returned
- string interpolation (e.g.: `"Hello, #{name}"`)
- `if-else` and `if-elsif-else` statements
- `case` statements
- how to write tests with Minitest

### TDD

The TDD process and _why_ the steps are important

- _Write a failing test and see it fail_
    - so we know we have written a _relevant_ test for our requirements
    - and seen that it produces an _easy to understand description of the failure_
- Writing the smallest amount of code to make it pass
    - so we know we have working software
- _Then_ refactor, backed with the safety of our tests
    - to ensure we have well-crafted code that is easy to work with

We've gone from `hello` to `hello("name")` and then to `hello("name", "french")` in small and easy to understand steps.

Of course this is trivial compared to "real-world" software, but the principles still stand.

TDD is a skill that needs practice to develop, and by breaking problems down into smaller components that you can test, you will have a much easier time writing _and reading_ software.