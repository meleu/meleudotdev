---
dg-publish: true
---
# fix LazyVim clashing behavior 'gr'

I have years of muscle memory using `gr` to "Go Replace" using the [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister) old #vim plugin.

The problem is that [[notes/LazyVim]] uses `gr` to "Goto References".

I fixed this using `gr` for ReplaceWithRegister and `gR` to "Goto References".

Created a file named `lua/plugins/lsp.lua` and added these configs to override the defaults:

```lua
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- disable `gr`, cause I want to use it for "Go Replace" (vim-scripts/ReplaceWithRegister)
    keys[#keys + 1] = { "gr", false }

    -- use gR for "Go to References"
    keys[#keys + 1] = { "gR", ":Telescope lsp_references<cr>", desc = "[G]oto [R]eferences" }
  end,
}
```

### reference

https://github.com/LazyVim/LazyVim/discussions/2709