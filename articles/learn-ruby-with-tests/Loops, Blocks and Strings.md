---
dg-publish: true
---
When we want to do stuff repeatedly, we use loops. There are many ways to create loops in Ruby, and here we're going to see the simplest method.

In this chapter we're going to write a method that adds some sort of an underline in a string with the `=` character, like this:

```
this is a string
================
```

As usual, let's start with the test.

### Write the test first

Falar sobre o heredoc (mostrar link pra documentação).

```ruby
require 'minitest/autorun'
require_relative 'underline'

class TestUnderline < Minitest::Test
  def test_underline
    expected = <<~TEXT
      this is a string
      ================
    TEXT
    actual = underline('this is a string')

    assert_equal expected, actual
  end
end
```





### Write the minimal amount of code for the test to run

*Keep the discipline!* You don't need to know anything new right now to make the test fail properly.

All you need to do right now is enough to make the test **fail** with no **errors**.

So, create a file named `underline.rb` with this code:

```ruby
def underline(text)
  ""
end
```

Run the test and it should fail with no errors.


### Write enough code to make the test pass


In order to solve this we need:

- a way to check how many characters there are in a string,
- a way to print the `=` character the same amount of times.


> [!TODO]
> talk about:
> - String#length
> - Integer#times
> - [blocks](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html#6.-blocks)
> - string concatenation




### Refactor

```ruby
def underline(text)
  "#{text}\n#{'=' * text.length}\n"
end

```

### Repeat for new requirements


## Key Concepts

