---
dg-publish: true
---
# LazyVim

September/2023 and I'm testing LazyVim.

The out-of-the-box experience is not 100% aligned with what I'm used to, but at least it's not as buggy as LunarVim.

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

