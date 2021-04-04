" Comments map to <C-/> (vim register for '/' is  '_')
nmap <C-_>  <Plug>NERDCommenterToggle
" gv leave selected lines
vmap <C-_>  <Plug>NERDCommenterToggle<CR>gv

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
