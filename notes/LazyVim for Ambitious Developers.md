---
dg-publish: true
---
# LazyVim for Ambitious Developers

Interesting things I learned from [this book](https://lazyvim-ambitious-devs.phillips.codes/)

### Search in the visible text

LazyVim comes with the flash.nvim plugin, which allows searching text in the visible text using the `s` command.

A similar behavior is achieved with the `f`, but only for a single character.


### Jumping History

- `C-o` jump back
- `C-i` jump forward

### Opening files

- `:cd <path>` to change the working directory
- `:pwd` to show the current working directory
- Telescope tips
    - when filtering files, press `<space>` and add another string to filter the already filtered results
    - use `<esc>` to go to normal mode and then use `s` to quickly jump between the filtered files.
    - use `<c-u>`/`<c-d>` to scroll the file preview
- Neo-Tree tips
    - use `x` to cut a file from a folder, and `p` to paste it in another folder
	- the [mini.files alternative](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-4/#the-minifiles-alternative) looks really cool

### Folding

- In LazyVim, the default `foldmethod` is `expr`.
- `zM` close all folds
- `zR` open all folds
- `za` toggle fold under cursor

### Notifications 

> These disappear after a few seconds. Every once in a while, you need to be able to refer back to them.
>
> The secret is to use the keybinding `<Space>sn` to open the “Noice” search menu. 


### Programming Languages 

Use Mason to install LSPs.

> A command you’ll use regularly is `<Space>cl`, which runs the command `:LspInfo`. It displays information about any language servers that are currently running and which buffers they are attached to.
> 
> If your LSP is having temporary problems—like showing incorrect diagnostics or unable to find a file you know is there—sometimes it just needs to be given a good kick with `:LspRestart`.


Check the diagnostics section in the book