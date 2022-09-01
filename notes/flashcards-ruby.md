---
dg-publish: true
cards-deck: webdev::ruby
deck: webdev::ruby
---
# Ruby

Flashcards for Ruby.

[TOC]

---

<!-- basicblock-start oid="Obsg0g5hbvqzivFfICMsWcLQ" -->
## default value if variable is `nil`
::
```ruby
# number MUST be nil!
# Doesn't work if it's an undefined var.
var = number || 5
```
<!-- basicblock-end -->



<!-- basicblock-start oid="ObsATz5gFKygu3kIzVqtjToc" -->
## default value if argument is not passed
::
```ruby
def method(parameter = "default value")
  # ...
end
```
<!-- basicblock-end -->


<!-- basicblock-start oid="ObskfkJICbzEOhvGeBBwiLUW" -->
## declare a method to be called from the Class
::
use `self.method_name`:
```ruby
class Hello
  def self.world
    "Hello World!"
  end
end
```
<!-- basicblock-end -->


## autocreate getters/setters::
#anki/ruby



## what does `String.count` do?::
#anki/ruby



## how to use `Array.map`?::
#anki/ruby



## get an array with no repeated items::
#anki/ruby



## why `String.scan` is better than `String.split`?::
#anki/ruby

