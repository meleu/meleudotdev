---
dg-publish: true
---
# Rails API TDD Swagger

[original article](https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one)

> [!important]
> Pra fazer geração automática do swagger é uma DSL diferente e mais verbosa. Não usei! 😔

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

cd rails-todo-api

# more robust gitignore
gitignore.io vim,emacs,visualstudiocode,linux,windows,macos,dotenv,ruby,rails >> .gitignore

# making asdf detect the ruby version
echo 'ruby 3.2.2' > .tool-versions
```


> **COMMIT**

#### installing rspec and other dev dependencies


`Gemfile`:

```ruby
group :development, :test do
  gem 'rubocop'
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


> **COMMIT**

### models

![[Rails API TDD - todo db.png]]

```shell
# Todo model
rails generate model Todo title created_by

# Item model
rails g model Item name done:boolean todo:references

rails db:create db:migrate
```

#### TDD models

`spec/models/todo_spec.rb`:

```ruby
require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Todo, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
```

`app/models/todo.rb`:

```ruby
class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  validates_presence_of :title, :created_by
end
```

`spec/models/item_spec.rb`

```ruby
require 'rails_helper'

# Test suite for the Item model
RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:todo) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
```

`app/models/item.rb`

```ruby
class Item < ApplicationRecord
  belongs_to :todo
  validates :name, presence: true
end
```

> **COMMIT**

### controllers

```shell
rails generate controller Todos
rails generate controller Items
```

#### routes

```ruby
resources :todos do
  resources :items
end
```


#### factories

`spec/factories/todos.rb`:

```ruby
FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number }
  end
end
```

`spec/factories/items.rb`

```ruby
FactoryBot.define do
  factory :item do
    name { "item: #{Faker::Lorem.word}" }
    done { false }
    todo { nil }
  end
end
```

#### request specs

```shell
mkdir -p spec/requests
touch spec/requests/{todos,items}_spec.rb
```

> PAREI AQUI!!!!
> FAZER OS SPECS DE CADA ROTA UMA POR UMA


#### controllers

🤔 - aquele `json_response` poderia ser substituído pelo jbuilder?

> [!important]
> Ler sobre concerns

### JWT

lembrar que o factory fica assim:

```ruby
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "foo@bar.com" }
    password { "foobar" }
    # NÃO É password_digest
  end
end

```

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


