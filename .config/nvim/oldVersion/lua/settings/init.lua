-- Global
vim.opt.hidden = true
vim.opt.fillchars = {vert = ' '}
vim.opt.showtabline = 2
vim.opt.scrolloff = 8
vim.opt.mouse = 'a'
vim.opt.undolevels = 1000
vim.opt.shortmess:append{c = true, S = true}
vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrapscan = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.joinspaces = false
vim.opt.title = true
vim.opt.lazyredraw = true
vim.opt.encoding = 'UTF-8'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.clipboard = 'unnamedplus'
vim.opt.listchars = {
    tab = ">>>",
    trail = "·",
    precedes = "←",
    extends = "→",
    eol = "↲",
    nbsp = "␣"
}
-- vim.cmd [[set nohlsearch]] -- TODO I had this
vim.opt.hlsearch = true
vim.g.mapleader = ' '
vim.opt.updatetime = 50

-- Buffer
vim.opt.fileformat = 'unix'
vim.opt.tabstop = 4
vim.opt.spelllang = 'en'
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Window
vim.opt.number = true
vim.opt.colorcolumn = "+1"
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 1
vim.opt.list = false
vim.opt.foldnestmax = 10
vim.opt.signcolumn = 'yes:2'
vim.opt.foldenable = false
vim.opt.cursorline = true
vim.opt.cmdheight = 2

vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'

