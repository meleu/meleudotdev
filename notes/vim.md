---
dg-publish: true
---
# vim

- [[vim-upcase]]
- [[neovim]]
- [[vim-macros]]
- [[LazyVim]]
- [[LunarVim]] - buggy :(
- books
    - [[Practical Vim]]
    - [[Learning the vi and vim Editors]]
    - [[Mastering Vim Quickly]]

## Vim TerminalRoot

```sh
stty -ixon # 30 min
```


## things to do after vimtutor

By reading the contents of [this repository](https://github.com/dahu/learnvim) I realized that this is the things to do after finishing the vimtutor:

- learn how to navigate the documentation
    - `ctrl-]` to follow a vimdoc link
    - `ctrl-o` or `ctrl-t` to go back
- learn about text-objects
    - `:help Q_to` cheatsheet
    - `:help text-objects` - verbose
- `:help quickref` skim over quickref just to know it exists and what's there (it's like a cheatsheet)
- when lurking other people's `.vimrc`, a one-sentence description of the options assigned with `set` can be seen in `:help option-list`

## things I wanna do

- Apply `gq` (break lines at column 80) in the whole file and keep the cursor position.


## things I wanna learn

- macros
- windows/buffers management
- linting
- do something on save

## links

- <https://github.com/dahu/learnvim>

- text objects and macros in vim: <https://cloudacademy.com/course/text-objects-macros-vim-1413/text-objects/>
- ctags: <https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html>

- <https://thoughtbot.com/upcase/onramp-to-vim> - the best video series I found to get started with vim.
- [Vim: tutorial on customization and configuration - by Leeren](https://www.youtube.com/watch?v=JFr28K65-5E) - advanced, very well reviewed
- [Vim as an IDE - by Leeren](https://www.youtube.com/watch?v=Gs1VDYnS-Ac) - VimConf talk
- <https://thoughtbot.com/upcase/the-art-of-vim> - some useful vim tips
- <https://alldrops.info> - useful vim drops

- From the neovim tutor
  - *Learn Vim Progressively*:
    http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
  - *Learning Vim in 2013*:
    http://benmccormick.org/learning-vim-in-2014/
  - *Vimcasts*:
    http://vimcasts.org/
  - *Vim Video-Tutorials by Derek Wyatt*:
    http://derekwyatt.org/vim/tutorials/
  - *Learn Vimscript the Hard Way*:
    http://learnvimscriptthehardway.stevelosh.com/
- [[vim-seven-habits-of-effective-text-editing]]
  - *vim-galore*:
    https://github.com/mhinz/vim-galore


- video in portuguese: <https://www.youtube.com/watch?v=hdZMqMeruSQ>
    - 8:30 - 15:00: useful options for `.vimrc`
    - 15:00 - ??:??: plugins to make vim behave like vscode
        - <https://github.com/mhinz/vim-startify>
        - <https://github.com/rafi/awesome-vim-colorschemes>
        - <https://github.com/tomasiser/vim-code-dark>
        - <https://github.com/Yggdroot/indentLine>
        - <https://github.com/preservim/nerdtree>
        - <https://github.com/ryanoasis/vim-devicons> - must install [nerdfonts](https://github.com/ryanoasis/nerd-fonts) - alguma coisa deu errado aqui (30 minutos).
        - <https://github.com/vim-airline/vim-airline> and <https://github.com/vim-airline/vim-airline-themes>
        - parei nos 38 minutos



## cheatsheet

This is personal. I'm not taking notes of things I already memorized.

The commands are usually composed of a verb and a noun. Example: `dw`, stands for delete a word.

**Tip**: usually the same key used two times in a row applies the verb in the whole line. Examples: `dd` deletes the whole line, `cc` change the whole line.

### motion

See `:h motion` for more info.

mapping  | summary
---------|--------
`f<char>`| (f)ind a char forward in a line and move to it (`F` goes backward)
`t<char>`| find a char forward in a line and move un(t)il it (`T` goes backward)
`;`      | repeat last `f`, `F`, `t` or `T` command
`,`      | repeat last `f`, `F`, `t` or `T` command, but in opposite direction
`H`, `M`, `L` | move (H)igh, (M)iddle, or (L)ow within the viewport
`C-u`, `C-d`  | move (u)p or (d)own


### Text Objects

**Tip**: prefer using text-objects rather than motions in order to increase repeatability.

See `:h text-objects` for more options.

  mapping  | operation
-----------|----------
`iw`, `aw` | "inner word", "a word" (a word includes the space)
`is`, `as` | "inner sentece", "a sentece"
`ip`, `ap` | "inner paragraph", "a paragraph"
`i)`, `a)` | "inner parenthesis", "a parenthesis"
`i'`, `a'` | "inner single quote", "a single quote"
`it`, `at` | "inner tag", "a tag" (HTML tag)



## random tips

- `:set nu` or `:set number` - line numbers

- `:set ai` \| `:set noai` - enable/disable autoindent

- `:set visualbell` - blink screen instead of sound

- `:ab md mydomain.intranet.com` - when you type `md` it becomes `mydomain.intranet.com`

- visualy select part of the text and `:'<,'>$!sort` - sort the lines

- `:noh` - disables search highlight

- set a default font in gvim: `:set guifont=*`, choose the font config in the dialog box, then use `:set guifont?` to see what you should put in your `.vimrc`.


## basic .vimrc options

```vimrc
colorscheme evening
set number
set tabstop=2
set showcmd
set cursorline " gutter
```

### sensible.vim

Avoid too much configurations, but take a look at this one (which claims to be "defaults everyone can agree on"):
<https://github.com/tpope/vim-sensible>

It enables things like `<C-L>` to clear `hlsearch`, `<C-W>` to delete previous word when in INSERT mode, etc.



## install vim-plug

The [vim-plug](https://github.com/junegunn/vim-plug) is useful to install/update vim plugins.

Here's a way to install it at startup:
- add this to your `.vimrc`
```vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
```

## video: Mastering the Vim Language

- <https://www.youtube.com/watch?v=wlR5gYd6um0>

- 4:35 the language (basics)
- 5:36 repeatable & undoable
- 6:48 verbs/operators in vim
- 8:21 nouns in vim - motions
- 9:05 nouns in vim - text objects
- 12:18 nouns in vim - parameterized text objects (find/search)
- 16:33 where to learn/read
- 18:35 tips for mastering the language
- 20:35 relative number
- 22:45 visual mode is a smell
- 24:18 custom operators (from plugins)
    - 24:42 tpope/vim-surround
    - 26:02 tpope/vim-commentary
    - 26:48 vim-scripts/ReplaceWithRegister
    - 27:41 christoomey/vim-titlecase
    - 28:21 christoomey/sort-motion
    - 28:57 christommey/system-copy
- 29:52 custom nouns (objects)
    - 30:03 michaeljsmith/vim-indent-object
    - 31:08 kana/vim-textobj-entire
    - 30:30 kana/vim-textobj-line
        - both requires kana/vim-textobj-user
    - 32:15 ruby block
- 33:30 Finding more custom text objects

Syntax of the language: Verb + Noun

Example:

- **d** for delete
- **w** for word
- combine to be "**d**elete **w**ord"

Some verbs:

- `d`: delete
- `c`: change (delete and enter insert mode)
- `>`: indent
- `v`: visually select
- `y`: yank (copy)

Some nouns related to motions:

- `w`: word
- `b`: back
- `2j`: down 2 lines

Some nouns related to text objects:

- `iw`: inner word (works from anywhere in a word)
- `it`: inner tag (the contents of an HTML tag)
- `i"`: inner quotes
- `ip`: inner paragraph
- `as`: a sentence

Some nouns related to parameterized text objects

- `f`, `F`: find the next character, including it.
- `t`, `T`: find the next character, excluding it.
- `/`, `?`: search the string, not including the string.

### Tips:

- use `:set relativenumber`
- "visual mode is a smell"

### plugin suggestions

- Surround. e.g.:
  - `ds"`: delete surrounding quotes
  - `cs("`: change surrounding parens to quotes
  - `ysiw"`: add double quotes around the word
  - `cst<h2>`: change surrounding tag to `<h2>`
- Commentary
- ReplaceWithRegister
- Titlecase
- Sort-motion
- System-copy





## vimwiki

Questions to be answered:

- How to add a trailing `.md` extension when creating a new wiki page with `<Enter>`?
- How to git commit & push after saving with `:w`?
- How to open a specific wiki from command line? (I want to open my-notes with an alias like `mynotes`)
- How to sort an unordered list alphabetically?
    - Answer: <https://github.com/christoomey/vim-sort-motion>



