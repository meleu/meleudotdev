---
id: LazyVim
aliases: []
tags: []
dg-publish: true
---

# LazyVim

<https://lazyvim.org>

Interesting book: [[LazyVim for Ambitious Developers]]

Since September/2023 and I'm testing LazyVim distribution (do not confuse with [[Lazy.nvim plugin]], very related but different).

The out-of-the-box experience is not 100% aligned with what I'm used to, but at least it's not as buggy as [[LunarVim]]. So far it's being my favorite #vim distro.

See also: [[LazyVim for coding]]

---

## Useful keybindings to know right-away

### Notifications

Sometimes we want to read the notifications carefully and they go away.

- `<leader>sna`: show all notifications in a buffer
- `<leader>snt`: show all notifications in a telescope picker
- `<leader>snl`: show last notification
- `<leader>snd`: dismiss visible notifications

---

## Things to do right after installation

### keep my `.vimrc`

Put this at the end of `lua/config/options.lua`

```lua
-- meleu: load my own "old" configs written in VimScript
if vim.fn.filereadable("~/.vimrc") then
  vim.cmd("source ~/.vimrc")
end
```

### plugins to disable

Create the file `lua/plugins/disabled.lua`:

```lua
return {
  -- disable mini.surround, (confusing keybindings)
  -- I have years of muscle memory using tpope/vim-surround
  { "echasnovski/mini.surround", enabled = false },
}
```

### plugins to install

Create the file `lua/plugins/basic-plugins.lua`:

```lua
return {
  "vim-scripts/ReplaceWithRegister",
  "tpope/vim-surround",
  "tpope/vim-repeat",     -- make vim-surround dot-repeatable
  "tpope/vim-speeddating", -- <C-a>/<C-x> to increase/decrease dates
}
```

### `gr` for "go replace" conflicting with "go reference"

Check [docs](https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps) for more uptodate info.

`lua/plugins/extended-lsp.lua`:

```lua
-- overriding LazyVim's default LSP configs
return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- I want to use gr for "Go Replace" (vim-scripts/ReplaceWithRegister)
    keys[#keys + 1] = { "gr", false }

    -- use gR to "Go to References"
    keys[#keys + 1] = { "gR", ":Telescope lsp_references<cr>", desc = "[G]oto [R]eferences" }
  end,
}
```

### disable H and L to navigate between buffers

These keys have a native meaning in vim and should not be remapped to do other things. Prefixing them with the leaderkey would be ok...

`lua/config/keymaps.lua`:

```lua
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
```

### navigate between buffers like they were tabs

Since LazyVim comes with [bufferline](https://github.com/akinsho/bufferline.nvim), making buffers look like tabs, I want to navigate between buffers with `gt`/`gT`.

`lua/config/keymaps.lua`

```lua
vim.keymap.set("n", "gT", ":bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "gt", ":bnext<cr>", { desc = "Next buffer" })
```

### disable `<enter>` to accept autosuggestions

[Inspiration from here.](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-5/#modifying-existing-options).

The code below disables `<cr>` to accept autosuggestions and configure `<tab>`/`<s-tab>` to choose the suggestions.

`lua/plugins/extended-nvim-cmp.lua`:

```lua
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- disable <cr> to accept completion
    -- enable <tab> and <s-tab> to navigate completion menu
    local cmp = require("cmp")
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
    })
  end,
}
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

### enable borders for

#### Mason and Lazy.nvim UI

`lua/config/lazy.lua`

```lua
-- ...
require("lazy").setup({
  -- a bunch of configs here...
  ui = {
    border = "rounded",
  },
})
```


`lua/plugins/extended-mason.lua`

```lua
return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
  },
}
```

#### completion suggestions

`lua/plugins/extended-nvim-cmp.lua`:

```lua
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- enable borders for completion menu and documentation
    opts.window = {
      completion = {
        border = "rounded",
      },
      documentation = {
        border = "rounded",
      },
    }
  end,
}
```

#### hover documentation

`lua/plugins/extended-noice.lua`

```lua
return {
 "folke/noice.nvim",
 opts = {
   presets = {
     lsp_doc_border = true,
   },
 },
}
```

#### diagnostics

```lua
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- other configs...

    -- use gh to "hover documentation"
    keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }

    opts.diagnostics = {
      float = {
        border = "rounded",
      },
    }
  end,
}
```

### disable plugin update notification

**update**: I've noticed that this is the default config in 2024-07-22 (enabled: true, notify: false)

`lua/config/lazy.lua`

```lua
  checker = {
    enabled = true,
    notify = false,
  },
```

---

## specific use cases

### vim-tmux-navigator

<https://github.com/christoomey/vim-tmux-navigator>

`lua/plugins/vim-tmux-navigator.lua`:

```lua
return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigatorLeft",
    "TmuxNavigatorRight",
    "TmuxNavigatorUp",
    "TmuxNavigatorDown",
  },
  keys = {
    { "<c-h>", ":TmuxNavigatorLeft<cr>" },
    { "<c-j>", ":TmuxNavigatorDown<cr>" },
    { "<c-k>", ":TmuxNavigatorUp<cr>" },
    { "<c-l>", ":TmuxNavigatorRight<cr>" },
  },
}
```

### neovim inside VSCode

Activate the `vscode` in `:LazyExtras` ([check the docs](https://www.lazyvim.org/extras/vscode)).

Add in `lua/config/keymaps.lua`:

```lua
------------------------------------------------------------
--[ below this if the keymaps you do NOT want in VSCode. ]--
------------------------------------------------------------
if vim.g.vscode then
  return
end
------------------------------------------------------------

-- yeah! do NOT ovewrite gt/gT behavior! ;)

-- since LazyVim comes with bufferline, making buffers look
-- like tabs, I want to navigate between buffers with gt/gT.
vim.keymap.set("n", "gt", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "gT", ":BufferLineCyclePrev<CR>")
```

The plugins you want to enable in VS Code you must to explicitly define `vscode = true`.

Example from my `lua/plugins/basic-plugins.lua`:

```lua
return {
  { "vim-scripts/ReplaceWithRegister", vscode = true },
  { "tpope/vim-surround", vscode = true },
  { "tpope/vim-speeddating", vscode = true },
  { "tpope/vim-repeat" }, -- LazyVim loads this by default
}
```

TODO: configs to put in VSCode?

---

## Things I still wanna do

- how to toggle which-key? (sometimes it's annoying when I'm live-coding)
- copiloting with other AI models
