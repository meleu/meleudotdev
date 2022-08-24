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


## Blocks

Block styles
```ruby
# do/end style
5.times do
  puts "Hello, World!"
end

# bracket style
5.times{ puts "Hello, World!" }
```

Blocks are passed to methods. In the examples above 👆 we're giving to the method `5.times` the instructions we want to run each time.

There are many methods that accept blocks, like `gsub`:
```ruby
>> "augusto 'meleu' lopes".gsub("u"){ puts "Found an U!" }
Found an U!
Found an U!
Found an U!
=> "agsto 'mele' lopes"
```

### Block Parameters

When our instructions within a block need to reference the value that they're currently working with, we can specify a block parameter inside `|` pipe characters:

```ruby
5.times do |i|
  puts "#{i}: Hello, World!"
end
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


## tutorials

## Ruby in 100 Minutes

- <http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html>
- See also:
    - <http://tutorials.jumpstartlab.com/topics/testing/intro-to-tdd.html>
    - <http://tutorials.jumpstartlab.com/topics/internal_testing/rspec_and_bdd.html>
    - <http://tutorials.jumpstartlab.com/topics/internal_testing/rspec_practices.html>


### Variables

Coding style

- `snake_case`
- named after the meaning of their contents, not the type
- not abbreviated

### Strings

Substrings
```ruby
# executed in 'irb':
>> greeting = "Hello Everyone!"
=> "Hello Everyone!"
>> greeting[0..4]
=> "Hello"
>> greeting[0..14]
=> "Hello Everyone!"
# negative positions count back from the end
>> greeting[6..-1]
=> "Everyone!"
>> greeting[6..-2]
=> "Everyone"
```

#### Common String Methods

```ruby
# .length
>> greeting.length
=> 15

# .split
>> greeting.split
=> ["Hello", "Everyone!"]

# .split with an argument
>> numbers = "one,two,three"
=> "one,two,three"
>> numbers.split
=> ["one,two,three"]
>> numbers.split(",")
=> ["one", "two", "three"]

# .sub - substitute - replaces just a single occurence
>> numbers
=> "one,two,three"
>> numbers.sub(',', '-')
=> "one-two,three"

# .gsub - global substitution - replaces all occurances
>> numbers.gsub(',', '-')
=> "one-two-three"
```


#### Combining Strings and Variables

```ruby
# string concatenation
######################
name = "meleu"
puts "Hello, " + name + "!"
# Hello, meleu!

# string interpolation
######################
puts "Hello, #{name}!"
# Hello, meleu!

# executing code inside interpolation
#####################################
modifier = "very "
mood = "excited"
puts "I am #{modifier * 3 + mood} for today's class!"
# I am very very very excited for today's class!
```


### Symbols

Symbols are halfway between a string and a number.

They start wit a colon then one or more letters, like `:flag` or `:best_friend`.

Think of a symbol as a "named integer". It doesn't matter what actual value the symbol references. All we care about is that any reference to that value within the VM will give back the same value.

[I need to see some examples of how can this be useful]


### Numbers

Two basic kinds of numbers:

- Integer
- Float

Numbers are objects and have methods (try `5.methos` inside `irb` to see the list).

Example of a loop:
```ruby
5.times do
  puts "Hello, World!"
end
```


### Blocks

Block styles
```ruby
# do/end style
5.times do
  puts "Hello, World!"
end

# bracket style
5.times{ puts "Hello, World!" }
```

Blocks are passed to methods. In the examples above 👆 we're giving to the method `5.times` the instructions we want to run each time.

There are many methods that accept blocks, like `gsub`:
```ruby
>> "augusto 'meleu' lopes".gsub("u"){ puts "Found an U!" }
Found an U!
Found an U!
Found an U!
=> "agsto 'mele' lopes"
```

#### Block Parameters

When our instructions within a block need to reference the value that they're currently working with, we can specify a block parameter inside `|` pipe characters:

```ruby
5.times do |i|
  puts "#{i}: Hello, World!"
end
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


### Navigating Ruby Files with Vim

- <https://thoughtbot.com/upcase/navigating-ruby-files-with-vim>

