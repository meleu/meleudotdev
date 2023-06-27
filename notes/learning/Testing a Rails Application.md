---
dg-publish: true
---
# Testing a Rails Application

<https://app.pluralsight.com/library/courses/rails-application-testing/table-of-contents>

[author](https://www.linkedin.com/in/anthony-alampi-254789b0/)

---

[TOC]

---

## Setup

> [!important]
> Goals:
> - Setup and configure Rails with data for testing
> - Parallel testing configuration
> - The app database should be kept separate from the test database so you can easily clean it.
> - Fixtures and Factories can be used to populate tests with large volumes of dummy data easily.

### Project Overview

Mobile Dating App where

- user can create a profile with custom info and picture
- user can view and swipe on other profiles

Project repo: <https://github.com/XFactor-Consultants/Rails-Testing>

### Tools

- VSCode 2020
- Ruby 2.2.2
- Rails 6.0.3.4
- Vue.js 3.0.2
- Vue-Card-Swipe 2019

I'm gonna try to do the course with Ruby 3 & Rails 7. Wish me luck! 🤞

### Parallel Config
```ruby
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
  # ...
end
```



### Seeding DB with Test Data

> [!note]
> For Rails 7, maybe this video can help [Factory Bot Testing with Active Storage and Devise | Ruby on Rails 7 Tutorial](https://youtu.be/7JdyQEcZ7F8)

> [!important]
> #### Fixtures vs. Factories
>
> - Fixtures: hard-coded models that are consistent between test sessions.
> - Factories: dynamically created models that contain randomized data that may change between test sessions.

Factory and Faker
```sh
gem install factory_bot_rails
gem install faker
```

Add it to the `:test` group in the Gemfile:
```ruby
group :development, :test do
  # ...
  gem 'factory_bot_rails'
  gem 'faker'
end
```

Then run:
```sh
bundle install
```

Add this to the `test/test_helper.rb`:
```ruby
class ActiveSupport::TestCase
  # ...
  include FactoryBot::Syntax::Methods
end
```

Create the file `test/factories/user_factory.rb`:
```ruby
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password {}
  end
end
```

Testing the factory for the User model:
`test/models/user_test.rb`:
```ruby
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user_count" do
    assert_equal 4, User.count
  end

  test "user_factory" do
    user5 = create(:user, :password => '123')
    user6 = create(:user, :password => '123')
    # Rails::logger.debug User.pluck :id
    assert_equal 6, User.count
  end
end
```

> [!question]
> What does the `pluck` do here:
> `Rails::logger.debug User.pluck(:email)`
