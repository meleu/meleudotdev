---
dg-publish: true
---
# LazyVim

<https://lazyvim.org>

September/2023 and I'm testing LazyVim distribution (do not confuse with [[Lazy.nvim plugin]].

The out-of-the-box experience is not 100% aligned with what I'm used to, but at least it's not as buggy as LunarVim.

---

## Things I still wanna do

### use tabs instead of buffers

I want to navigate between tabs with `gt` (to keep the same feel when using VSCode).

---

## Things to do right after installation

### enable/disable some plugins

- replace the surround plugin
- disable `folke/flash.nvim` (it makes `/searching` confusing)
- install `ReplaceWithRegister`

Create the file `lua/plugins/disabled.lua`:
```lua
return {
  -- disable mini.surround, so we can use "tpope/vim-surround"
  { "echasnovski/mini.surround", enabled = false },

  -- flash.nvim tries to enhance /searching but it's confusing!
  { "folke/flash.nvim", enabled = false },
}
```

Create the file `lua/plugins/init.lua`:
```lua
return {
  "tpope/vim-surround",
  "vim-scripts/ReplaceWithRegister",
}
```

### disable plugin update checker

`lua/config/lazy.lua`
```lua
  checker = {
    enabled = false,
    notify = false,
  },
```

### keep my `.vimrc`

Put this at the end of `lua/config/options.lua`

```lua
-- meleu: load my own "old" configs written in VimScript
vim.cmd('source ~/.vimrc')
```

### `.bats` as bash scripts

This is important to have `shfmt` and `shellcheck` even when working on `bats` files.

Put this at the end of `~/.config/nvim/lua/config/options.lua`

```lua
vim.filetype.add({
  extension = { bats = "sh" },
})
```

### ctrl-j / ctrl-k to navigate in telescope

I used this, but I think it can be simplified
```lua
return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- prev result
            ["<C-j>"] = actions.move_selection_next, -- next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })
  end,
}

```

### shift-k to show the manpage

I realized LazyVim is configured to show the man page with `<leader>K`. It's acceptable for me.

I didn't like the fact that a `Shift-k` when the cursor is under the word `sed` doesn't show me the sed manpage. :(

