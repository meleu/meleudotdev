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

Unfortunately the author doesn't mention any direction about how to achieve that (not even a doc).


## Part 2: edit more files

