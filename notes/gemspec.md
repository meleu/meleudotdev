---
dg-publish: true
---
# gemspec

## starting the project

```shell
bundle gem qe_cli \
  --bin \
  --no-mit \
  --test=rspec \
  --ci=github \
  --linter=rubocop

# create a gitignore
gitignore.io vim,emacs,visualstudiocode,linux,windows,macos,dotenv,ruby,rails >> .gitignore
```

Edit the `qe_cli.gemspec`:

- remove the TODOs
- add Thor as dependency:

```ruby
spec.add_dependency "thor", "~> 1.3"
```


## references

- <https://piotrmurach.com/articles/writing-a-ruby-gem-specification/>
