# Understanding the Four Rules of Simple Design

Here are the 4 rules of simple design:

1. Tests Pass
2. Expresses Intent
3. No Duplication (DRY)
4. Small

### 1. Tests Pass

If you can't verify that your system works, then it doesn't really matter how greate your design is.

**NOTE**: the rule does NOT says "**automated** tests pass", just "tests pass". This rule is about correctness and verification.

The real goal here is to quickly check if your system works as expected. If you quickly check this with manual tests, then fine. But with automated tests it can be even faster.

### 2. Expresses Intent

The variables, methods, functions, classes, etc. shouldn't lie! Their names must be descriptive and really say their intent.

> over time, as we change functionality of our system, classes and methods can become filled with unrelated behaviors. This makes it difficult to have the name effectively express their intent. **As we start to see structures getting large, the difficulty in finding an expressive name is a red flag that it is doing too much and should be refactored.**


### 3. No Duplication

**NOTE**: this is not about code, it's about **knowledge** duplication.

> Every piece of knowledge should have one and only one representation.

### 4. Small

Question to ask before a `git commit`:

- Do I have any vestigial code that is no longer used?
- Do I have any duplicate abstractions?
- Have I extracted too far?


### Behavior Attractors

In this part the author mentions "_reification_", which I read as "making something real". In the example he converts coordinates `x` and `y` into a "real" class:

```ruby
class Location
  attr_reader :x, :y
end
```

> By aggressively eliminating knowledge duplication through reification, we often find that we have built classes that naturally accept new behaviors that arise. They not only accept, but _attract_ them; by the time we are looking to implement a new behavior, there is already a type that is an obvious place to put it.
> 
> As a corollary to this, we can use this idea to notice potentially missing abstractions. If we are working on a new behavior, but are not sure where to place it - what object it belongs to - this might be an indication that we have a concept that isn't expressed well in our system.


### Test Names Should Influence Object's API

Test: a new world is empty:

```ruby
# 👎 bad
def test_a_new_world_is_empty
  world = World.new
  assert_equal 0, world.living_cells.count
  # access too much from the object 👆
end

# 👍 good
def test_a_new_world_is_empty
  world = World.new
  assert_true world.empty?
end
```

### Testing State vs. Testing Behavior

```ruby
# testing state
def test_a_new_world_is_empty
  assert_true World.new.empty?
end

# testing behavior
def test_an_empty_world_stays_empty_after_a_tick
  world = World.new
  next_world = world.tick
  assert_true next_world.empty?
end
```

