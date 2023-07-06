---
dg-publish: true
---
# Build a Blog with Ruby on Rails

Following this [GoRails playlist](https://youtube.com/playlist?list=PLm8ctt9NhMNWD939gE728i13W999EFS0n)

> [!question]
> Should I try [this](https://github.com/startbootstrap/startbootstrap-clean-blog) to style this project?

Requirements:
- Ruby 3.2
- Rails 7.0.4

```bash
# create new project
rails new blog

# see it running
cd blog
rails server

# generate a model for a blog post
rails generate model BlogPost title:string body:text
# it creates a migration and a model

# generate the controller
rails generate controller BlogPosts

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

`config/routes.rb`:
```rb
# ...
  root 'blog_posts#index'
# end
```

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

Also create the views for each action inside `app/views/blog_posts`.

`app/views/blog_posts/index.html.erb`:
```erb
# ...
<% @blog_posts.each do |blog_post| %>
  <h2><%= link_to blog_post.title, blog_post %></h2>
  <%= blog_post.body %>
<% end %>
```

> [!note]
> In this snippet:
> ```rb
> link_to blog_post.title, blog_post 
> ```
> The final `blog_post` is actually an alias for
> ```rb
> "blog_posts/#{blog_post.id}"
> ```
> This is **Rails magic!** 🪄


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