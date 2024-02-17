---
dg-publish: true
---
# Rails API TDD Swagger

[original article](https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one)

Main tools:

- Ruby: 3.2.2
- Rails 7.1.3

Ruby gems:

- rspec-rails
- factory_bot_rails
- shoulda-matchers
- faker
- rubocop (to keep code consistency)

Auxiliary tools:

- asdf
- http
- Homebrew
- git
- VSCode


```shell
# checking the versions
ruby --version
rails --version

# if installa/update is needed...
asdf install ruby 3.2.2

gem install rails
gem update rails
```


### starting the project

```shell
# creating the project as an "API only" and
# skipping tests (minitest) because we're
# going to use RSpec
rails new rails-todo-api --api --skip-test
# other options to consider
# --skip-active-storage
# --skip-action-mailbox

cd rails

# more robust gitignore
gitignore.io vim,emacs,visualstudiocode,linux,windows,macos,dotenv,ruby,rails >> .gitignore

# making asdf detect the ruby version
echo 'ruby 3.2.2' > .tool-versions
```

### installing rspec and other dev dependencies

`Gemfile`:

```ruby
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'faker'
end
```

And then run:

```shell
bundle install

rails generate rspec:install

mkdir -p spec/factories
```

Edit the `.rspec` to add the `--format documentation`.

`spec/rails_helper`

```ruby
# ...
# configure shoulda matchers to use rspec as the test
# framework and full matcher libraries for rails
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# ...
RSpec.configure do |config|
  # ...
  # add `FactoryBot` methods
  config.include FactoryBot::Syntax::Methods
end
```


### models

Faltou explicar um pouco sobre a modelagem dos dados e como queremos "visualizar" esses models.

### controllers
#### request specs

Observação:
```ruby
# use this in the factory block
Faker::Number.number(digits: 10)
```

#### routes

#### controllers

🤔 - aquele `json_response` poderia ser substituído pelo jbuilder?

> [!important]
> Ler sobre concerns



---

## original

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


