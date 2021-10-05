-- Needs to run `npm install -g typescript typescript-language-server` in order to work properly
return function(language_server_path)
    local bin_path = language_server_path ..
                         "/pyright-langserver/pyright-langserver"
    return {
        cmd = {bin_path, "--stdio"},
        filetypes = {"python"},
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true
                }
            }
        }
    }
end
