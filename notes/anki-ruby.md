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


<!-- basicblock-start oid="Obs3PyxHLh9YdZzuN5Jrrynj" -->
## autocreate getters/setters
::
use `attr_accessor`:
```ruby
class Person
  attr_accessor :first_name, :last_name
end
```
<!-- basicblock-end -->



<!-- basicblock-start oid="Obsz8dJjN4OKcREMjsUJ6JPR" -->
## what does `String.count` do?
::
counts how many "char-set" there are in the string
```ruby
>> 'meleu'.count('e')
=> 2
>> 'meleu'.count('el')
=> 3
```
<!-- basicblock-end -->


<!-- basicblock-start oid="ObsQm4MQUysplnS24ctorAPw" -->
## how `Array.map` works?
::
returns a new array with the results of running a block once for every element in the array (enumeration)
```ruby
# raise all numbers to square
>> [1, 2, 3].map { |num| num ** 2 }
=> [1, 4, 9]
```
<!-- basicblock-end -->



<!-- basicblock-start oid="ObsrUKFHbfksL9lAmsAjCaX0" -->
## get an array with no repeated items
::
```ruby
# use .uniq method
>> [1, 2, 3, 4, 5, 2, 2, 4, 5].uniq
=> [1, 2, 3, 4, 5]
```
<!-- basicblock-end -->



<!-- basicblock-start oid="Obs3vGRaSreaEMnSyZ3mHJav" -->
## `String.scan` vs. `String.split`?
::
- `.split` searches for the separators (no regex)
- `.scan` searches for the items (and accepts regex)
```ruby
>> "item1--item2--itemN".split("--")
=> ["item1", "item2", "itemN"]
>> "item1--item2--itemN".split("-")
=> ["item1", "", "item2", "", "itemN"]
>> "item1--item2-:itemN".scan(/item./)
=> ["item1", "item2", "itemN"]
```
<!-- basicblock-end -->

<!-- basicblock-start oid="ObsYabOUk3A6c1w6fqRSDu8P" -->
## from char to ASCII value
::
```ruby
'a'.ord # ordinal
# => 97
```
<!-- basicblock-end -->


<!-- basicblock-start oid="ObsZeT2Wv9luCKQ26uH9ZSUb" -->
## from ASCII value to char
::
```ruby
97.chr
# => "a"
```
<!-- basicblock-end -->


<!-- basicblock-start oid="ObsxCLsNAN4rr1oUy30GCJ6N" -->
## subtract arrays
::
```ruby
[1, 2, 3] - [1, 3]
# => [2]
```
<!-- basicblock-end -->
