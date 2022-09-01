---
dg-publish: true
---
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


### Arrays

```ruby
>> numbers = [1, 2, 3, 4]
=> [1, 2, 3, 4]
# the "shovel operator" << works like .push
>> numbers << 5
=> [1, 2, 3, 4, 5]
>> numbers
=> [1, 2, 3, 4, 5]
```

#### Common Array Methods

```ruby
# there conveniente methods, like .first, .last, .min, .max, .minmax
>> array.last
=> 5
>> array.first
=> 1
>> array.max
=> 5
>> array.min
=> 1
>> array.minmax
=> [1, 5]

# .sort
>> numbers = [1, 9, 2, 8, 3, 7]
=> [1, 9, 2, 8, 3, 7]
>> numbers.sort
=> [1, 2, 3, 7, 8, 9]
>> numbers
=> [1, 9, 2, 8, 3, 7]

```

Others methods to try:

- `each`
- `collect`
- `shuffle`

See full Array documentation: <https://ruby-doc.org/core-2.5.1/Array.html> (2.5.1 because that's the version used in [[The Well-Grounded Rubyist]])


### Hashes

Hashes are basically an associative array. In other words: a hash is an *unordered* collection where the data is organized into key/value pairs.

```ruby
produce = {'apples' => 1, 'oranges' => 2}
# => {"apples"=>1, "oranges"=>2}
puts "there are #{produce['oranges']} oranges in the fridge."
# there are 2 oranges in the fridge.
# => nil

# it's also possible to use symbols as the keys of a hash
produce = {apples: 3, oranges: 4}
=> {:apples=>3, :oranges=>4}
# now you must use the :symbol notation to get the value
puts "there are #{produce[:oranges]} oranges in the fridge."
# there are 4 oranges in the fridge.
# => nil
```


### Conditionals

Common conditional operators: `==`, `!=`, `>`, `>=`, `<`, `<=`.

Logical AND: `&&`

Logical OR: `||`

The convention is that a method which returns a boolean value should have a name ending with `?`.


### Classes and Objects

Example:
```ruby
class Student
  attr_accessor :first_name, :last_name, :primary_phone_number

  def introduction
    puts "Hi, I'm #{first_name}!"
  end
end

frank = Student.new
frank.first_name = "Frank"
frank.introduction
```
