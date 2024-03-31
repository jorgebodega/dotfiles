-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local lsp_attach = function(client, bufnr)
--   print(client, bufnr)
-- end

-- local lspconfig = require 'lspconfig'
-- require('mason-lspconfig').setup_handlers {
--   function(server_name)
--     lspconfig[server_name].setup {
--       on_attach = lsp_attach,
--       capabilities = lsp_capabilities,
--     }
--   end,
-- }
-- require('mason-null-ls').setup_handlers {}

local lsp = require 'lsp-zero'
lsp.preset 'recommended'

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
