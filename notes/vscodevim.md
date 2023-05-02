---
dg-publish: true
---
# vscodevim

Awesome plugin for VSCode: [VSCodeVim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

## Configs

Things to do after installing the plugin

### simulating scrolloff

This is VSCode native config that is (kinda) equivalent to `set scrolloff=5` in a vimrc:

```json
"editor.cursorSurroundingLines": 5,
```

### Ex commands

NeoVim is a dependency to have full access to Ex commands:
```json
"vim.enableNeovim": true,
"vim.neovimPath": "/home/meleu/.asdf/shims/nvim",
```

### vimrc remaps

Note: according to the plugin's README, the `vim.vimrc.enable` option only enables remaps.

```json
"vim.vimrc.enable": true,
"vim.vimrc.path": "/home/meleu/.vimrc",
```

### emulated plugins

[original doc](https://github.com/VSCodeVim/Vim/blob/master/README.md#-emulated-plugins)

By default it supports the following plugins that I'm used to use:

- vim-surround
- vim-commentaryd
- vim-indent-objectd
- vim-textobj-entire

[ReplaceWithRegister](https://github.com/VSCodeVim/Vim/blob/master/README.md#replacewithregister) must be enabled:

```json
"vim.replaceWithRegister": true,
```


## VSCodeVim tricks

[original list](https://github.com/VSCodeVim/Vim/blob/master/README.md#-vscodevim-tricks)

- `gd` - go to definition.
- `gh` - equivalent to hovering your mouse over wherever the cursor is.