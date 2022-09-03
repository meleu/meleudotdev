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

### The `<<` shovel operator changes the original string

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


---


## Think About It

### about strings

#### Why Ruby programmers tend to favor the `<<` shovel operator over the `+=` plus equals operator when building up strings?

Maybe because it modifies the original string... 🤔


### about symbols

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