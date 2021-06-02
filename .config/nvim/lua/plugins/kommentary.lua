vim.g.kommentary_create_default_mappings = false

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true
})

require('kommentary.config').configure_language("typescript", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"}
})

vim.api
    .nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase",
                        {})
vim.api.nvim_set_keymap("v", "<leader>ci", "<Plug>kommentary_visual_increase",
                        {})
vim.api
    .nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease",
                        {})
vim.api.nvim_set_keymap("v", "<leader>cd", "<Plug>kommentary_visual_decrease",
                        {})
