---
dg-publish: true
---
# LazyVim

September/2023 and I'm testing LazyVim distribution (do not confuse with [[Lazy.nvim plugin]].

The out-of-the-box experience is not 100% aligned with what I'm used to, but at least it's not as buggy as LunarVim.

I didn't like the fact that a command like `:!man sed` doesn't give me the obvious thing. :(

Things I did right after installation

### replace the surround plugin

Create the file `lua/plugins/disabled.lua`:
```lua
return {
  -- disable mini.surround, so we can use "tpope/vim-surround"
  { "echasnovski/mini.surround", enabled = false },
}
```

Create the file `lua/plugins/init.lua`:
```lua
return {
  "tpope/vim-surround",
}
```


### install the "ReplaceWithRegister" plugin


Add `"vim-scripts/ReplaceWithRegister"` to the file `lua/plugins/init.lua`:
```lua
return {
  "tpope/vim-surround",
  "vim-scripts/ReplaceWithRegister",
}
```

### keep my `.vimrc`

Put this at the end of `~/.config/lvim/config.lua`

```lua
-- meleu: load my own "old" configs written in VimScript
vim.cmd('source ~/.vimrc')
```

### `.bats` as bash scripts

This is important to have `shfmt`, `shellcheck` and linting:

```lua
vim.filetype.add({
  extension = { bats = "sh" },
})
```
