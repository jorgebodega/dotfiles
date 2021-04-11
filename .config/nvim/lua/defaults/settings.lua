vim.cmd [[set noshowmatch]]
vim.o.hidden = true
vim.cmd [[set noerrorbells]]
vim.cmd [[set number relativenumber]]
vim.cmd [[set nowrap]]
vim.o.updatetime = 50
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.smartcase = true
vim.cmd [[set nohlsearch]]
vim.o.incsearch = true
vim.cmd [[set noswapfile]]
vim.cmd [[set nobackup]]
vim.o.undodir = '~/.config/nvim/undodir'
vim.o.undofile = true
vim.o.scrolloff = 8
vim.o.guicursor = ""
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.inccommand = 'split'
vim.o.cmdheight = 2
vim.cmd [[set shortmess+=c]]
vim.cmd [[filetype on]]
vim.cmd [[filetype indent on]]
vim.cmd [[filetype plugin on]]

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.o.completeopt = 'menu,menuone,noselect'

-- lsp column & git column
vim.o.signcolumn = 'yes:2'
-- vim.o.signcolumn = 'number'

vim.g.loaded_matchparen = 1
vim.g.mapleader = ' '

vim.o.cursorline = false
vim.o.cursorcolumn = false

-- fold
vim.wo.foldcolumn = '0' -- defines 1 col at window left, to indicate folding
vim.o.foldlevelstart = 99 -- start file with all folds opened

-- using treesitter for folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
