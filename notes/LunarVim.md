---
dg-publish: true
---
# LunarVim

- site: <https://www.lunarvim.org/>
- useful playlist: <https://youtube.com/playlist?list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6>

## Install

<https://www.lunarvim.org/docs/installation>

### Uninstall

```shell
bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh

# alternative
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
```


## Actions right after installing

### keep my `.vimrc`

Put this at the end of `~/.config/lvim/config.lua`

```lua
-- meleu: load my own "old" configs written in VimScript
vim.cmd('source ~/.vimrc')
```

### configure whichwrap

If I'm in the end of a line and press `l`, I don't want to go to the next line!

```vim
" in my ~/.vimrc
set whichwrap=b,s
```

if using lua:
```lua
vim.opt.whichwrap = "b,s"
```


### shfmt

enabled `shfmt`:
in `~/.config/lvim/config.lua`:
```lua
lvim.format_on_save.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "shfmt",
    filetypes = { "sh" },
  },
}
```


### working with `.bats` files

#### formatting with shfmt

#### linting with shellcheck
