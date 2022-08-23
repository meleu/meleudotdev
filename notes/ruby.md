---
dg-publish: true
cards-deck: webdev::ruby
---
# ruby

Book I'm reading: [[The Well-Grounded Rubyist]]

[TOC]

---

## Basic Data Types

- Numeric
    - Integer
    - Float
- String
- Boolean
- Array
- Hashes - it's like a associative array

Don't forget: everything in Ruby is an object!


## Coding Style

Variables and Methods named with `snake_case`.


## Methods

```ruby
def hello(name)
  return "Hi #{name}!" # note: this return is optional
end

puts hello("meleu") # => "Hi meleu!"


# TODO: explain this '&' notation
# convert to string and convert to integer
"5 1 4 2 3 15 42 34".split.map(&:to_i)
# => [5, 1, 4, 2, 3, 15, 42, 34]
```


## Conditionals

```ruby
if age > 18
  return "You can vote"
else
  return "Sorry, you're too young to vote"
end
```

## Loops

for loops:
```ruby
for i in 0..10 do
  puts i
end

# iterating over each item of an array
array.each do |n|
  puts n
end

# iterating over each key of a hash
hash.each_key do |key|
  puts n
end
# note: .each_value works similarly

# iterating over each key,value pair of a hash
hash.each do |key, value|
  puts "#{key} => #{value}"
end
```


## Some ruby tricks

```ruby
# from char to ASCII value
'a'.ord # ordinal
# => 97

# from ASCII value to char
97.chr
# => "a"


# you can "subtract" arrays like this
[1, 2, 3] - [1, 3]
# => [2]


# get the lowest and biggest value in an array
[5, 1, 4, 2, 3].minmax
# => [1, 5]
# you can also use .min and .max


# repeat a string
"meleu " * 3
# => "meleu meleu meleu "
```

---


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

- [[The Well-Grounded Rubyist]]
- <https://www.ruby-lang.org/en/documentation/quickstart/>
- <https://try.ruby-lang.org/>

