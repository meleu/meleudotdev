---
dg-publish: true
---
# idiomatic ruby

[TOC]

---

## use `!` for "inplace" String manipulation

Use `!` at the end of the method name to do an "inplace" change in a String

```ruby
>> name = "meleu"
=> "meleu"
>> name.capitalize
=> "Meleu"
>> name
=> "meleu"
>> name.capitalize!
=> "Meleu"
>> name
=> "Meleu"
>> name.upcase
=> "MELEU"
>> name
=> "Meleu"
>> name.upcase!
=> "MELEU"
>> name
=> "MELEU"

```

## references

- challenges at exercism.org
- <https://www.freecodecamp.org/news/idiomatic-ruby-writing-beautiful-code-6845c830c664/>