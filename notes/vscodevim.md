---
dg-publish: true
---
# vscodevim

Awesome plugin for VSCode: [VSCodeVim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

## VSCodeVim tricks

[original list](https://github.com/VSCodeVim/Vim/blob/master/README.md#-vscodevim-tricks)

- `gd` - go to definition.
- `gh` - equivalent to hovering your mouse over wherever the cursor is.
- `gb` - adds another cursor at the next word that matches the word the cursor is currently on.


## Configs

Things to do after installing the plugin

`settings.json`:
```json
// VSCode native config that is (kinda)
// equivalent to `set scrolloff=5` in a vimrc:
"editor.cursorSurroundingLines": 5,

// NeoVim is a dependency to have
// full access to Ex commands:
"vim.enableNeovim": true,
"vim.neovimPath": "/home/meleu/.asdf/shims/nvim",

// vimrc remaps:
// according to the VSCodeVim README,
// `vim.vimrc.enable` option only enables remaps.
"vim.vimrc.enable": true,
"vim.vimrc.path": "/home/meleu/.vimrc",

// configure leader key
"vim.leader": "<space>",

// yank to/paste from clipboard
"vim.useSystemClipboard": true,

// :set hlsearch
"vim.hlsearch": true,

// emulate 'inkarkat/vim-ReplaceWithRegister'
"vim.replaceWithRegister": true,

// allow ctrl+b to toggle sidebar (default vscode behavior)
"vim.handleKeys": {
  "<C-b>": false
}
```


### emulated plugins

[original doc](https://github.com/VSCodeVim/Vim/blob/master/README.md#-emulated-plugins)

By default it supports the following plugins that I'm used to use:

- `tpope/vim-surround`
- `tpope/vim-commentary`
- `michaeljsmith/vim-indent-object`
- `vim-scripts/ReplaceWithRegister`
- `vim-textobj-entire` - I don't like this one...
