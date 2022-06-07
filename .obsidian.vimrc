" when in a big soft-wrapped line, make j and k feel more 'natural'
nmap k gk
nmap j gj
" zz keeps the cursor in the middle of the screen
" nmap k gkzz 
" nmap j gjzz
" nmap G Gzz

nmap <C-l> :nohl

" yanking to system clipboard
set clipboard=unnamed

set tabstop=2

" WARNING: this [obcommand] is not a formal API that Obsidian provides
" and is done in a rather hacky manner. It's definitely possible that
" some future version of Obsidian will break this functionality.
exmap q obcommand workspace:close
