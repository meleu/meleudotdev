---
dg-publish: true
---
# Ruby Minitest Cheatsheet

This cheatsheet was taken from <https://www.rubypigeon.com/posts/minitest-cheat-sheet/>

[assertion docs](https://devdocs.io/minitest-minitest-assertions/)

## Basic Structure

```ruby
require 'minitest/autorun'

# Classes act as groups of tests.
class RandomTests < Minitest::Test

  # The `setup` method is run before every test.
  def setup
    @random = File.open('/dev/random')
  end

  # The `teardown` method is run after every test.
  def teardown
    @random.close
  end

  # Tests are methods that begin with "test_".
  def test_reading
    content = @random.read(5)
    assert_equal 5, content.length
  end

  # The `skip` method prevents a test from running.
  # Skipped tests do not count as failures.
  def test_skipping
    skip 'Fix this test later'
  end

end
```


## Assertions

All of the following assertions pass.

**Note**: Although not shown here, every `assert_` and `refute_[]()` method takes an optional message as the last argument. This message appears in the output when the assertion fails.


```ruby
class AssertionsTest < Minitest::Test
  def test_assertions
    # The subjects (values being tested)
    singer = 'Michael Buble'
    calculation = 0.3 - 0.2 # = 0.09999999999999998

    # The most basic assertion
    assert singer.end_with?('e')

    # Equality/matching
    assert_equal 'Michael', singer.split.first # expected == actual
    assert_same singer, singer # expected.equal?(actual)
    assert_nil nil
    assert_match /Michael (Buble|Jackson)/, singer # regex =~ singer

    # Containers
    assert_empty "" # obj.empty?
    assert_includes singer, 'Bub' # singer.include?('Bub')

    # Numeric
    assert_in_delta 0.1, calculation    # float comparison (absolute error method)
    assert_in_epsilon 0.1, calculation  # float comparison (relative error method)
    assert_operator calculation, :<, 5  # calculation < 5

    # Types/messages
    assert_instance_of Float, calculation  # calculation.instance_of?(Float)
    assert_kind_of Numeric, calculation    # calculation.kind_of?(Numeric)
    assert_respond_to singer, :downcase    # singer.respond_to?(:downcase)

    # Generic
    assert_predicate calculation, :positive?   # calculation.positive?
    assert_send [singer, :start_with?, 'Mic']  # singer.start_with?('Mic')

    # Exceptions
    error = assert_raises(ZeroDivisionError) { 5 / 0 }
    assert_equal error.message, 'divided by 0'

    # Output
    assert_output("0.09999999999999998\n") { puts calculation }
    assert_silent { "nothing output to $stdout or $stderr" }

    # Refute (opposite of assert)
    refute singer.end_with?('Jackson')
    refute_empty singer
    refute_equal singer, 'Lady Gaga'
    refute_in_delta calculation, 3.14
    refute_in_epsilon calculation, 3.14
    refute_includes singer, 'z'
    refute_instance_of Numeric, calculation
    refute_kind_of Integer, calculation
    refute_match /Gaga/, singer
    refute_nil singer
    refute_operator calculation, :>, 3.14
    refute_predicate singer, :empty?
    refute_respond_to singer, :sing
    refute_same singer, 'Michael Buble'
  end
end
```

## Class-level Options

```ruby
class MyTest < Minitest::Test
  # Runs tests in alphabetical order, instead of random order.
  i_suck_and_my_tests_are_order_dependent!

  # Runs tests in parallel (multithreaded).
  parallelize_me!

  # Generates nicer diffs for complicated, nested values.
  make_my_diffs_pretty!
end
```


By default, Minitest runs threads in a random order. This is a good thing, as it surfaces nasty order dependency bugs. You can disable random ordering using the class method `i_suck_and_my_tests_are_order_dependent!`.

To catch more bugs, tests can be run in parallel using the `parallelize_me!` class method. This runs the tests in parallel, across multiple threads.

When an `assert_equal` assertion fails, Minitest outputs the difference between the expected value and the actual value. The make_my_diffs_pretty! class method makes diffs between large values easier to read. Pretty diffs look like this:

```
--- expected
+++ actual
@@ -1,4 +1,4 @@
 {:line1=>"I am the very model",
  :line2=>"Of a modern major general.",
- :line3=>"I've information vegetable",
+ :line3=>"I've information fruit",
  :line4=>"Animal and mineral."}
```

Compare the diff above to the default diff, which looks like this:

```
--- expected
+++ actual
@@ -1 +1 @@
-{:line1=>"I am the very model", :line2=>"Of a modern major general.", :line3=>"I've information vegetable", :line4=>"Animal and mineral."}
+{:line1=>"I am the very model", :line2=>"Of a modern major general.", :line3=>"I've information fruit", :line4=>"Animal and mineral."}
```

## Writing Custom Assertions

```ruby
class CustomAssertionTest < Minitest::Test
  def assert_uppercase(str, msg = nil)
    msg = message(msg) { "Expected #{mu_pp(str)} to be uppercase" }
    assert(str == str.upcase, msg)
  end

  def test_custom_assertion
    assert_uppercase 'HAHAHA'
  end
end
```

Custom assertions are just methods on a test class. Like all methods, they can be defined within the class, inherited from a superclass, or included via a module.

To be consistent, assertion methods should accept an optional message as the last argument.

Assertion methods should begin with either `assert_` or `refute_`. Minitest looks for these prefixes when an assertion fails, to tell the user which line of test code caused the failure.

The `message` method combines the user-provided message with a message provided by the assertion. The `mu_pp` method is what Minitest uses to make human-readable strings from values.

Lastly, custom assertion methods should call one (or more) of the pre-existing assertion methods, passing along the message.

## Requires

Minitest includes a few files that trigger functionality when required.

```ruby
# Runs all tests before Ruby exits, using `Kernel#at_exit`.
require 'minitest/autorun'

# Enables rainbow-coloured test output.
require 'minitest/pride'

# Enables parallel (multithreaded) execution for all tests.
require 'minitest/hell'
```