## Chapter 2 - Design Classes with a Single Responsibility

Having a Single Responsibility is a powerful way to make Classes/Methods easy to change.

Here are some important techniques I learned.

### Depend on behavior, not data

#### Hide instance variables

Found this interesting:

```ruby
class Gear
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    @chainring / @cog.to_f # <-- road to ruin
  end
end
```

We shouldn't be dependent on `@cog` instance variable. Instead, we should be using a getter method and if we need to add logic to the getter, it will be better (what we're doing here is to "make it easy to change").

Better design (easier to change):
```ruby
class Gear
  attr_reader :chainring, :cog   # <-- create getters

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f         # <-- use the getters
  end
end
```

Now we're able to easily change, for example, the behavior of `cog`, like this:
```ruby
def cog
  @cog * unanticipated_adjustment_factor
end
```

#### Hide data structures

In this example, let's assume `data` is a 2D array with pairs of integers representing the size of the rim and the tire (of a bike's wheel):
```ruby
# rim and tire sizes in millimeters, in a 2D array
@data = [
  [622, 20],
  [622, 23],
  [559, 30],
  [559, 40],
]
```

The method to calculate diameter of all these wheels:
```ruby
def diameters
  # 0 is rim, 1 is tire
  data.collect { |cell| cell[0] + (cell[1] * 2) }
end

# ... many other that use the index to access the array
```

Imagine you have other methods handling this data accessing the rim+tire dimensions via the array's index. If you change the way your data is structured, you'll need all those methods that "know" about how the data is structured.

Instead, let's create a [Struct](https://ruby-doc.org/3.2.2/Struct.html):
```ruby
class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  # Class Struct provides a convenient way to create
  # a simple class that can store and fetch values.
  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end
```


### Enforce Single Responsibility Principle Everywhere

> Separating iteration from the action that's being performed on each element is a common case of multiple responsibility that is easy to recognize.

```ruby
def diameters
  wheels.collect do |wheel|
    wheel.rim + (wheel.tire * 2)
  end
end
```

In the method above, we're iterating over the wheels and then calculating the diameter of each wheel, two responsibilities (iterate & calculate) for a single method.

Let's refactor that to apply the SRP:
```ruby
# first: iterate over the array
def diameters
  wheels.collect { |wheel| diameter(wheel) }
end

# second: calculate diameter of ONE wheel
def diameter(wheel)
  wheel.rim + (wheel.tire * 2)
end
```

> The impact of a single refactoring like this is small, but the cumulative effect of this coding style is huge. Methods that have a single responsibility conver the following benefits:
>
> - Expose previously hidden qualities (...)
> - Avoid the need of comments (...)
> - Encourage reuse (...)
> - Are easy to move to another class (...)

> Because you are writing changeable code, you are best served by postponing decisions until you are absolutely forced to make them. Any decision you make in advance of an explicit requirement is just a guess. Don't decide; preserve your ability to make a decision *later*.

