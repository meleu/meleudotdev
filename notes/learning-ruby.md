---
dg-publish: true
---
# learning-ruby

## Basic Ruby language literacy

### stylistic conventions

| type     | Ruby convention | Nonconventional               |
|:--------:| --------------- | ----------------------------- |
| local    | `first_name`    | `firstName`, `_firstName`     |
| instance | `@first_name`   | `@First_name`, `@firstName`   |
| class    | `@@first_name`  | `@@First_name`, `@@firstName` |
| global   | `$FIRST_NAME`   | `$first_name`, `$firstName`   | 

### method names

> Names of methods follow the same rules and conventions as local variables. This is by design: **methods don't call attention to themselves as methods** but rather blend into the texture of a program as **expressions that provide a value**. In some contexts you can't tell just by looking at an expression whether you're seeing a local variable or a method name - and that's intentional.


### method calls vs. messages

When an object's method is called, rubyists also say that you're sending a message to the object.

Example:
```ruby
# sending message 'to_i' to the String object "100"
x = "100".to_i
```

> Message sending is achieved via the special dot operator

**Why the double terminology?** (method call vs. messages)

> The more conventional vernacular is "calling the method." In Ruby, though, it's more correct to say you **send a message to a receiving object, and the object executes the corresponding method**. You can put anything to the right of the dot, and **there's no guarantee that the receiver will have a method that matches the message you send**. (...)
> 
> When you see a dot in what would otherwise be an inexplicable position, you should interpret it as a message (on the right) being sent to an object (on the left).

> As a Ruby programmer, you spend most of your time either specifying the things you want objects to be able to do (by defining methods) or asking the objects to do those things (by sending them messages).

some method calls take the form of *bareword*-style invocations:
```ruby
puts "Hello"
```

despite the lack of a message-sending dot and an explicit receiver for the message, we're sending the message `puts` with the argument `"Hello"` to the default object `self`.



### objects > classes

> Although every object is an instance of a class, the concept of class is less important than the concept of object. That's because **objects can change, acquiring methods and behaviors that weren't defined in their class**. The class is responsible for launching the object into existence, a process known as *instantiation*, but thereafter the object has a life of its own.
> 
> **The ability of objects to adopt behaviors that their class didn't give them is one of the most central defining principles of the design of Ruby as a language.** (..) although every object has a class, the class of an object isn't the sole determinant of what the object can do.



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

- [[The Well-Grounded Rubyist]] - 1.1. Basic Ruby language literacy
- <https://www.ruby-lang.org/en/documentation/quickstart/>