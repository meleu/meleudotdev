---
dg-publish: true
cards-deck: webdev::ruby
deck: webdev::ruby
---
# Anki cards for Ruby

#anki

Flashcards for Ruby. Created with [Obsidian Anki Sync](https://github.com/debanjandhar12/Obsidian-Anki-Sync) notation.

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
## declare a Class method to be called from the Class name
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
## how `Array.map` works?::
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
- `.scan` searches for the items, and accepts regex
- `.split` searches for the separators, no regex
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


<!-- basicblock-start oid="ObsVRxqFtipgFulzjMJTil9Q" -->
## create an `Array` from a `Range`
::
```ruby
# n00b way
alphabet = ('a'..'z').to_a

# ninja way
alphabet = [*'a'..'z']
```
<!-- basicblock-end -->


<!-- basicblock-start oid="ObsPiyXNxmiVaMBpIir4Pv19" -->
## capture an Exception
::
```ruby
begin
  # ... code that can raise an exception...
rescue ExceptionName => e
  # ... code to run when getting an exception
end
```
<!-- basicblock-end -->

<!-- basicblock-start oid="Obs0Mlw7lvIUu87rOX30KGjX" -->
## How do you clean an `Array` from items matching a condition?
::
Using `#reject` iterator (think of a negation of `#select`)
```ruby
a = [1, 2, 3, 4]
# reject the even numbers:
a.reject { |n| n.even? }
# => [1, 3]
```
<!-- basicblock-end -->

<!-- basicblock-start oid="Obsz12uABfxoufAHZOy6xIWj" -->
## How would you sort an `Array` with a given sorting criteria?
::
Defining the criteria in a block to `#sort_by`
```ruby
strings_array.sort_by do |word|
  word.length
end
```
<!-- basicblock-end -->

<!-- basicblock-start oid="Obs8SW01LaI2OBk80G4xEMyl" -->
## Generic syntax of a migration to add a column to a given table?
::
```ruby
class AddColumnToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :table, :column, :type
    # table names are always plural!
  end
end
```
<!-- basicblock-end -->


<!-- basicblock-start oid="Obsmy4RYMBkWGeiCDEPWjBHT" -->
## What are the 4 most common ActiveRecord validation types?
::
1. `presence`
2. `uniqueness`
3. `length { min or max }`
4. `format { with: /regex/ }`
<!-- basicblock-end -->


<!-- basicblock-start oid="ObsE3b7q4U80qUnwifZ1Nv7N" -->
## ActiveRecord: migration to rename a column?
::
```ruby
rename_column :table, :old_column_name, :new_column_name
```
<!-- basicblock-end -->


<!-- basicblock-start oid="ObsF6NL86t10w6XiVpuxFuKZ" -->
## ActiveRecord: 1:n relation between `doctors` and `interns` written in the `interns` migration
::
```ruby
class CreateInterns < ActiveRecord::Migration[7.0]
  def change
    create_table :interns do |t|
      t.references :doctor, foreign_key: true
      # ...
    end
  end
end
```
<!-- basicblock-end -->

<!-- basicblock-start oid="Obs2Kfjyj0GtUgQ8qmCNY0Dq" -->
## ActiveRecord: migration to add an `intern_id` foreign key in `patients` table
::
```ruby
class AddInternReferenceToPatients < ActiveRecord::Migration[7.0]
  def change
		add_reference :patients, :intern, foreign_key: true
  end
end
```
<!-- basicblock-end -->

<!-- basicblock-start oid="ObsBF89MWJvqspoqiZYNLMLx" -->
## ActiveRecord: migration to remove column from table
::
```ruby
class RemoveColumnFromTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :table, :column, :type
  end
end
```
<!-- basicblock-end -->


