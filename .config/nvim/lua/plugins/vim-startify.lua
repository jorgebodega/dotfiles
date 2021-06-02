vim.g.startify_session_dir = '~/.config/nvim/session'

vim.g.startify_files_number = 8
vim.g.startify_padding_left = 3
vim.g.webdevicons_enable_startify = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_session_sort = 1
vim.g.startify_update_oldfiles = 1
vim.g.startify_change_to_dir = 1
vim.g.startify_fortune_use_unicode = 1

vim.g.startify_lists = {
    {type = 'bookmarks', header = {'  Bookmarks'}},
    {type = 'files', header = {'  MRU Files'}},
    {type = 'dir', header = {'  MRU Files in ' .. vim.fn.getcwd()}},
    {type = 'commands', header = {'  Commands'}}
}

-- TODO Try to enable this
-- vim.cmd([[
--     function! StartifyEntryFormat()
--         return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
--     endfunction
-- ]])

-- nnoremap('<leader>sl', '<cmd>SLoad<CR>')
-- nnoremap('<leader>ss', '<cmd>SSave<CR>')
-- nnoremap('<leader>sd', '<cmd>SDelete<CR>')
-- nnoremap('<leader>sc', '<cmd>SClose<CR>')
