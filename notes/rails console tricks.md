---
dg-publish: true
---
[Summary of this article.](https://impactahead.com/dev/useful-things-you-can-do-with-rails-console)

### accessing the last returned value

```ruby
> 4 + 4
# => 8
> _
# => 8
```


### switch context with `cd`

```ruby
user.address.location.latitude
# => some value

cd user.address.location
latitude
# => some value
```

### inspect any class or object with `ls`

```ruby
# list all methods, constants and variables related
# to a class/object
user = User.last
ls user
# User#methods: name
# instance variables: @association_cache @attributes @destroyed
# ...
```

### output object in YAML format

```ruby
y my_object
```


### using helpers

Simply prefix the method name with `helper.`

```ruby
helper.my_helper_method(arguments)
```

### inspecting routes

```ruby
app.article_path(id: 6) # => /articles/6

app.host = 'localhost'
app.get(app.article_path(id: 6))

app.response.status # => 200
app.response.body   # => "{\"message\":\"Single article\"}"
```

### searching for methods

```ruby
# pass a /regex/
User.instance_methods.grep(/name$/)
# => [:name, :model_name, :store_full_class_name]

# also available for singleton_methods
User.singleton_methods.grep(/table_name$/)
# => [:schema_migrations_table_name, :internal_metadata_table_name, :table_name, :reset_table_name, :quoted_table_name]
```

### finding where the given method was defined

**Obs.**: I didn't find it that helpful when using Mongoid.

```ruby
User.instance_method(:name).source_location
# => ["/app/models/user.rb", 2]
```

