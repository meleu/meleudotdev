---
dg-publish: false
---
> [!todo]
> Add an introduction about classes and class methods.

Now we want our fancy "Hello World" program to be in a class. Let's name our class as `Greeter`. With such name we need to call the `hello` method from the `Greeter` class like this:

```ruby
Greeter.hello
# => "Hello, world"

Greeter.hello("meleu")
# => "Hello, meleu"

Greeter.hello("meleu", "spanish")
# => "Hola, meleu"
```

Let's start this task by adapting our `hello_test.rb`, replacing the `hello` calls with `Greeter.hello`:

```ruby
require "minitest/autorun"
require_relative "hello"

class TestHello < Minitest::Test
  def test_say_hello_to_people
    expected = "Hello, meleu"
    actual = Greeter.hello("meleu") # 👈
    assert_equal expected, actual
  end

  def test_say_hello_world_when_called_with_no_arguments
    expected = "Hello, world"
    actual = Greeter.hello # 👈
    assert_equal expected, actual
  end

  def test_say_hello_in_spanish
    expected = "Hola, Juan"
    actual = Greeter.hello("Juan", "spanish") # 👈
    assert_equal expected, actual
  end

  def test_say_hello_in_french
    expected = 'Bonjour, Jean'
    actual = Greeter.hello('Jean', 'french') # 👈
    assert_equal expected, actual
  end
end
```

Let's run this test and check the results:
```
$ ruby hello_test.rb
Hello, world
Run options: --seed 5945

# Running:

EEEE

Finished in 0.001422s, 2811.9587 runs/s, 0.0000 assertions/s.

  1) Error:
TestHello#test_say_hello_world_when_called_with_no_arguments:
NameError: uninitialized constant TestHello::Greeter
    hello_test.rb:13:in `test_say_hello_world_when_called_with_no_arguments'

  2) Error:
TestHello#test_say_hello_to_people:
NameError: uninitialized constant TestHello::Greeter
    hello_test.rb:7:in `test_say_hello_to_people'

  3) Error:
TestHello#test_say_hello_in_spanish:
NameError: uninitialized constant TestHello::Greeter
    hello_test.rb:19:in `test_say_hello_in_spanish'

  4) Error:
TestHello#test_say_hello_in_french:
NameError: uninitialized constant TestHello::Greeter
    hello_test.rb:25:in `test_say_hello_in_french'

4 runs, 0 assertions, 0 failures, 4 errors, 0 skips
```

Wow! That's a verbose failure. But if we look carefully we'll notice that all of them are failing with `NameError: uninitialized constant TestHello::Greeter`.

That's happening because we didn't declared our `Greeter` class yet. So, let's do it!

Change your `hello.rb` to be exactly like this:

```ruby
# 👇 class declaration
class Greeter
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
end
# end of file
```

Run the tests and you should still see a bunch of errors. If you're following correctly, the errors should be:

```
NoMethodError: undefined method `hello' for Greeter:Class
```

That's because 




---

Explicação do que são:
- classes
- métodos de classe

