local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
    ensure_installed = {"typescript", "tsx", "lua", "json"},
    highlight = {enable = true},
    indent = {enable = true}
}
