---
dg-publish: true
---
# Ruby and VS Code

## Solargraph: enable InteliSense and Ruby docs

With [Solargraph](https://solargraph.org) you can have context-aware autocompletion and offline documentation (between other features).

Enabling it on VS Code is pretty simple:

1. install the gem:
```shell
gem install solargraph
```
2. install the [Ruby Solargraph VS Code plugin](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)

That's enoug.

**Bonus**: if you have your [VS Code integrated with Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim), you can check the documentation with `K`.



## RuboCop

Nice article: <https://www.honeybadger.io/blog/linting-formatting-ruby/>


### Installing RuboCop

- [official docs](https://docs.rubocop.org/rubocop/installation.html)

```shell
gem install rubocop

# check the version
rubocop --version
```


### Configuring RuboCop

it's overwhelming... 🥵
