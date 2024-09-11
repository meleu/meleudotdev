---
dg-publish: true
---
https://www.youtube.com/watch?v=hURUMwdCWuI

## commands

```bash
# 4:20 - start new project
rails new ecomm --css tailwind
cd ecomm

# test with
bin/rails server
```

create a robust `.gitignore`

articles about linting, rubocop and standardrb:
- <https://evilmartians.com/chronicles/rubocoping-with-legacy-bring-your-ruby-code-up-to-standard>
- <https://www.fastruby.io/blog/ruby/code-quality/how-we-use-rubocop-and-standardrb.html>

configure:
  - rubocop
  - overcommit


```bash
# 6:00 - devise
bundle add devise
bin/rails generate devise:install
# follow after install instructions

# 7:10 - font-awesome
# he used "~> 6.5.1"
bundle add font-awesome-sass
mv app/assets/stylesheets/application.css \
  app/assets/stylesheets/application.css.scss
echo '@import "font-awesome"' >> .../application.css.scss

# 8:10 - home controller
# create a dummy controller and view
```

9:45 - test if font-awesome is also working
```html
<h1>Home</h1>
<%= icon('fa-brands', 'font-awesome') %>
<%= icon('fa-solid', 'font-awesome') %>
```

PAREI EM 10:05