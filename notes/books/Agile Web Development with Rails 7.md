---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: 2023
author: Sam Ruby
---

# Agile Web Development with Rails 7


## Basics

### check project's dependencies/version/etc

When in a rails project dir, check the version of what you have using
```
rails about
```


### access dev server over the network

Enabling the server to be accessed over the network:

`config/environments/development.rb`:
```ruby
config.hosts.clear
```

Also specify the host to bind with:
```
rails server -b 0.0.0.0
```


### show web console even when accessing from another host

`config/environments/development.rb`:
```ruby
config.web_console.whitelisted_ips = %w(0.0.0.0/0 ::/0)
```

> [!important]
> Web Console has a Path Match input field!!

### auto-create controller/actions/views

Create a controller defining some actions (and, consequently, the views):
```
rails generate controller Say hello goodbye
```


## Concepts

### MVC: Model

> The *model* is responsible for maintaining the state of the application. Sometimes this state is transient, lasting for just a couple of interactions with the user. Sometimes the state is permanent and is stored outside the application, often in a database
> 
> A model is more than data; it enforces all the business rules that apply to that data. (...) By putting the implementation of business rules in the model, we make sure that nothing else in the application can make our data invalid. **The model acts as both aa gatekeeper and a data store**.

> The mode layer is the gatekeeper between the world of code and the database. Nothing to do with our application comes out of the database or gets stored into the database that doesn't first go through the model.




### MVC: View

> By embedding code in teh view, we risk adding logic that should be in the model or the controller. As with everything, while judicious use in moderation is healthy, overuse can become a problem. Maintaining a clean separation of concerns is part of the developer's job.


### OOP: Object

> An object is a combination of state and methods that use that state.


### Protected methods

> Protected methods can be called both in the same instance and by other instances of the same class and its subclasses.


### Modules

> Modules serve two purposes:
>
>1. Act as a namespace, letting you define methods whose names won't clash with those defined elsewhere.
>2. Allow sharing functionality among classes.
>
> (...) Multiple classes can mix in the same module, sharing the module's functionality without using inheritance. You can also mix multiple modules into a single class.


### Assignment shortcuts `a op= b`

Just like `a += b` is equivalent to `a = a + b`

`a ||= b` is a shortcut for `a = a || b`

So `count ||= 0` gives `count` the value `0` if `count` is `nil` or `false`.



## The "Depot" app

### Kickstarting the project

```sh
rails new depot --css tailwind
cd depot
# git commit -m 'rails new depot'

rails generate scaffold Product \
  title:string \
  description:text \
  image_url:string \
  price:decimal
# git commit -m 'rails generate scaffold Product'
```

Edit the `*_create_products.rb` migration:
```ruby
# ...
t.decimal :price, precision: 8, scale: 2
# ...
```

Run the migration:
```sh
rails db:migrate

dev # equivalent to `rails server`

# if everything looks fine:
# git commit -m 'specify price precision
```

Now go to the commit history: <https://github.com/meleu/depot/commits/master>







## Cool things I learned

### Model Validation

#### RegEx security

```ruby
# pay attention to the \z in the RegEx below
validates :image_url, allow_blank: true, format: {
  with: /\.(gif|jpg|png)\z/i,
  message: 'must be a URL for GIF, JPG or PNG image'
}
```

That `\z` means "end of line". I would use `$` here, but when I do it, I receive this error:

> `ArgumentError: The provided regular expression is using multiline anchors (^ or $), which may present a security risk. Did you mean to use \A and \z, or forgot to add the :multiline => true option?`


### Tests

#### Use `#invalid?` to check if a product can be persisted

```ruby
product = Product.new
assert product.invalid?
```

#### Check if an object is invalid because of specific fields


#### assert error messages with I18n.translate

