---
dg-publish: true
---
# Rails API Swagger

[video](https://youtu.be/IeqwMb2PhvU)

```shell
rails new my-api --api --skip-test
```

`Gemfile`:
```ruby
# handling CORS
gem "rack-cors"

group :development, :test do
  # ...
  gem 'rspec-rails'
  gem 'rswag'
  gem 'solargraph-rails'
end
```

```shell
# instalar as gems
bundle

# instalando RSpec
rails generate rspec:install

# instalando RSwagger
rails generate rswag:install
# isso vai criar rotas

rails generate scaffold Post \
  title:string \
  body:text

rails db:migrate
```

`app/models/post.rb`
```ruby
class Post < ApplicationRecord
  validates :title, presence: true
end
```


```shell
rails generate rspec:swagger posts
rails rswag
```


