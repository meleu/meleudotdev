---
dg-publish: true
---
# Ruby Koans

Interesting and funny way to learn some ruby concepts.

- <http://rubykoans.com/>
- <https://github.com/edgecase/ruby_koans>
- [Videos about Ruby Koans](https://youtube.com/playlist?list=PL3vpzVxKa3PiKKQf5HeXJJGZO-M1MVyfi)
    - In the 1st video, the interesting part starts at around 4:30 <https://youtu.be/H0jPLFE17do?t=270>

```bash
# clone the repo
git clone git@github.com:edgecase/ruby_koans.git
cd ruby_koans

# check if ruby is installed
ruby --version
rake --version

# generate the koans
rake gen

# regenerate the koans
rake regen

# to run all the tests in the koans' creator order:
rake
# it's the same as:
ruby path_to_enlightenment.rb

# you can also run a specific one, example:
ruby about_symbols.rb


# running koans automatically
#############################

# install observr gem
gem install observr
observr ./koans/koans.watchr

# now you can edit the file and see the results on save
```


## Things I learned

### The `<<` shovel operator changes the original string

```ruby
original_string = "Hello, "
hi = original_string
there = "World"
hi << there
assert_equal "Hello, World", original_string
```


