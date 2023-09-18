## Lazy.nvim plugin

> See also: [[LazyVim]] (the distribution)

Awesome video to get started with Lazy.nvim plugin manager:
<https://youtu.be/6mxWayq-s9I>

```
# call Lazy UI
:Lazy

# load a plugin withno nvim restart
:Lazy load <plugin-name>
```

### nvim-tree

Note: install a [[Nerd Font]] so the icons work fine.

- `<leader>ee` - toggle nvim-tree (mnemonic: eexplorer)
- `<leader>ef` - toggle explorer on current file
- `<leader>er` - refresh explorer
- `<leader>ec` - collapse explorer (buggy if explorer is not opened)

## LSP

Setting up LSP: <https://youtu.be/NL8D8EkphUw>

### Telescope (fuzzy finder)

- `<leader>ff` - find files
- `<leader>fr` - find recent files
- `<leader>fs` - find string
- `<leader>fc` - find string under the cursor
- `<C-j>`/`<C-k>` - go up/down in the telescope list
- `<C-c>` - exit telescope UI

### nvim-cmp (autocompletion)

The use is intuitive...

### mason

I didn't get very well, but it works great!

### nvim-lspconfig

<https://github.com/neovim/nvim-lspconfig>

- `gR` - show definition references
- `gD` - go to declaration
- `gd` - show lsp definitions
- `gi` - show lsp implementations
- `gt` - show lsp type definitions
- `[visual-mode]<leader>ca` - see available code actions, in visual mode will apply to selection
- `<leader>rn` - smart rename
- `<leader>D` - show file diagnostics
- `<leader>d` - show diagnostics for line
- `[d`/`]d` - prev/next diagnostics
- `K` - show doc for what is under cursor
- `<leader>rs` - restart lsp
