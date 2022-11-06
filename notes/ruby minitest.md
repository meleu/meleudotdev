---
dg-publish: true
---
# Intro to TDD with Ruby's minitest

- <http://tutorials.jumpstartlab.com/topics/testing/intro-to-tdd.html>

See also: <https://semaphoreci.com/community/tutorials/getting-started-with-minitest>

## Requisites

We're going to implement a small unicorn class with these requirements:

- unicorns have names
- they are usually white, but can be any color
- they say "sparkly" things (don't worry, we'll explain what this means).


## Setup

This will install minitest globally:
```bash
gem install minitest
```

Creating projects dir/files:
```bash
mkdir unicorn
cd unicorn
touch unicorn_test.rb
touch unicorn.rb
```

```ruby
# configuring minitest:
gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride' # colors! :)

# loading the class we want to test
require_relative 'unicorn'

# starting the test suite
class UnicornTest < Minitest::Test
end
```

To run the test:
```bash
ruby unicorn_test.rb
```


## Assertions

[docs](https://devdocs.io/minitest-minitest-assertions/)

- `assert_equal(expected, actual, msg = nil)` 
- `assert(test, msg = nil)`
    - use it instead of `assert_equal true, test`
- `refute(test, msg = nil)`
    - use it instead of `assert_equal false, test`


## Skipping a Test

A test can be skipped with `skip`.

Example:
```ruby
def test_something_else
  skip
  assert_equal 1, nil - 1
end
```
