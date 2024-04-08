---
dg-publish: true
tags:
  - books
read-timestamp: 2023
author: Jovica Ilic
---

# Mastering Vim Quickly

#books/tech 

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


### Undo branches

I didn't get used to these undo techniques, but I found it interesting...

Example:

1. open a new file, write `Hello`. Press `esc`.
2. hit `o` to go the line below in Insert mode, write `world`. Press `esc`
3. hit `u` to undo and remove the `world`.
4. hit `o` to go the line below in Insert mode, write `everyone`. Press `esc`
5. hit `u` to undo and remove the `everyone`.

If you hit `u` again you remove the `Hello`, but never get the word `world` again.

> after you complete step 4 - and you want to get back `world` again - you need to run command `g-`.
> 
> Basically, Vim creates an undo branch every time you hit `u`. The branch represents the state of the file before you executed undo. So you can use `g-` command to move backward or `g+` command to move forward between these branches.
> 
> Take a few minutes to experiment with `u`, `ctrl+r` `g-` and `g+` and you'll quickly understand how this works.


### speak the Vim language

- [this video is cool](https://youtu.be/wlR5gYd6um0)

verbs -> modifiers -> nouns

#### verbs

Note: these commands are also known as operator commands or simply operators.

- single char verbs
    - x - delete
    - r - replace
    - s - delete and go to insert mode
- verbs for text-objects
    - y - yank (copy)
    - c - change
    - d - delete
    - v - visually select

#### modifiers

- NUMBER - yeah, literally a number like 1, 2 or 42
- t - search un**t**il
- f - **f**ind
- / - find a regular expression
- i - **i**nner
- a - **a**round

Note: `i` and `a` are used to create text-objects

#### nouns

See also [[vim text-object cheatsheet]].

The nouns can be a text-object or a text-movement

- text-objects (must be prefixed with `i` or `a` - see `:help Q_to`)
    - w - word
    - W - WORD
    - s - sentence
    - p - paragraph
    - explicitly say the block delimiter
        - `(`, `[`, `{`, `<` 
    - t - xml-like block - from `<tag>` to `</tag>`
   - quoted strings 
        - `'`, `"`, \`

- movements (see `:help Q_tm`)
    - w, W - start of next word
    - e, E - end of word
    - b, B - start of previous word
    - ge, gE - end of previous word
    - `(` - sentence forward
    - `)` - sentence backward
    - `$` - end of line
    - `0` - start of line
    - `^` - start of line ignoring indentation


### search through multiple files

> [!note]
> I think this can be improved with `ripgrep` or something similar. Saw some videos showing some cool features about it.

Search for a `PATTERN` in all markdown files:
```vim
:vimgrep PATTERN *.md
```

And then use:

- `:cn` - jump to next match
- `:cN` - previous match
- `:clist` - view all the files that contain the matched string
- `:cc NUMBER` jump to specific match number you get from `:clist`


### the power of the global command

The `:g[lobal]` command is very useful. The syntax is like this:

```
:[range]g/pattern/cmd
```

- `pattern` - is the what we're looking to match in the file
- `cmd` - is the Ex command to be executed for each line matching the `pattern`

#### examples of the global command

Use `:help 10.4` for more info

```
# delete all lines containing a 'error'
:g/error/d

# delete all lines not containing 'important'
:g!/important/d

# NOTE: deletion sends data to the unnamed register!
# Avoid it sending to the "blackhole" register '_'
:g!/important/d_

# delete all blank lines
:g/^\s*$/d

# execute macro '@a' in normal mode
:g/pattern/normal @a

# for every line containing "good" replace "bad" with "ugly"
:g/good/s/bad/ugly/g

# reverse all the lines - ':help 12.4'
# (':m0' moves a line to the top of the file)
:g/^/m0

```

### Registers

There are 9 types of registers:

1. unnamed: `" `
2. numbered (10): `"0` - `"9`
3. small delete: `"-`
4. named (26): `"a` - `"z` or `"A` - `"Z` (capital letters append contents)
5. read-only: `":`, `".`, `"%` and `"#`
6. expression: `"=`
7. selection and drop: `"*`, `"+` and `"~`
8. blackhole: `"_`
9. last search pattern: `"/`

#### using named registers

Example:

```
# copy current line to "a register
"ayy

# append current line to the "a register
"Ayy

# paste content from "a register
"ap

# get a preview of your registers
:registers
```


### Buffers

Main concepts:

- **buffer**: in-memory text of a file
- **window**: viewport on a buffer
- **tab**: collection of windows


### folding

| Command      | Description                                      |
| ------------ | ------------------------------------------------ |
| `zf{motion}` | Create a fold                                    |
| `zo`         | **O**pen fold                                    |
| `zc`         | **C**lose fold                                   |
| `za`         | Toggle fold                                      |
| `zd`         | **D**elete fold (text is unchanged)              |
| `zj`         | Move to the next fold (`j` move)                 |
| `zk`         | Move to the previous fold (`k` move)             |
| `zR`         | Open all folds in buffer (**R**educe all folds)  |
| `zM`         | Close all folds in buffer (close **M**ore folds) |
| `zE`         | Delete all folds in buffer                       |
| `:fold`      | In Visual mode: fold selected lines.             |

