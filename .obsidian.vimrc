" when in a big soft-wrapped line, make j and k feel more 'natural'
nmap k gk
nmap j gj

" clear highlight search
nmap <C-l> :nohl

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

exmap reveal obcommand file-explorer:reveal-active-file

" https://github.com/esm7/obsidian-vimrc-support#surround-text-with-surround
exmap wiki surround [[ ]]
map [[ :wiki
