---
dg-publish: true
---
```bash
rails new blog
rails generate scaffold post title:string body:text
rails db:migrate
```

Colocar isso no `app/views/layouts/application.html.erb` (o resultado é bem bacaninha):
```html
<%= stylesheet_link_tag "https://cdn.simplecss.org/simple.css" %>
```

add the trix javascript editor
```bash
rails action_text:install
rails db:migrate
```


edit the `app/views/layouts/_form.html.erb`:
```html
    <%= form.rich_textarea :body %>
```

Muita coisa legalzinha, websockets e talz...

- 20:15 - começa a parte de deploy to prod.
- 24:20 - authentication