---
dg-publish: true
---
# rails nextgen jumpstart

Starting a new rails project with [nextgen](https://github.com/mattbrictson/nextgen) and [jumpstart](https://\.com/excid3/jumpstart)

Starting a new project with `nextgen`:

```shell
gem exec nextgen create jumpstart-myapp
# important:
# in JavaScript bundler choose ESbuild

cd jumpstart-myapp
bin/setup
```

Edit the `config/routes.rb`, comment the line with

```ruby
root to: "home#index"
```

Using the jumpstart template:

```shell
bin/rails app:template LOCATION=https://raw.githubusercontent.com/excid3/jumpstart/master/template.rb

bin/rails db:create db:migrate
bin/rails madmin:install
# install foreman?
bin/dev
```

