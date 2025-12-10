" syntax highlighting on
syn on

" move cursor left/right across line breaks
set whichwrap+=<,>,h,l,[,]

" tab size
set tabstop=2

" indent size
set shiftwidth=2

" simulate other tab sizes (no effect if same as tabstop)
" set softtabstop=2

" tabs insert indents instead of tabs at the beginning of a line
set smarttab

" tabs are spaces
set expandtab

" language-specific tab/indent overrides
autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType make setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4

" show line numbers
set number

" show line position
set ruler
