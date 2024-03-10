---
dg-publish: true
---
# neovim-config

Trying to understand neovim config madness.

- [x] vanilla nvim
- [x] `vim.cmd("source ~/.vimrc")`
- [x] install lazy.nvim
- [x] install The Classics™
    - "vim-scripts/ReplaceWithRegister",
    - "tpope/vim-surround",
    - "tpope/vim-repeat",
    - "tpope/vim-speeddating",
- [x] catppuccin
- [ ] pegar inspiração no kickstart.nvim




---

## typecraft

Awesome series!

[Playlist](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn)

[video](https://youtu.be/zHTeCSVAFNY?feature=shared)

### 1. `init.lua`

`~/.config/nvim/init.lua`
```lua
-- load my "pure vim" configs
vim.cmd("source ~/.vimrc")
```

### 2. `lazy.nvim` package manager

Follow the instructions [here](https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation).

`init.lua`:
```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local opts = {}

require("lazy").setup(plugins, opts)
```

### 3. colorscheme

[catpuccin for Neovim](https://github.com/catppuccin/nvim)

`init.lua`
```lua
-- ...
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}
-- ...

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
```


### 4. telescope

[nvim-telescope](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#getting-started)

`init.lua`
```lua
-- ...
local plugins = {
  -- ...
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
```

This sets `<C-p>` for fuzzy finding and `<leader>fg` to grep files.

### 5. treesitter

[install instructions](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#lazynvim) (note: the instructions in the wiki are kinda complex)

`init.lua`
```lua
-- ...
local plugins = {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }
}

-- ...

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "javascript", "vim", "python" },
  highlight = { enable = true },
  indent = { enable = true }
})
```


### 6. neo-tree

[quickstart](https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#minimal-quickstart)

```lua
local plugins = {
  -- ...
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
  }
}

-- neo-tree keymap
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<cr>')
```


### 7. organizing plugins

From Lazy.nvim's [Structuring Your Plugins](https://github.com/folke/lazy.nvim?tab=readme-ov-file#-structuring-your-plugins).

We can do this in our `init.lua`:

```lua
require("lazy").setup("plugins")
```

And then we create a `~/.config/nvim/lua/plugins/` directory. Inside this directory we can add individual files for each plugin we want to add. **This is awesome to keep things organized**.

### LSP

Install:
- [mason](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [lspconfig](https://github.com/neovim/nvim-lspconfig)

`lua/plugins/lsp-config.lua`:
```lua
return {
  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- https://github.com/williamboman/mason-lspconfig.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" }
    }
  },

  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
```