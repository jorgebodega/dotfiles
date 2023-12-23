return {
  'b0o/SchemaStore.nvim',
  'folke/neodev.nvim',
  -- {
  --   'neovim/nvim-lspconfig',
  --   config = function()
  --     -- plugin.default_config(opts)

  --     if vim.g.lsp_handlers_enabled then
  --       vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
  --       vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
  --     end
  --   end,
  -- },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Format
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'jay-babu/mason-null-ls.nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  },
  -- {
  --   'stevearc/aerial.nvim',
  --   opts = {
  --     attach_mode = 'global',
  --     layout = { min_width = 28 },
  --     show_guides = true,
  --     filter_kind = false,
  --     guides = {
  --       mid_item = '├ ',
  --       last_item = '└ ',
  --       nested_top = '│ ',
  --       whitespace = '  ',
  --     },
  --     keymaps = {
  --       ['[y'] = 'actions.prev',
  --       [']y'] = 'actions.next',
  --       ['[Y'] = 'actions.prev_up',
  --       [']Y'] = 'actions.next_up',
  --       ['{'] = false,
  --       ['}'] = false,
  --       ['[['] = false,
  --       [']]'] = false,
  --     },
  --   },
  -- },
}
