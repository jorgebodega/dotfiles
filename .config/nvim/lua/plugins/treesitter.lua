require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    -- use_languagetree = true,
  },
  -- indent = {
  --   enable = true,
  -- },
  context_commentstring = {
    enable = true,
    -- enable_autocmd = false,
  },
  -- refactor = {
  --   highlight_definitions = { enable = true },
  --   highlight_current_scope = { enable = false },
  -- },
  rainbow = {
    enable = true,
  },
})
