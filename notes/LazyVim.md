---
dg-publish: true
---
# LazyVim

<https://lazyvim.org>

Since September/2023 and I'm testing LazyVim distribution (do not confuse with [[Lazy.nvim plugin]], very related but different).

The out-of-the-box experience is not 100% aligned with what I'm used to, but at least it's not as buggy as [[LunarVim]].

---

## Things to do right after installation

### plugins to disable

Create the file `lua/plugins/disabled.lua`:
```lua
return {
  -- disable mini.surround, (confusing keybindings)
  { "echasnovski/mini.surround", enabled = false },

  -- flash.nvim tries to enhance /searching but it's confusing!
  { "folke/flash.nvim", enabled = false },

  -- disable commandline and search in unusual places
  -- NOTE: disabling noice also removes popup notifications
  -- { "folke/noice.nvim", enabled = false },

  -- alpha-nvim: neovim "splashscreen"
  { "goolord/alpha-nvim", enabled = false },
}
```

### plugins to install

Create the file `lua/plugins/init.lua`:
```lua
return {
  "vim-scripts/ReplaceWithRegister",
  "tpope/vim-surround",
  "tpope/vim-repeat",     -- make vim-surround dot-repeatable
  "tpope/vim-speeddating", -- <C-a>/<C-x> to increase/decrease dates
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

### `.bats` as shell scripts

This is important to have `shfmt` and `shellcheck` even when working on `bats` files.

Put this at the end of `~/.config/nvim/lua/config/options.lua`

```lua
vim.filetype.add({
  extension = { bats = "sh" },
})
```

### ctrl-j / ctrl-k to navigate in telescope

I used this in `lua/config/plugins/telescope.lua`:
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


### navigate between buffers like they were tabs

I want to navigate between tabs with `gt` (to keep the same feel when using VSCodeVIM).

`lua/config/keymaps.lua`
```lua
vim.keymap.set("n", "gT", ":bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "gt", ":bnext<cr>", { desc = "Next buffer" })
```

### disable H and L to navigate between buffers

These keys have a native meaning in vim and should not be remapped to do other things. Prefixing them with the leaderkey would be ok...

`lua/config/keymaps.lua`:
```lua
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
```


---

## Things I still wanna do

### `gr` for "go replace" conflicting with "go reference"

### auto-formatting for some languages

### github copilot

### disable prompt for Ex-commands in the middle of screen

noice.nvim is doing that...

the problem is that disabling noice also disables notifications

### disable different prompt for searching with `/`

also noice.nvim...

