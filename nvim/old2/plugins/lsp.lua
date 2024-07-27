return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.extend_cmp()
      lsp_zero.extend_lspconfig()

      require("luasnip.loaders.from_vscode").lazy_load()

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
    dependencies = {
      -- LSP packages
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",

      -- Completion packages
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    event = { "VeryLazy" },
  },
}
