local lsp = require('lspconfig')

local luafmt = require "lsp.servers.formatters.luafmt"
local prettier = require "lsp.servers.formatters.prettier"
local eslint = require "lsp.servers.linters.eslint_d"

local languages = {
    lua = {luafmt},
    typescript = {prettier, eslint},
    javascript = {prettier, eslint},
    -- typescriptreact = {prettier, eslint},
    -- ['typescript.tsx'] = {prettier, eslint},
    -- javascriptreact = {prettier, eslint},
    -- ['javascript.jsx'] = {prettier, eslint},
    yaml = {prettier},
    json = {prettier},
    -- html = {prettier},
    -- scss = {prettier},
    -- css = {prettier},
    markdown = {prettier}
}

local function eslint_config_exists()
    local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
    local test = vim.fn.glob("package.json*")

    -- print(eslintrc)
    -- print(test)
    if not vim.tbl_isempty(eslintrc) then return true end
    -- print (vim.fn.getcwd())
    -- print (lsp.util.root_pattern("package.json", ".git", vim.fn.getcwd()))
    local r = lsp.util.root_pattern(".eslintrc*")

    -- print(lsp.util.find_git_root())
    -- print(lsp.util.find_node_modules_root())
    -- print(lsp.util.find_package_json_root())
    -- print(r)

    -- print('no rc found')

    if vim.fn.filereadable("package.json") then
        if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
            return true
        end
    end

    -- print('not in json')
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
            -- check if eslint_d installed globally!
            -- return lsp.util.root_pattern("package.json", ".git", vim.fn.getcwd())
            return vim.fn.getcwd()
        end,
        filetypes = vim.tbl_keys(languages),
        init_options = {documentFormatting = true},
        settings = {
            rootMarkers = {"package.json", ".git"},
            lintDebounce = 500,
            languages = languages
        }
    }
end
