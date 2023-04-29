---
dg-publish: true
tags:
  - books
read-timestamp: 2022
author: Sandi Metz
---

# Practical Object-Oriented Design

#books/tech 

### Being a programmer
I've found in the first pages of this book the reason why I love to be a programmer.

From "Introduction"

> Those of us whose work is to write software are incredibly lucky. Building software is a **guiltless pleasure** because we get to use our creative energy to get things done. We have arranged our lives to have it both ways; we can enjoy the pure act of writing code in sure knowledge that the code we write has use.


From 1.1 "In Praise of Design":

> If painful programming were the most cost-effective way to produce working software, programmers would be morally obligated to suffer stoically or to find other jobs.
> 
> Fortunately, you do not have to choose between pleasure and productivity. The programming techniques that make code a joy to write overlap with those that most efficiently produce software.


### Easy to change 

> Applications that are easy to change are a pleasure to write and a joy to extend. They are flexible and adaptable. Applications that resist change are just the opposite; every change is expensive and each makes the next cost more.

Anticipating changes:

> Designs that anticipate specific future requirements almost always and badly. Practical design does not anticipate what will happen to your application; it merely accepts that something will and that, in the present, you cannot know what. It doesn't guess the future; it preserves your options for accommodating the future. It doesn't choose; it leaves you room to move.
>
> **The purpose of design is to allow you design later** and it's primary goal is to reduce the cost of change.


### Importance of design 

> successful and _undesigned_ applications carry the seeds of their own destruction.

---

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