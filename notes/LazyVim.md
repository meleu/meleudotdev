---
dg-publish: true
---
# LazyVim

September/2023 and I'm testing LazyVim distribution (do not confuse with [[Lazy.nvim plugin]].

The out-of-the-box experience is not 100% aligned with what I'm used to, but at least it's not as buggy as LunarVim.

---

## Things I still wanna do

### shift-k to show the manpage

I didn't like the fact that a `Shift-k` when the cursor is under the word `sed` doesn't show me the sed manpage. :(

### ctrl-j / ctrl-k to navigate in telescope


### disable plugin update notifications


---

## Things I did right after installation

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

Put this at the end of `~/.config/nvim/lua/config/options.lua`

```lua
-- meleu: load my own "old" configs written in VimScript
vim.cmd('source ~/.vimrc')
```

### `.bats` as bash scripts

This is important to have `shfmt` and `shellcheck` even when working on `bats` files.

Put this at the end of `~/.config/nvim/lua/config/options.lua`

```lua
vim.filetype.add({
  extension = { bats = "sh" },
})
```
