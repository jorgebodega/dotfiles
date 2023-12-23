return {
  -- Neoconf. Requires to be loaded before LSP
  {
    "folke/neoconf.nvim",
    opts = {
      import = {
        vscode = false,
      },
    },
    priority = 100,
    tag = "v1.2.2",
  },

  -- LSP packages
  { "neovim/nvim-lspconfig", tag = "v0.1.7" },
  { "williamboman/mason.nvim", tag = "v1.8.3" },
  { "williamboman/mason-lspconfig.nvim", tag = "v1.26.0" },

  -- Completion packages
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip", tag = "v2.1.1" },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.extend_cmp()
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end,
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "VonHeikemen/lsp-zero.nvim",
  },
  lazy = true,
}
