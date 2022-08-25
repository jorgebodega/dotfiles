local icons = require('theme.icons')

vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_refresh_wait = 300
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_icons = {
  default = '',
  symlink = icons.symlink,
  git = icons.git,
  folder = icons.folder,
  lsp = {
    hint = icons.hint,
    info = icons.info,
    warning = icons.warn,
    error = icons.error,
  },
}

require('nvim-tree').setup({
  disable_netrw = true,
  auto_close = true,
  diagnostics = {
    enable = true,
  },
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 50,
    number = true,
    relativenumber = true,
  },
  git = {
    ignore = true,
  },
})
