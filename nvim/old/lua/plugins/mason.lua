return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- cmd = { 'LspInstall', 'LspUninstall' },
    -- config = function(_, opts)
    --   local mason_lspconfig = require 'mason-lspconfig'
    --   mason_lspconfig.setup(opts)
    --   -- mason_lspconfig.setup_handlers {}
    -- end,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    lazy = true,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    -- cmd = { 'NullLsInstall', 'NullLsUninstall' },
    -- config = function(_, opts)
    --   local mason_null_ls = require 'mason-null-ls'

    --   mason_null_ls.setup(opts)
    --   require('null-ls').setup {
    --     sources = {
    --       -- Anything not supported by mason.
    --     },
    --   }

    --   require('mason-null-ls').setup_handlers() -- If `automatic_setup` is true.
    -- end,
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    lazy = true,
    -- opts = { automatic_setup = true },
  },
}
