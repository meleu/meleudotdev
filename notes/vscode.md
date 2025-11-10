---
dg-publish: true
---
# vscode

## disable distracting code suggestions while presenting

```json
{
  "editor.quickSuggestions": {
    "other": "off",
    "comments": "off",
    "strings": "off"
  },
}
```

[source video](https://www.youtube.com/watch?v=e4QbPSOXZQA)

## extensions

- [[vscodevim]]


## Migrating to neovim

List of features I really use and that is what make me open vscode instead of neovim.

- git management
- quickly change branches
- extensions
    - run tests (neovim equivalent: [neotest](https://github.com/nvim-neotest/neotest))
    - coverage gutters (neovim equivalent: [nvim-coverage](https://github.com/andythigpen/nvim-coverage))
    - open on github
    - gitblame (gitsigns josean 1:21, typecraft git)
    - git diff
    - enable/disable github copilot
    - auto-session
    - trouble 
    - autoformat (neovim: conform josean 1:14)
    - todo comments 
    - github-actions - this is quite handy when I'm working with GH workflows

## Good ruby projects

`.vscode/settings.json`:
```json
{
  "[ruby]": {
    "editor.defaultFormatter": "Shopify.ruby-lsp",
    "editor.formatOnSave": true
  },
  "rubyLsp.formatter": "standard",
  "rubyLsp.linters": ["standard"],
  "rubyLsp.enabledFeatures": {
    "codeActions": true,
    "diagnostics": true,
    "documentHighlights": true,
    "documentLink": true,
    "documentSymbols": true,
    "foldingRanges": true,
    "formatting": true,
    "hover": true,
    "inlayHint": true,
    "onTypeFormatting": true,
    "selectionRanges": true,
    "semanticHighlighting": true,
    "completion": true,
    "codeLens": true
  }
}
```

`.vscode/extensions.json`:
```json
{
  "recommendations": [
    "Shopify.ruby-lsp"
  ]
}
```

