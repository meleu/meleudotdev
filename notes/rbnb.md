---
dg-publish: true
---
# rbnb

Creating a simpler version of AirBnB to practice Ruby on Rails.

[TOC]

## Kickstart

### starting the project

```sh
rails new rbnb -d postgresql --css tailwind
cd rbnb
rails server
# check if Rails landing page is working
```

### add devise to manage users

```sh
bundle add devise
rails generate devise:install
rails generate devise User
rails db:migrate
```

