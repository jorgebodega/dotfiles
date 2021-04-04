-- Needs to run `npm install -g typescript typescript-language-server` in order to work properly
return function(language_server_path, on_attach)
    local bin_path = language_server_path ..
                         "/typescript-language-server/typescript-language-server"
    return {
        cmd = {bin_path, "--stdio"},
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            -- tsserver, stop messing with prettier da fuck!
            client.resolved_capabilities.document_formatting = false
        end
    }
end
