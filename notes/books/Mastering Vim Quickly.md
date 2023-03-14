---
dg-publish: true
tags:
  - books
read-timestamp: 2023
author: Jovica Ilic
---

# Mastering Vim Quickly

[book's website](https://jovicailic.org/mastering-vim-quickly/)

[TOC]

---

### open file at a specific line

```shell
# open file.txt at line 34
vim +34 file.txt
```

### insert content from a file or command

```vim
" You can use :read or :r

:r file.txt  " insert file's contents below the cursor

:r!command   " insert command's output below cursor

:0r file.txt " insert before first line
```

### open files and follow links

- `gf` *g*o to *f*ile
- `gx` *g*o to lin*x*

### save file with another name, and keep the new name

```vim
:save newFileName.txt
" from now on :w saves the buffer in newFileName.txt
```


### navigating

the main takeaway here was

- `ctrl+d` to page (half) down
- `ctrl+u` to page (half) up


### searching current word

Useful info about searching with `*` and `#`.

- `*` searches forward for the exact same word in the cursor
- `#` same as above, but backward
- `g*` and `g#` - same as described above, but substring allowed.


### File Manager (netrw) in Vim

> [!todo]
> Things here didn't clicked for me... maybe I need to revisit this later


### editing files via SSH

```shell
vim scp://user@myserver[:port]//path/to/file.txt
```

For more info: `:help scp`

### Undo / Redo beyond the `u`/`ctrl+r`

```vim
" examples of :earlier and :later
:earlier 2d   " undo changes in last 2 days
:earlier 3h   " ... last 3 hours
:earlier 1m   " ... last 1 minute
:earlier 3f   " undo last three file states (buffer writes)

:later 5m     " redo all changes in last 5 minutes
:later 15s    " ... last 15 seconds
```
