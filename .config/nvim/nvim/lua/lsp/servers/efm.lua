local lsp = require('lspconfig')

local luafmt = require "lsp.servers.formatters.luafmt"
local prettier = require "lsp.servers.formatters.prettier"
local eslint = require "lsp.servers.linters.eslint_d"

local languages = {
    lua = {luafmt},
    typescript = {prettier, eslint},
    javascript = {prettier, eslint},
    yaml = {prettier},
    json = {prettier},
    markdown = {prettier}
}

local function eslint_config_exists()
    local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
    if not vim.tbl_isempty(eslintrc) then return true end

    return false
end

return function(language_server_path)
    local bin_path = language_server_path .. "/efm-langserver/efm-langserver"
    return {
        cmd = {bin_path},
        root_dir = function()
            if not eslint_config_exists() then
                print 'eslint configuration not found'
                return nil
            end

            return vim.fn.getcwd()
        end,
        filetypes = vim.tbl_keys(languages),
        init_options = {documentFormatting = true},
        settings = {
            rootMarkers = {"package.json", ".git"},
            lintDebounce = 300,
            languages = languages
        }
    }
end
