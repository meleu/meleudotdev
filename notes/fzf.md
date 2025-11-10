---
dg-publish: true
---
Install:
```shell
brew install fzf
```

If using `zsh`, then put this in the `~/.zshrc`:
```shell
# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
```

Now in your terminal use `Ctrl+t` to fuzzy find a file in the current directory (and subdirectories).

You can also use `**<Tab>` to have access to some magic, like:

```shell
# finding commands in your history
<Ctrl>+R

# finding processes to kill
kill -9 **<Tab>
# NOTE: in the "fuzzy finding mode", use
# - <Tab> to select an item
# - <Shift>+<Tab> to deselect an item
```

