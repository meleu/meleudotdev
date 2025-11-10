---
dg-publish: true
---
# Build a Blog with Ruby on Rails - GoRails

Following this [GoRails playlist](https://youtube.com/playlist?list=PLm8ctt9NhMNWD939gE728i13W999EFS0n)

[TOC]

---

## Requirements:

- Ruby 3.2
- Rails 7.0.4

## Rails New

```bash
# create new project
rails new blog

# see it running
cd blog
rails server
```

## Scaffold

- Comment the `jbuilder` line in the `Gemfile`
- Run commands below:
```sh
bundle update
rails generate scaffold BlogPost title:string body:text
rails db:migrate
```
 - Add a route for `root 'blog_posts#index'`

### some more steps

- edit `test/application_system_test_case.rb` with `:headless_chrome`
- edit the `fixtures`
- edit the `test/system/blog_post_test.rb` to use the right fixture
- edit the `test/controller/blog_post_test.rb` to use the right fixture

### authentication with devise

```sh
bundle add devise
rails generate devise:install
rails generate devise User
rails db:migrate
```

In the controller:
```ruby
before_action :authenticate_user!, except: %i[index show]
```

Add some way for the user to login/logout/create an account. Example:
```ruby
# layout/application.html.erb
if user_signed_in?
  button_to 'Log out', destroy_user_session_path, method: :delete
else
  link_to 'Login', new_user_session_path
  link_to 'Sign Up', new_user_registration_path
end
```

Also add a link to "Edit" if in a post owned by the user


### TailwindCSS

```sh
bundle add tailwindcss-rails
rails tailwindcss:install
```

in `application.html.erb`:
```html
<body class="prose mx-auto">
```

---

## BlogPost Model

```sh
# generate a model for a blog post
rails generate model BlogPost title:string body:text
# it creates a migration and a model

# run the migration
rails db:migrate

# interact with the webapp via irb
rails console
# you can now perform CRUD operations with BlogPost
# for example, create a new blog post:
# BlogPost.create(title: 'Hello World', body: 'This is my very first blog post')
# try also these methods: update, destroy, find, all

# just for awareness, check BlogPost.model_name in the console
```

## BlogPost Controller

`config/routes.rb`:
```rb
# ...
  root 'blog_posts#index'
# end
```

shell again:
```sh
# generate the controller
rails generate controller BlogPosts
```

### index

- create `index` method inside the controller
- create the `index.html.erb` file
```html
<h1>Blog Posts</h1>
<ul>
  <% @blog_posts.each do |post| %>
    <li>
      <%= link_to post.title, post %>
    </li>
  <% end %>
<ul>
```

### show

1. edit `routes.rb` to add a route to `show`
2. create `show` method in the controller
3. create the `show.html.erb` file

`app/controllers/blog_posts_controller.rb`:
```rb
# ...
  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
# ...
```

Also edit the `index.html.erb`:

```html
  <h2>
    <%= link_to post.title, post %>
  </h2>
```

Also create the views for each action inside `app/views/blog_posts`.

### new

`app/views/blog_posts/new.html.erb`:
```erb
<%= form_with mode: @blog_post do |form| %>
  <div>
    <%= form.label :title %>
    <%= form.text_field :title %>
  </div>
  <div>
    <%= form.label :body %>
    <%= form.text_area :body %>
  </div>
  <%= form.button %>
<% end %>
```



[PAREI AQUI](https://youtu.be/igS0Y6hfZoM)