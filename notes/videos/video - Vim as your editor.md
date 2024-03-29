---
dg-publish: true
---
# video - Vim as your editor

[ThePrimeagen youtube playlist](https://youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)

Listing the main new things I've learned from the videos in that playlist.

## Intro

[video](https://youtu.be/X6AR2RMB5tE)

### VimBeGood plugin

Install the VimBeGood plugin and play with it: <https://github.com/ThePrimeagen/vim-be-good>


### yank and delete buffer

> [!note]
> Delete and Yank send contents to the same register. 

I actually already new that, but said like that made more sense for me.


### relativenumber

- `:set relativenumber` -  enables relativenumber
- `:set norelativenumber` - disables it

> [!note]
> Most of the boolean options can be disabled with the prefix `no`


## Horizontal

[video](https://youtu.be/5JGVtttuDQA)

### searching in the line with `f` and `t`

- `f<char>` - puts the cursor in the next occurrence of `<char>`
- `t<char>` - puts the cursor right before the next occurrence of `<char>`
- `;` - goes to the next occurrence
- `,` - goes to the previous occurrence


### paragraph motions

A paragraph is text separated by a blank line

- `}` - go to the line below the paragraph
- `{` - go to the line above the paragraph


## Advanced Motions P2

[video](https://youtu.be/uL9oOZStezw)

When in visual mode, `o` makes you alternate between the beginning and the end of the selection.

Use `p` for paragraph text object!!!! Example:

- `>ip` increase indentation of the paragraph.


## Neovim RC From Scratch

[video](https://youtu.be/w7i4amO_zaE)

```shell
mkdir -p ~/.config/nvim
cd ~/.config/nvim
mkdir -p lua/theprimeagen
```

`~/.config/nvim/lua/theprimeagen/init.lua`:
```lua
print("hello from the primeagen")
```

`~/.config/nvim/lua/theprimeagen/remap.lua`:
```lua
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
```


`~/.config/nvim/init.lua`
```lua
require("theprimeagen")
print("hello")
```

- install packer: <https://github.com/wbthomason/packer.nvim#quickstart>
- install telescope: <https://github.com/nvim-telescope/telescope.nvim#getting-started>

OK, I got a bit lost. But the main takeaway for me is:

- install telescope
- install treesitter
- install LSP (whatever that is)

