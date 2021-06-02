-- Global
vim.o.hidden = true
-- vim.cmd [[set nohlsearch]] -- TODO I had this
vim.o.hlsearch = true
vim.g.mapleader = ' '
vim.o.updatetime = 50
vim.o.fillchars = vim.o.fillchars .. 'vert: '
vim.o.showtabline = 2
vim.o.scrolloff = 8
vim.o.mouse = 'a'
vim.o.backupcopy = 'yes'
vim.o.undolevels = 1000
vim.o.shortmess = vim.o.shortmess .. 'Sc'
vim.o.showmode = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrapscan = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.showcmd = false
-- vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.errorbells = false
vim.o.joinspaces = false
vim.o.title = true
vim.o.lazyredraw = true
vim.o.listchars = 'tab:▸ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣'
vim.o.encoding = 'UTF-8'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 2
-- From buffer
vim.o.fileformat = vim.bo.fileformat
vim.o.tabstop = vim.bo.tabstop
vim.o.spelllang = vim.bo.spelllang
vim.o.softtabstop = vim.bo.softtabstop
vim.o.swapfile = vim.bo.swapfile
vim.o.undodir = '~/.config/nvim/undodir'
vim.o.undofile = vim.bo.undofile
vim.o.expandtab = vim.bo.expandtab
vim.o.shiftwidth = vim.bo.shiftwidth
-- From window
vim.o.number = vim.wo.number
vim.o.colorcolumn = vim.wo.colorcolumn
vim.o.foldmethod = vim.wo.foldmethod
vim.o.foldlevel = vim.wo.foldlevel
vim.o.foldnestmax = vim.wo.foldnestmax
vim.o.signcolumn = vim.wo.signcolumn
vim.o.list = vim.wo.list
vim.o.foldenable = vim.wo.foldenable
vim.o.cursorline = vim.wo.cursorline
-- Buffer
vim.bo.fileformat = 'unix'
vim.bo.tabstop = 2
vim.bo.spelllang = 'en'
vim.bo.softtabstop = 2
vim.bo.swapfile = false
vim.bo.undofile = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
-- Window
vim.wo.number = true
vim.wo.colorcolumn = vim.wo.colorcolumn .. '+' .. 1
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 1
vim.wo.foldnestmax = 10
vim.wo.signcolumn = 'yes:2'
vim.wo.list = false
vim.wo.foldenable = false
vim.wo.cursorline = true

vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'

-- TODO: UNCOMMENT THIS WHEN 0.5 is released

-- Global
-- vim.opt.fillchars = { vert = ' ' }
-- vim.opt.showtabline = 2
-- vim.opt.scrolloff = 5
-- vim.opt.mouse = 'a'
-- vim.opt.backupcopy = 'yes'
-- vim.opt.undolevels = 1000
-- vim.opt.shortmess:append { c = true, S = true }
-- vim.opt.showmode = false
-- vim.opt.hidden = true
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
-- vim.opt.wrapscan = true
-- vim.opt.backup = false
-- vim.opt.writebackup = false
-- vim.opt.showcmd = true
-- vim.opt.showmatch = true
-- vim.opt.ignorecase = true
-- vim.opt.hlsearch = true
-- vim.opt.smartcase = true
-- vim.opt.errorbells = false
-- vim.opt.joinspaces = false
-- vim.opt.title = true
-- vim.opt.lazyredraw = true
-- vim.opt.encoding = 'UTF-8'
-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- vim.opt.clipboard = 'unnamedplus'
-- vim.opt.listchars = { tab = ">>>", trail = "·", precedes = "←", extends = "→",eol = "↲", nbsp = "␣" }
-- -- Buffer
-- vim.opt.fileformat = 'unix'
-- vim.opt.tabstop = 2
-- vim.opt.spelllang = 'it'
-- vim.opt.softtabstop = 2
-- vim.opt.swapfile = false
-- vim.opt.undofile = false
-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 2
-- -- Window
-- vim.opt.number = true
-- vim.opt.colorcolumn = "+1"
-- vim.opt.foldmethod = 'indent'
-- vim.opt.foldlevel = 1
-- vim.opt.list = false
-- vim.opt.foldnestmax = 10
-- vim.opt.signcolumn = 'yes'
-- vim.opt.relativenumber = true
-- vim.opt.foldenable = false
-- vim.opt.cursorline = true

-- vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'
