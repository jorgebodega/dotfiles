require 'lsp.servers.settings'

local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspkind').init()

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=')
vim.cmd('sign define LspDiagnosticsSignWarning text=')
vim.cmd('sign define LspDiagnosticsSignInformation text=')
vim.cmd('sign define LspDiagnosticsSignHint text=')
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

local cmp = require('cmp_nvim_lsp')
local capabilities_updated = cmp.update_capabilities(capabilities)

lspconfig.tsserver.setup {capabilities = capabilities_updated}
lspconfig.dockerls.setup {capabilities = capabilities_updated}
lspconfig.jsonls.setup {
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    },
    capabilities = capabilities_updated
}
lspconfig.yamlls.setup {capabilities = capabilities_updated}
lspconfig.vimls.setup {capabilities = capabilities_updated}
