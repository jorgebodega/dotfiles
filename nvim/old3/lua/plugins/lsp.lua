return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
          -- map("gr", require("telescope.builtin").lsp_references, "Goto References")
          -- map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
          -- map("go", require("telescope.builtin").lsp_type_definitions, "Type Definition")
          -- map("<leader>p", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
          -- map("<leader>P", require("telescope.builtin").lsp_workspace_symbols, "Workspace Symbols")
          -- map("<leader>Ps", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

          map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")

          map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

          -- Thank you teej
          -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L502
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      require("neodev").setup()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup(capabilities)
          end,
        },
      })
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
  },
}
