-- Implement delta as previewer for diffs
nnoremaps('<leader>r', ":lua require('telescope.builtin').live_grep()<CR>")
nnoremaps('<leader>bb', ":lua require('telescope.builtin').buffers()<CR>")
nnoremaps('<leader>m', ":lua require('telescope.builtin').marks()<CR>")
nnoremaps('<leader>t', ":lua require('telescope.builtin').treesitter()<CR>")
nnoremaps('<leader>l',
          ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
nnoremaps('<leader>f', ":lua require('plugins.telescope').project_files()<CR>")
nnoremaps('<leader>p',
          ":lua require('telescope').extensions.project.project{}<CR>")
nnoremaps('<leader>c', ":lua require('plugins.telescope').my_git_commits()<CR>")
nnoremaps('<leader>gg', ":lua require('plugins.telescope').my_git_status()<CR>")
nnoremaps('<leader>b', ":lua require('plugins.telescope').my_git_bcommits()<CR>")
nnoremaps('<leader>n', ":lua require('plugins.telescope').my_note()<CR>")
nnoremap('<leader>nn', ":e ~/Note/")
-- nnoremap('<leader>gc', ':Octo issue create<CR>')
-- nnoremap('<leader>i', ':Octo issue list<CR>')

nnoremap('<leader>ps', ":lua require('telescope.builtin').live_grep()<CR>")
nnoremap('<leader>pF', ":lua require('telescope.builtin').find_files()<CR>")
nnoremap('<leader>pG', ":lua require('telescope.builtin').git_files()<CR>")
-- nnoremap('<leader>cc',
--          ":lua require('lt.plugins.telescope.functions').search_config()<CR>")

nnoremap('<leader>/h', ":lua require('telescope.builtin').command_history()<CR>")
nnoremap('<leader>/c', ":lua require('telescope.builtin').commands()<CR>")
nnoremap('<leader>/r', ":lua require('telescope.builtin').registers()<CR>")
nnoremap('<leader>/m', ":lua require('telescope.builtin').marks()<CR>")
nnoremap('<leader>/t', ":lua require('telescope.builtin').treesitter()<CR>")

nnoremap('<leader>bL', ":lua require('telescope.builtin').buffers()<CR>")

