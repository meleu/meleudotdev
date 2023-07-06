---
dg-publish: true
---
# rbnb

Creating a simpler version of AirBnB to practice Ruby on Rails.

[TOC]

## Kickstart

### starting the project

```sh
rails new rbnb -d postgresql --css tailwind
cd rbnb
rails server
# check if Rails landing page is working
```

### install devise gem

```sh
bundle add devise
rails generate devise:install
```

`config/environments/development.rb`:
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Ensure there's something defined as `root_url` in the `config/routes.rb`.

Ensure flash messages in the `app/views/layouts/application.html.erb`
For **example**:
```html
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```

### add User

```sh
rails generate devise User
rails db:migrate
```

#### customize users table

```
rails generate migration AddNameToUsers name
```

`db/migrate/..._add_name_to_users.rb`:
```ruby
add_column :users, :name, :string, null: false, unique: true
```

run:
```sh
rails db:migrate
```

`app/models/user.rb`:
```ruby
validates :name, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true
```


### add Property

```sh
rails generate model Property \
  title \
  description:text \
  price:integer \
  owner:references
```

