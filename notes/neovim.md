---
dg-publish: true
---
# NeoVim

- <https://thoughtbot.com/upcase/videos/meet-neovim>

| vim        | neovim                                   |
| ---------- | ---------------------------------------- |
| `~/.vim/`  | `~/.config/nvim/`                        |
| `~/.vimrc` | `~/.config/nvim/init.vim` (or `init.lua) |

## `init.lua` loading `.vimrc`

In order to make neovim load your `.vimrc`configs, put this in your `~/.config/nvim/init.lua`

```lua
vim.cmd('source ~/.vimrc')
```

## Installing plugins

As of 2023, the "state of the art" in regards to neovim plugin management is [[Lazy.nvim plugin]].
