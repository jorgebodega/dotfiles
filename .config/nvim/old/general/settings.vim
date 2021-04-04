syntax enable

set noshowmatch
set hidden
set noerrorbells                " Stop sound effects
set number relativenumber
set nowrap                      " If a line goes our of screen it will not go line below
set updatetime=50
set autoindent
set expandtab
set smarttab

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab                   " Convert tab character to spaces
set smartindent                 " Best job to indent for you

set smartcase                   " Case sensitive searching
set nohlsearch
set incsearch                   " By the time start searching it highlight results before press enter

set noswapfile                  " Dont create vim.swp files
set nobackup                    " Dont make a backup
set undodir=~/.vim/undodir      " Store a backup in undo directory
set undofile                    " Store modified file per file in undo directory

set scrolloff=8
set guicursor=
set termguicolors
set noshowmode                  " Dont show Vim mode status => replaced by vim-airline
set cmdheight=2
set shortmess+=c

filetype on
filetype indent on
filetype plugin on
