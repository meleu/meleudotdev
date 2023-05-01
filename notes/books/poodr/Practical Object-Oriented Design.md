---
dg-publish: true
tags:
  - books
read-timestamp: 2022
author: Sandi Metz
---

# Practical Object-Oriented Design

#books/tech 

- [[POODR - Chapter 1 - Object Oriented Design]]
- [[POODR - Chapter 2 - Design Classes with a Single Responsibility]]

## Chapter 3 - Managing Dependencies

> Knowing creates dependency.

Initial code used in this chapter:
```ruby
########################################
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end
  # ...
end

########################################
class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
  # ...
end

########################################
puts Gear(52, 11, 26, 1.5).gear_inches
```


### Recognizing Dependencies

An object has a dependency when it knows:

- **The name of another class.**
    -`Gear` expects a class named `Wheel` to exist.
- **The name of a message that it intends to send to someone other than `self`.**
    - `Gear` expects a `Wheel` instance to respond to `diameter`.
- **The arguments that a message requires.**
    - `Gear` knows that `Wheel.new` requires a `rim` and a `tire`.
- **The order of those arguments.**
    - `Gear` knows that `Wheel` takes *positional* arguments and that the first should be `rim`, the second, `tire`.

### Writing Loosely Coupled Code

#### Inject Dependencies

This is a way to address the dependency of "object knows the name of another class".

Instead of putting `Gear` to instantiate a `Wheel` object to call the `diameter` method, let's "inject" in `Gear` an object who's able to respond to the `diameter` message.

Before:
```ruby
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end
  # ...
end

########################################
puts Gear.new(52, 11, 26, 1.5).gear_inches
```

After:
```ruby
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end
  # ...
end

########################################
# Now the client of Gear is responsible
# to pass an object able to respond
# to the diameter message.
puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches
```

Now the `Wheel` is responsible to calculate its own diameter.

The responsibility for knowing about the actual `Wheel` class, now lies on the `Gear`'s client.

#### Isolate Dependencies

Back to our initial method:
```ruby
def gear_inches
  ratio * Wheel.new(rim, tire).diameter
end
```

The problem here is that an inner method knows too much about the `Wheel` class. A method that is supposed to only calculate the gear inches shouldn't be worried about all those details about `Wheel`.

##### Isolate instance creation

Let's **isolate the instance creation**, moving the knowledge about `Wheel` to the constructor:

```ruby
def initialize(chainring, cog, rim, tire)
  @chainring = chainring
  @cog = cog
  @wheel = Wheel.new(rim, tire)
end

def gear_inches
  ratio * wheel.diameter
end
```

Now `gear_inches` only knows the strictly necessary about an object that must respond to the `diameter` method.

Another option is to move `wheel` instantiation to its own method:
```ruby
class Gear
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def wheel
    # ||= means "assign right if left is undefined/nil/false"
    @wheel ||= Wheel.new(rim, tire)
  end
end
```

##### Isolate vulnerable external messages

Imagine that calculation `gear_inches` required far more math and that the method looked something like this:

```ruby
def gear_inches
  # .. a few lines of scary math
  ratio * wheel.diameter
  # ... more lines of scary math
end
```

Now `wheel.diameter` is embedded deeply inside a complex method. This complex method depends on `Gear` responding `wheel` and on `wheel` responding to `diameter`.

Let's isolate this dependency to make it more visible:

```ruby
def gear_inches
  # .. a few lines of scary math
  ratio * diameter
  # ... more lines of scary math
end

def diameter
  wheel.diameter
end
```


### Remove Argument-Order Dependencies

#### Use keyword arguments

```ruby
class Gear
  def initialize(chainring:, cog:, wheel:)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end
end

########################################
# client
puts Gear.new(
  wheel: Wheel.new(26, 1.5),
  chainring: 52,
  cog: 11
).gear_inches
```

Advantages:

- keyword arguments may be passed in any order
- Gear is now free to add/remove initialization arguments and defaults

This technique adds verbosity. In this case it has value.

> The verbosity exists at the intersection between the needs of the present and the uncertainty of the future. Using positional arguments requires less code today, but you pay for this decrease in volume of code with an increase in the risk that changes will cascade into dependents later. (...)
> 
> Using keyword arguments requires the sender *and* receiver of a message to state the keyword names. **This results in explicit documentation at both ends of the message.** Future maintainers will be grateful for this information.
> 
> Keyword arguments are so flexible that the general rule is that you should *prefer* them. While it's certainly true that some argument lists are so stable, and so obvious, that keywords are overkill, your bias should be toward declaring arguments using keywords. You can always fall back to positional arguments if that technique better suits your specific problem.