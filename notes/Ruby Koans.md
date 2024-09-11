---
dg-publish: true
---
# Ruby Koans

[TOC]

---

## Getting Started

Interesting and funny way to learn some ruby concepts.

- <http://rubykoans.com/>
- <https://github.com/edgecase/ruby_koans>
- [Videos about Ruby Koans](https://youtube.com/playlist?list=PL3vpzVxKa3PiKKQf5HeXJJGZO-M1MVyfi)
    - In the 1st video, the interesting part starts at around 4:30 <https://youtu.be/H0jPLFE17do?t=270>

```bash
# clone the repo
git clone git@github.com:edgecase/ruby_koans.git
cd ruby_koans

# check if ruby is installed
ruby --version
rake --version

# generate the koans
rake gen

# regenerate the koans
rake regen

# to run all the tests in the koans' creator order:
rake
# it's the same as:
ruby path_to_enlightenment.rb

# you can also run a specific one, example:
ruby about_symbols.rb


# running koans automatically
#############################

# install observr gem
gem install observr
observr ./koans/koans.watchr

# now you can edit the file and see the results on save
```

---

## Things I learned

### About Asserts

```ruby
# assert truth
assert expression

# assert with message
assert expression, message

# assert equality
assert expected == actual
assert_equal expected, actual
```

### About Strings

```ruby
# literal strings
sentence = %(flexible quotes can handle both ' and " characters)

# multiline strings
multiline = %(
It was the best of times,
It was the worst of times.
)

# here documents
long_string = <<EOS
It was the best of times,
It was the worst of times.
EOS

# sometimes concatenation doesn't
# modify the original string
original_string = "Hello, "
hi = original_string
there = "World"
hi += there
assert_equal 'Hello, ', original_string

# shovel operator append content to a string
hi = "Hello, "
there = "World"
hi << there
assert_equal 'Hello, World', hi
assert_equal 'World', there

# the shovel operator changes the original string
original_string = "Hello, "
hi = original_string
there = "World"
hi << there
assert_equal "Hello, World", original_string

# single quotes interpret backslash as escape chars
string = '\\\''
assert_equal 2, string.size
assert_equal "\\\'", string

# get substring from a string with a range
string = "Bacon, lettuce and tomato"
assert_equal 'let', string[7..9]

# get a single char from a string
string = "Bacon, lettuce and tomato"
assert_equal 'a', string[1]
# a bit surprising...
```


### About Symbols

```ruby
# method names become symbols
def test_method_names_become_symbols
  symbols_as_strings = Symbol.all_symbols.map(&:to_s)
  assert_equal :test_method_names_become_symbols, symbols_as_strings.include?("test_method_names_become_symbols")
end

# to_s is called on interpolated symbolx
symbol = :cats
string = "It is raining #{symbol} and dogs."
assert_equal 'It is raining cats and dogs.', string

```

---

### The shovel operator changes the original string

In `about_strings.rb`

```ruby
original_string = "Hello, "
hi = original_string
there = "World"
hi << there
assert_equal "Hello, World", original_string
```


### `%i[]` creates an array of symbols

In `about_arrays.rb`

```ruby
array = %i[peanut butter and jelly]
# => [:peanut, :butter, :and, :jelly]
```


### Documentation for the Percent Literals

https://ruby-doc.org/core-3.1.2/doc/syntax/literals_rdoc.html#label-Percent+Literals


### Arrays and Ranges

```ruby
  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1, 2, 3, 4, 5], (1..5)
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a
    assert_equal [1, 2, 3, 4], (1...5).to_a
  end
```

Yeah! There's a class named `Range`.

A Range is not an Array. But you can easily convert to an Array using `.to_a`.

The notation with `X...Y`  is a Range starting from `X` and goes until `Y` excluding it.

I noticed that when using a range to slice arrays, the `-1` means "till the end". Example:
```ruby
array = [1, 2, 3, 4]
# => [1, 2, 3, 4]
array[2..-1]
# => [3, 4]
```


### In a Hash, it's possible to define a default value to be returned when referencing a nonexisting key

```ruby
my_hash = Hash.new('this is my default value')
#=> {}

my_hash
#=> {}

my_hash['nonexisting key']
#=> "this is my default value"
```

### The hash's default value is the same object

```ruby
h = Hash.new([])
#=> {}

h[:invalid]
#=> []

# pushing a string to the default value (which is an array)
h[:one] << 'uno'
#=> ["uno"]

# the default value was updated
h[:invalid]
#=> ["uno"]

h[:two] << 'dos'
#=> ["uno", "dos"]

h[:invalid]
# => ["uno", "dos"]

h[:one]
# => ["uno", "dos"]
h[:two]
# => ["uno", "dos"]

# the actual hash is still empty
h
# => {}
```

If you want default values to be unique objects **AND** the hash to be populated, use a block when instantiating a new hash.

```ruby
# a new empty array is created 
h = Hash.new { |hash, key| hash[key] = [] }
# => {}

# invalid key returns an empty array...
h[:invalid]
# => []

# ... and creates a key-value pair in the hash
h
# => {:invalid=>[]}

# another invalid key creates an empty array and populate it
h[:one] << 'uno'
# => ["uno"]

# invalid key still returns an empty array
h[:invalid]
# => []

h[:one]
# => ["uno"]

# creating another brand new array
h[:two] << 'dos'
# => ["dos"]

h[:one]
# => ["uno"]

h[:two] 
# => ["dos"]

h
# => {:invalid=>[], :one=>["uno"], :two=>["dos"]}

```

---


## Think About It

### about strings

#### Why Ruby programmers tend to favor the shovel operator over the `+=` plus equals operator when building up strings?

Maybe because it modifies the original string... 🤔


### about symbols

**NOTE**: I didn't solved the `test_symbols_cannot_be_concatenated`. It requires knowledge about `Exceptions`, which I don't have yet.

#### Why do we convert the list of symbols to strings and then compare against the string value rather than against symbols?

#### Why is it not a good idea to dynamically create a lot of symbols?


### about arrays

#### Slicing arrays

```ruby
array = [1, 2, 3]
# => [1, 2, 3]

array[0, 3]
# => [1, 2, 3]

array[1, 3]
# => [2, 3]

array[2, 3]
# => [3]

array[3, 3] # 👈 why this is not nil? 🤔
# => []

array[4, 3]
# => nil

array[5, 3]
# => nil
```


### about objects

#### What's the difference between `.to_s` and `.inspect`?

From the docs:

> **to_s → string**
> Returns a string representing obj. 

> **inspect -> string**
> Returns a string containing a human-readable representation of obj.

The most notable difference I got was this:
```ruby
nil.to_s
#=> ""

nil.inspect
#=> "nil"
```

#### What pattern do the object IDs for small integers follow?

```ruby
n.object_id == 2*n + 1
```


### about hashes

#### Why might you want to use `.fetch` instead of `[]` when accessing hash keys?

Using `.fetch` on a nonexisting key raises a `KeyError` exception, while `[]` just returns `nil`.

```ruby
my_hash = {1 => 123, 2 => 321, 3 => nil}
#=> {1=>123, 2=>321, 3=>nil}

my_hash[3]
#=> nil

my_hash[100]
#=> nil

my_hash.fetch(3)
#=> nil

my_hash.fetch(100)
# (irb):66:in `fetch': key not found: 100 (KeyError)
# ...
```

Relying on `[]` is not that accurate because `nil` is valid value inside a hash.
```ruby
my_hash = {'a' => 123, 'b' => 321, 'c' => nil}
#=> {"a"=>123, "b"=>321, "c"=>nil}

my_hash['d']
#=> nil

my_hash['c']
#=> nil
```
