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
  -- I have years of muscle memory using tpope/vim-surround
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

### `gr` for "go replace" conflicting with "go reference"

`lua/plugins/lsp.lua`:

```lua
-- overriding LazyVim's default LSP configs
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- I want to use gr for "Go Replace" (vim-scripts/ReplaceWithRegister)
    keys[#keys + 1] = { "gr", false }

    -- use gR to "Go to References"
    keys[#keys + 1] = { "gR", ":Telescope lsp_references<cr>", desc = "[G]oto [R]eferences" }
  end,
}
```


### keep my `.vimrc`

Put this at the end of `lua/config/options.lua`

```lua
-- meleu: load my own "old" configs written in VimScript
if vim.fn.filereadable("~/.vimrc") then
  vim.cmd("source ~/.vimrc")
end
```


### disable the clock in lualine

`lua/plugins/lualine.lua`:

```lua
return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_z = {},
    },
  },
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

### disable H and L to navigate between buffers

These keys have a native meaning in vim and should not be remapped to do other things. Prefixing them with the leaderkey would be ok...

`lua/config/keymaps.lua`:
```lua
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
```

### navigate between buffers like they were tabs

I want to navigate between tabs with `gt` (to keep the same feel when using VSCodeVIM).

`lua/config/keymaps.lua`
```lua
vim.keymap.set("n", "gT", ":bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "gt", ":bnext<cr>", { desc = "Next buffer" })
```

### `.bats` as shell scripts

This is important to have `shfmt` and `shellcheck` even when working on `bats` files.

Put this at the end of `~/.config/nvim/lua/config/options.lua`

```lua
vim.filetype.add({
  extension = { bats = "sh" },
})
```




### disable json and yaml "renderization

```lua
-- Disable the concealing in some file formats
-- This "conceal" thing omits quotes.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "yaml" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})
```

### Add GitHub Copilot

Following the instructions in: <https://www.lazyvim.org/extras/coding/copilot>

And added this line in `lua/config/lazy.lua`

```lua
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- this 👇 line
    { import = "lazyvim.plugins.extras.coding.copilot" },
    -- this 👆 line

    { import = "plugins" },
  },
})
```

Also configured a way to enable/disable copilot in `lua/plugins/copilot.lua`:

```lua
return {
  -- TODO: find a way to toggle copilot

  vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { desc = "GitHub Copilot Disable" }),
  vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { desc = "GitHub Copilot Enable" }),
}
```

---

## Things I still wanna do

### auto-formatting for some languages

### github copilot

