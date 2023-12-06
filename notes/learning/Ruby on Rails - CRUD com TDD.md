---
dg-publish: true
---
# Ruby on Rails - CRUD com TDD

Origem: <https://cloudwalk.udemy.com/course/rails-tdd/>()

## Usando TDD

- <https://cloudwalk.udemy.com/course/rails-tdd/learn/lecture/9205630#overview>


```shell
# criar um novo app usando rails versão 5.1.4
# -T para começar sem os testes (usaremos RSpec)
#rails _5.1.4_ new rails-crud -T

# na verdade usei o rails mais atual mesmo
rails new rails-crud -T
cd rails-crud
```


`Gemfile`:
```ruby
group :development, :test do
  # ...
  gem 'rspec'
  gem 'rspec-rails'
end
```

```shell
# instalar 'rspec-rails' que adicionamos ao Gemfile
bundle install

# create the commands in bin/ dir
bundle binstubs --all

# install rspec in the project
rails generate rspec:install
```

`.rspec`
```
--format documentation
```

```shell
# criar o banco de dados
rails db:create:all
```

`config/application.rb`:
```ruby
config.generators do |g|
  g.test_framework(
    :rspec,
    fixtures: false,
    view_specs: false,
    helper_specs: false,
    routing_specs: false
  )
end
```