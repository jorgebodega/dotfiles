local util = require 'lspconfig/util'

return function(language_server_path, on_attach)
    local bin_path = language_server_path ..
                         "/typescript-language-server/typescript-language-server"
    return {
        cmd = {bin_path, "--stdio"},
        filetypes = {"javascript", "typescript"},
        root_dir = util.root_pattern("package.json", "tsconfig.json",
                                     "jsconfig.json", ".git"),
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            -- tsserver, stop messing with prettier da fuck!
            client.resolved_capabilities.document_formatting = false
        end
    }
end
