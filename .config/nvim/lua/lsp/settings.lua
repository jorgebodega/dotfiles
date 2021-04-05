local lsp = require('lspconfig')

-- local lsp_completion = require('completion') -- TODO: Uncomment when package is enabled
local lsp_status = require('lsp-status')
local remaps = require('lsp.remaps')

-- for debugging lsp
-- Levels by name: 'trace', 'debug', 'info', 'warn', 'error'
-- vim.lsp.set_log_level("info")

local function on_attach(client, bufnr)
    remaps.set(client.server_capabilities, bufnr)
    -- lsp_completion.on_attach(client, bufnr) -- TODO: Uncomment when package is enabled
    lsp_status.on_attach(client, bufnr)

    -- adds beatiful icon to completion
    -- require('lspkind').init() -- TODO: Uncomment when package is enabled
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {spacing = 0, prefix = "■"},

        -- see: ":help vim.lsp.diagnostic.set_signs()"
        signs = true,

        update_in_insert = false
    })

lsp_status.register_progress()

local default_lsp_config = {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
local language_server_path = vim.fn.stdpath("cache") .. "/lspconfig"

local servers = {
    -- efm = require('./servers.efm')(language_server_path),
    -- bashls = require('./servers.bashls')(language_server_path),
    -- dockerls = {},
    yamlls = require('lsp.servers.yamlls')(language_server_path),
    jsonls = require('lsp.servers.jsonls')(language_server_path),
    -- rust_analyzer = {},
    tsserver = require('lsp.servers.tsserver')(language_server_path, on_attach),
    -- html = require('./servers.htmlls')(language_server_path),
    -- cssls = require('./servers.cssls')(language_server_path),
    sumneko_lua = require('lsp.servers.sumneko_lua')(language_server_path),
    pyright = require('lsp.servers.pyright')(language_server_path)
}

for server, config in pairs(servers) do
    lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
end
