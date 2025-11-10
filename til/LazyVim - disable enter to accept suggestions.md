---
dg-publish: true
---
# LazyVim - disable `<enter>` to accept suggestions

The default behavior for `<enter>` in [[notes/LazyVim]] is really annoying. When I press `<enter>` I want my #vim to insert a new line.

The code below disables `<cr>` to accept autosuggestions and configure `<tab>`/`<s-tab>` to choose the suggestions.

`lua/plugins/nvim-cmp.lua`:

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


### reference

[Inspiration from here.](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-5/#modifying-existing-options).