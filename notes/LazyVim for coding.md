---
id: LazyVim for coding
aliases: []
tags: []
dg-publish: true
---

# LazyVim for coding

See also: [[notes/LazyVim]]

## Things I still wanna do

- copiloting with other AI models
- get used to the trouble.nvim and how to use it

## Useful things to know right-away

### Folding

Sometimes you open a complex code with a lot of blocks with nested indentation.

Useful keybindings to use in these cases:

- `zM` - close all folds
- `zR` - open all folds
- `zi` - toggle folding
- `za` - toggle fold under cursor
- `zA` - toggle all folds under cursor

### LSP

Sometimes Language Servers don't work and a `:LspStart` (or `:LspRestart`) solves the issue.

---

## configs

### `.bats` as shell scripts

This is important to have `shfmt` and `shellcheck` even when working on `bats` files.

Put this at the end of `lua/config/options.lua`

```lua
vim.filetype.add({
  extension = { bats = "sh" },
})
```

### disable json and yaml "renderization"

**NOTE**: we can also disable `conceallevel` on demand with `<leader>uc`

`lua/config/autocmds.lua`:

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

---

## LazyExtras

#### SQL

![[database queries from inside neovim]]

#### GitHub Copilot

<https://www.lazyvim.org/extras/coding/copilot>

`:LazyExtras` -> `coding.copilot`

I also configured a way to enable/disable copilot in `lua/plugins/copilot.lua`:

```lua
return {
  -- TODO: find a way to toggle copilot

  vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { desc = "GitHub Copilot Disable" }),
  vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { desc = "GitHub Copilot Enable" }),
}
```

---

## external plugins

### treesj

A very satisfying plugin to split blocks with breaklines lines!

```lua
return {
  "Wansmer/treesj",
  keys = {
    {
      "<leader>ct",
      ":TSJToggle<cr>",
      desc = "Toggle Treesitter Split",
    },
  },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  opts = { use_default_keymaps = false },
}
```

### Open in GitHub

Useful to open the current project/file in the browser (or simply copy the URL to the clipboard)

`lua/plugins/openingh.lua`

```lua
return {
  "Almo7aya/openingh.nvim",
  -- tip from here:
  -- https://github.com/Almo7aya/openingh.nvim/issues/24#issuecomment-2212536651
  init = function()
    vim.g.openingh_copy_to_register = true
  end,
  keys = {
    -- open in browser
    {
      "<leader>gBr",
      ":OpenInGHRepo<cr>",
      desc = "Open Repo on Browser",
    },
    {
      "<leader>gBf",
      ":OpenInGHFile<cr>",
      desc = "Open File on GitHub",
    },
    {
      "<leader>gBf",
      ":OpenInGHFileLines<cr>",
      desc = "Open Lines on GitHub",
      mode = "v",
    },

    -- yank to clipboard
    {
      "<leader>gyr",
      ":OpenInGHRepo+<cr>",
      desc = "Yank Repo URL",
    },
    {
      "<leader>gyf",
      ":OpenInGHFile+<cr>",
      desc = "Yank File URL",
    },
    {
      "<leader>gyf",
      ":OpenInGHFileLines+<cr>",
      desc = "Yank Lines URL",
      mode = "v",
    },
  },
}

```

---

## references

- [[LazyVim for Ambitious Developers]]
- [5 Neovim Plugins To Improve Your Productivity (video)](https://www.youtube.com/watch?v=NJDu_53T_4M)

