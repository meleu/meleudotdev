---
dg-publish: true
---
# Seven habits of effective text editing

- <https://www.moolenaar.net/habits.html>

My main takeaways from the text above.

1. Move around quickly
2. Don't type it twice
3. Fix it when it's wrong
4. something
5. Let's work together
6. Text is structured
7. Make it a habit

## Part 1: edit a file

### 1. Move around quickly

- use `*` to search the word under the cursor
- use `set incsearch` to jump to the matching `/pattern`
- use `set hlsearch` to highlight the matching `/pattern`
- use `%` to jump from an open brace to its matching closing brace
- use `[{` and `]}` to jump to the opening/closing brace of the current code block
- use `gd` to jump to the declaration of local variable

Three basic steps of learning a new shortcut movement on vim:

1. While editing, pay attention in actions you repeat and/or spend quite a bit of time on.
2. Find out if there is an editor command that will do this action quicker.
3. Train using the command.

[There's a mention to the `ctags` program. And I think I should be more familiar with it.]

### 2. Don't type it twice

1. use `.` command to repeat last change
2. use macros. Example:
  1. use `qa` to start recording into register 'a', do your commands, and then `q` to stop recording.
  2. use `@a` when you want to repeat those commands.
3. prefer commands with text-objects to make them more repeatable (`:help text-objects`).
4. while typing, use `ctrl-n` to get a list of suggestions of words to complete

### Fix it when it's wrong

Tip to quickly fix typos:
```vim
:abbr Lunix Linux
:abbr hte the
:abbr accross across
```

Use syntax highlight.

> In Vim it [ortographic correction] is implemented with scripts and you can further tune it for your own use: for example, to only check the comments in a program for spelling errors.

[Unfortunately the author doesn't mention any direction about how to achieve that (not even a doc).]


## Part 2: edit more files

### 4. A file seldom comes alone

> You should be able to take advantage of your editor to make working with several files more efficient.

[ This is a field that I think I'm inefficient. Maybe this content about ctags can be useful: <https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html> ]

> The usual approach is to generate a tags file for the whole project you are working on. You can then quickly jump between all files in the project to find the definitions of functions, structures, typedefs, etc. The time you save compared with manually searching is tremendous; creating a tags file is the first thing I do when browsing a program.

- use the `:grep` command
- use the `[I` with the cursor under a function name to show a list of all matches for the function name in included files.


### 5. Let's work together

You can send the contents selected text (with Visual mode) to an external program.

```vim
" sort the selected text
:!sort

" send the selected text to the sort in
" a different buffer (don't change selection)
:w !sort
```

Unfortunately it's not that simple to bring the Vim power to every other application. But it's possible to do it with [VSCode/NeoVim](https://github.com/vscode-neovim/vscode-neovim) (which is life changing). Looks like it's also possible to embed neovim in browsers: <https://github.com/glacambre/firenvim>.


### 6. Text is structured

-  use`:make` command
-  adjust the `errorformat` option


## Part 3: sharpen the saw

### 7. Make it a habit

Learn in small chunks.
