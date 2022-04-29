# NeoVim - upcase

- <https://thoughtbot.com/upcase/videos/meet-neovim>

| vim        | neovim                    |
| ---------- | ------------------------- |
| `~/.vim/`  | `~/.config/nvim/`         |
| `~/.vimrc` | `~/.config/nvim/init.vim` |

In order to make neovim load your vim configs:
```vim
" ~/.config/nvim/init.vim
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
```

> I've noticed in the neovim documentation `:help clipboard` that `xsel` is mentioned as a "newer alternative to xclip"

```vim
" since I have xclip installed, this is
" enough to nvim talk with the system clipboard
set clipboard+=unnamedplus
```