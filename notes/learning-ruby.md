---
dg-publish: true
---
# learning-ruby

[[The Well-Grounded Rubyist]]

## Ruby in Twenty Minutes

From <https://www.ruby-lang.org/en/documentation/quickstart/>

Hello World:
```ruby
puts "Hello World!"
```

In a function:
```ruby
def hi(name = "World")
  # use #{var} to refer to a local variable
  puts "Hello #{name}!"
end
```

Evolving into a `Greeter` class:
```ruby
class Greeter

  def initialize(name = "World")
    # @name is a private property of this class
    # in Ruby's jargon, it's an "instance variable"
    @name = name
  end

  def say_hi
    puts "Hi #{@name}!"
  end

  def say_bye
    puts "Bye #{@name}, come back soon."
  end

end
```

Instantiate a `greeter` object:
```ruby
# the 'new' method runs what is in the 'initialize'
greeter = Greeter.new("Augusto")

# invoking a method without parantheses (they're optional)
greeter.say_hi
greeter.say_bye
```

Get the list of all methods available for the `Greeter` class:
```ruby
# prints all methods, including the ones
# define by ancestor classes.
Greeter.instance_methods

# prints only methods defined by Greeter
Greeter.instance_methods(false)
```

In Ruby, you can modify a class "on the fly":
```ruby
# this is supposed to be ran in irb
class Greeter
  # attr_accessor defined two methods:
  # - name, to get the value
  # - name=, to set the value
  attr_accessor :name
end

greeter = Greeter.new('Danilo')
greeter.respond_to?('name')     # returns true
greeter.respond_to?('name=')    # returns true

greeter.say_hi
# Hi Danilo

greeter.name='Davi'
greeter.say_hi
# Hi Davi

# the attribution syntax accepts spaces
greeter.name = 'Ana'
greeter.say_hi
# Hi Ana
```





---

## references

- [[The Well-Grounded Rubyist]] - 1.1. Basic Ruby language literacy
- <https://www.ruby-lang.org/en/documentation/quickstart/>