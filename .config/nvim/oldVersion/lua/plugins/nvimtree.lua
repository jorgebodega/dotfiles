vim.g.nvim_tree_width = 50
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_auto_ignore_ft = 'startify'
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}
-- vim.g.nvim_tree_bindings = {
--     create = 'a',
--     remove = 'd',
--     rename = 'r',
--     cut = 'x',
--     copy = 'c',
--     paste = 'p',
--     close = 'q'
-- }
