" when in a big soft-wrapped line, make j and k feel more 'natural'
nmap k gk
nmap j gj

" yanking to system clipboard
set clipboard=unnamed

set tabstop=2

" https://github.com/esm7/obsidian-vimrc-support#executing-obsidian-commands-with-obcommand
" WARNING: this [obcommand] is not a formal API that Obsidian provides
" and is done in a rather hacky manner. It's definitely possible that
" some future version of Obsidian will break this functionality.
exmap q obcommand workspace:close

exmap pin obcommand workspace:toggle-pin

exmap light obcommand theme:use-light
exmap dark obcommand theme:use-dark

exmap Lex obcommand file-explorer:reveal-active-file


exmap lsb obcommand app:toggle-left-sidebar
exmap rsb obcommand app:toggle-right-sidebar

" simulating vim-surround
" https://github.com/esm7/obsidian-vimrc-support#surround-text-with-surround
exmap wiki surround [[ ]]
map [[ :wiki

exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
exmap surround_double_quotes surround " "
exmap surround_double_quotes surround " "

" NOTE: disable 's' command (delete and enter Insert mode) for Visual Mode
vunmap s

map s" :surround_double_quotes
map s' :surround_single_quotes
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s] :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

