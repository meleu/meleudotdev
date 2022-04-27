---
dg-publish: true
---
# upcase video course: Onramp to vim

- <https://thoughtbot.com/upcase/onramp-to-vim>

## 4. Windows & Tabs

- <https://thoughtbot.com/upcase/videos/onramp-to-vim-windows-and-tabs>

In vim terminology Window = Split

```vim
" creates a new horizontal split
:new 

" creates a new vertical split
:vnew 

" open a file in a new horizontal split
:split filename.ext

" open a file in a new vertical split
:vsplit filename.ext
```

- Move cursor between windows: `ctrl-w [hjkl]`
- Move the window: `ctrl-w [HJKL]`
- Resizing:
    - vertically: `ctrl-w [+-]`
    - horizontally: `ctrl-w [<>]`
    - rebalance sizes: `ctrl-w =`
- Break current window into a new tab: `ctrl-w T`

```vim
" creates an empty tab
:tabnew

" opens a file a new tab
:tabedit filename.ext
```

- move between tabs: `gt`/`gT`



## 5. Modes

`ctrl-v` goes to visual block mode



## 6. Configuration

`~/.vimrc`

