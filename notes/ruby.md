---
dg-publish: true
cards-deck: webdev::ruby
---
# ruby

See [[A melhor maneira que encontrei para aprender Ruby]].

Ruby LSP for Ruby version < 3.0: <https://nrogap.medium.com/install-ruby-lsp-in-vs-code-128f02571ea0>


---


## Start a Ruby project

<https://blog.dennisokeeffe.com/blog/2022-03-12-simplecov-with-ruby-and-github-actions>


---

## Ruby Books

https://ryanbigg.com/books

---


## Ruby Basics

### Basic Data Types

- Numeric
    - Integer
    - Float
- String
- Boolean
- Array
- Hashes - it's like a associative array

Don't forget: everything in Ruby is an object!


### Coding Style

Variables and Methods named with `snake_case`.

See also:

- <https://rubystyle.guide/>
- RuboCop: <https://github.com/rubocop/rubocop>
-  [[idiomatic ruby]].


### Methods

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

Think of blocks as anonymous functions that can take zero or more arguments.

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
### Conditionals

```ruby
if age > 18
  return "You can vote"
else
  return "Sorry, you're too young to vote"
end
```


### Loops

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


---

## tutorials

- [[Ruby in 100 Minutes]]
- [Navigating Ruby Files with Vim](https://thoughtbot.com/upcase/navigating-ruby-files-with-vim)
- http requests
    - https://www.twilio.com/blog/5-ways-make-http-requests-ruby
    - https://www.rubyguides.com/2018/08/ruby-http-request/


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


## Custom `irb` prompt for copy'n'pasting

Put this in your `~/.irbrc`:
```
IRB.conf[:PROMPT][:COPYNPASTE] = { # name of prompt mode
  :AUTO_INDENT => true,  # enables auto-indent mode
  :PROMPT_I => nil,      # simple prompt
  :PROMPT_S => nil,      # prompt for continuated strings
  :PROMPT_C => nil,      # prompt for continuated statement
  :RETURN => "# => %s\n" # format to return value
}

IRB.conf[:PROMPT_MODE] = :COPYNPASTE
```

---

## Instrumentation

<https://opentelemetry.io/docs/instrumentation/ruby/getting-started/>


---

## Exercises

- [[Ruby Koans]]
- <https://exercism.org>
- <https://blog.dennisokeeffe.com/blog/series/50-days-of-ruby>


## Testing

Test coverage hightlight

- <https://jmatuszewski.com/Automatically-run-Rails-tests-in-VS-Code-and-highlight-test-coverage/> - scroll to the end of the article
    - requires installation of [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters)