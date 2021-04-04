local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = {"typescript", "lua", "json", "python"},
    highlight = {enable = true},
    indent = {enable = true}
}
