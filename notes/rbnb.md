---
dg-publish: true
---
# rbnb

Creating a simpler version of AirBnB to practice Ruby on Rails.

[TOC]

## Kickstart

### starting the project

[commit](https://github.com/meleu/rbnb/commit/4621f97a29fe6e89f2c4d06c7a0895ba1c3dab96)

```sh
rails new rbnb -d postgresql --skip-jbuilder
cd rbnb
rails server
# check if Rails landing page is working
```


### scaffold Property

[commit](https://github.com/meleu/rbnb/commit/60c697ba95e2cc3772794d61a1fe41c5864086da)

```sh
rails generate scaffold Property \
  title:string \
  description:text \
  price:integer
rails db:migrate
```

Add this to the `routes.rb`:
```ruby
root 'properties#index'
```

Configure system tests to run in a headless browser:

- in `test/application_system_test_case.rb`
- replace `:chrome` with `:headless_chrome`.


### install/configure tailwindcss

[commit](https://github.com/meleu/rbnb/commit/6e4d4ca65f980f4d05047926b6fa177ca5e19f34)

```sh
bundle add tailwindcss-rails
rails tailwindcss:install

# from now on, use `bin/dev` instead of `rails server`
```

By default tailwind removes all default html styling. To have a minimum degree of styles, use `prose` in the body in `layouts/application.html.erb`:
```html
<body class="prose mx-auto">
<!-- also delete the classes in the <main> -->
```


### install/configure devise and create User

```sh
bundle add devise
rails generate devise:install
rails generate devise User
rails db:migrate
```

added this to `config/environments/development.rb`:
```ruby
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

added this to `layouts/application.html.erb`:
```html
<% if user_signed_in? %>
  <%= button_to 'Log out', destroy_user_session_path, method: :delete %>
<% else %>
  <%= link_to 'Login', new_user_session_path %>
  <%= link_to 'Sign Up', new_user_registration_path %>
<% end %>
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```

In the controller:
```ruby
before_action :authenticate_user!, except: %i[index show]
```

### add first/last names to User

[commit](https://github.com/meleu/rbnb/commit/25b6c3c68c185096e544db20ef628c4234d28b2d)

```sh
rails generate migration AddNameToUsers first_name last_name
# check if the migration is OK
rails db:migrate
```

Create a custom method in `models/user.rb`:
```ruby
def full_name
  "#{first_name} #{last_name}"
end
```

### generate devise views

[commit](https://github.com/meleu/rbnb/commit/3b6a9c90896288ed520af7a3399c67c322d3eb26)

```sh
rails generate devise:views
```


### install/configure simple_form with tailwind

[commit](https://github.com/meleu/rbnb/commit/8d351f135974532ef8b9deb89b57fe8a5a3cf451)

```sh
bundle add simple_form
bundle add simple_form-tailwind
rails generate simple_form:tailwind:install
```

Replace the whole contents of `views/properties/_form.html.erb` with this `simple_form` syntax:

```html
<%= simple_form_for property do |f| %>
  <%= f.error_notification %>
  <%= f.error_notification message: f.object.errors[:base].to_sentence if f.object.errors[:base].present? %>
  <div>
    <%= f.input :title %>
    <%= f.input :description %>
    <%= f.input :price %>
  </div>
  <div>
    <%= f.button :submit %>
  </div>
<% end %>
```


### add owner field to properties table

[commit](https://github.com/meleu/rbnb/commit/4d873b31d49403e9bca6aeba7a47cd1afc52ccc5)

```sh
rails generate migration AddOwnerToProperties owner:references
```

Edit the migration with a different `foreign_key` configuration:
```ruby
add_reference :properties, :owner, null: false, foreign_key: { to_table: :users }
```

Also add this to the `models/property.rb`:
```ruby
belongs_to :owner, class_name: 'User', foreign_key: :owner_id
```

More changes in the [commit diff](https://github.com/meleu/rbnb/commit/4d873b31d49403e9bca6aeba7a47cd1afc52ccc5)



---

## draft...

`fixtures/properties.yml`
```yaml
# Read about fixtures at https://api.rubyonrails.org/classes/ActiveRecord/FixtureSet.html

meleu_house:
  title: meleu's house
  description: A house with an arcade, for those who love retrogames.
  price: 100
  owner: meleu

anne_house:
  title: Anne's house
  description: A pet friendly house, with everything your best friend need.
  price: 150
  owner: anne

ariel_house:
  title: Ariel's house
  description: A place near the best sights in London.
  price: 200
  owner: ariel
```

`fixtures/users.yml`
```yaml
meleu:
  name: 'meleu'
  email: meleu@rbnb.com

anne:
  name: 'anne'
  email: anne@rbnb.com

ariel:
  name: 'ariel'
  email: ariel@rbnb.com
```
