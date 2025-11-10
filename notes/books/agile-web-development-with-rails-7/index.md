---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: 2023
author: Sam Ruby
---

# Agile Web Development with Rails 7

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

---

[[Part 1 - Getting Started]]

## Part II - Building an Application

### Chapter 5. The Depot Application

> The earlier we discover we've made a mistake, the less expensive it'll be to fix that mistake.

### Chapter 6. Task A: Creating the Application

#### Kickstarting the project

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

