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

## videos

Interesting videos:

- [typecraft: neovim for n00bs](https://youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&feature=shared)
- [0 to LSP - ThePrimeagen](https://youtu.be/w7i4amO_zaE?feature=shared)
- [Pluginless setup](https://youtu.be/I5kT2c2XX38?si=b3XZW7_ycsjhWz56)

