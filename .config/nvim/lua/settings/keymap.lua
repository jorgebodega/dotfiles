-- reload
nnoremap('<leader><CR>', '<cmd>lua reload()<CR>')
nnoremap('Y', 'y$')
nnoremap('X', '"_d')
--  TAB in general mode will move to next buffer
nnoremap('<C-H>', '<cmd>bnext<CR>')
--  SHIFT-TAB will go to prev buffer
nnoremap('<C-L>', '<cmd>bprev<CR>')
--  Close current buffer
nnoremap('<leader>r', '<cmd>bd<CR>')
-- Capitalize or lower case current word
nnoremap('<leader>u', '<esc>viw~ea')
-- Quit
nnoremap('<leader>q', '<cmd>q<CR>')
nnoremap('<leader>Q', '<cmd>q!<CR>')

-- Save
nnoremap('<leader>s', '<cmd>w<CR>')

-- Surround with quotation marks
nnoremap('<leader>"', 'viw<esc>a"<esc>bi"<esc>lel')
nnoremap('<leader>\'', 'viw<esc>a\'<esc>bi\'<esc>lel')

-- TODO: Not working
-- move upper/down on visual
vnoremap('K', '<cmd>m "<-2<CR>gv=gv"')
vnoremap('J', '<cmd>m ">+1<CR>gv=gv"')

-- deletes in visual
vnoremap('X', '"_d')

-- TODO: This should not exit visual mode
-- Better tabbing
vnoremap('<C-<>', '<gv')
vnoremap('<C->>', '>gv')

vim.cmd [[set clipboard+=unnamedplus]]
-- Copy to clipboard
vnoremap('<leader>y', '"+y')
nnoremap('<leader>Y', '"+yg_')
nnoremap('<leader>y', '"+y')
nnoremap('<leader>yy', '"+yy')

-- Copy all file on clipboard
nnoremap('<leader>ya', 'gg"+yG<C-o>')
vnoremap('<leader>ya', 'gg"+yG<C-o>')

-- Paste from clipboard
nnoremap('<leader>p', '"+p')
nnoremap('<leader>P', '"+P')
vnoremap('<leader>p', '"+p')
vnoremap('<leader>P', '"+P')

-- Operator pending mappings
-- Same as Xi(  shorted to Xp
onoremap('p', 'i(')
onoremap('a', '$')
onoremap('l', 'i{')
onoremap('b', '/return<cr>')
onoremap('in(', '<cmd><c-u>normal! f(vi(<cr>')
onoremap('il(', '<cmd><c-u>normal! F)vi(<cr>')
onoremap('in{', '<cmd><c-u>normal! f{vi{<cr>')
onoremap('il{', '<cmd><c-u>normal! F}vi{<cr>')

vim.api.nvim_set_keymap('n', '<F3>', ':set number! relativenumber!<CR>',
                        {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<F4>', ':set list! list?<CR>',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeToggle<CR>',
                        {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>nm', ':Dispatch npm start<CR>',
                        {noremap = false, silent = false})

-- Buffers
nmap('<leader>bda', ':BufferCloseAllButCurrent<CR>')
nmap('<leader>bn', ':bnext<CR>')
nmap('<leader>bp', ':bprevious<CR>')

-- Git
nmap('<leader>gf', ':20G<CR>')
nmap('<leader>g', ':LazyGit<CR>')
nmap('<leader>gd', ':DiffviewOpen<CR>')

-- Ctrlsf
vim.api.nvim_set_keymap('n', '<C-F>f', '<Plug>CtrlSFPrompt',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('v', '<C-F>f', '<Plug>CtrlSFVwordExec',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<C-F>n', '<Plug>CtrlSFCwordExec',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<C-F>t', ':CtrlSFToggle<CR>',
                        {noremap = true, silent = false})
-- Easy-align
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)',
                        {noremap = false, silent = false})
-- Vim-sneak
vim.api.nvim_set_keymap('n', 'f', '<Plug>Sneak_f',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'F', '<Plug>Sneak_F',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 't', '<Plug>Sneak_t',
                        {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'T', '<Plug>Sneak_T',
                        {noremap = false, silent = false})
-- LSP
vim.api.nvim_set_keymap('n', '<space>,',
                        ':lua vim.lsp.diagnostic.goto_prev()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>;',
                        ':lua vim.lsp.diagnostic.goto_next()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>a',
                        ':lua vim.lsp.diagnostic.code_action()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>d', ':lua vim.lsp.buf.definition()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>h', ':lua vim.lsp.buf.hover()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>m', ':lua vim.lsp.buf.rename()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>r', ':lua vim.lsp.buf.references()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>s',
                        ':lua vim.lsp.buf.document_symbol()<CR>',
                        {noremap = true, silent = true})
-- Spectre
vim.api.nvim_set_keymap('n', '<leader>S', ":lua require('spectre').open()<CR>",
                        {noremap = true, silent = false})
vim.api.nvim_set_keymap('v', '<leader>S',
                        ":lua require('spectre').open_visual()<CR>",
                        {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>Sw',
                        "viw:lua require('spectre').open_visual()<CR>",
                        {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>sp',
                        "viw:lua require('spectre').open_file_search()<CR>",
                        {noremap = true, silent = false})
-- Telescope
vim.api.nvim_set_keymap('n', '<leader>r',
                        ":lua require('telescope.builtin').live_grep()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bb',
                        ":lua require('telescope.builtin').buffers()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>m',
                        ":lua require('telescope.builtin').marks()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t',
                        ":lua require('telescope.builtin').treesitter()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l',
                        ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>f',
                        ":lua require('plugins.telescope').project_files()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>p',
                        ":lua require('telescope').extensions.project.project{}<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>c',
                        ":lua require('plugins.telescope').my_git_commits()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gg',
                        ":lua require('plugins.telescope').my_git_status()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b',
                        ":lua require('plugins.telescope').my_git_bcommits()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>n',
                        ":lua require('plugins.telescope').my_note()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>nn', ":e ~/Note/",
                        {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Octo issue create<CR>',
                        {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>i', ':Octo issue list<CR>',
                        {noremap = true, silent = false})

nnoremap('<leader>ps', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap('<leader>pF', "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap('<leader>pG', "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap('<leader>cc',
         "<cmd>lua require('lt.plugins.telescope.functions').search_config()<CR>")

nnoremap('<leader>/h',
         "<cmd>lua require('telescope.builtin').command_history()<CR>")
nnoremap('<leader>/c', "<cmd>lua require('telescope.builtin').commands()<CR>")
nnoremap('<leader>/r', "<cmd>lua require('telescope.builtin').registers()<CR>")
nnoremap('<leader>/m', "<cmd>lua require('telescope.builtin').marks()<CR>")
nnoremap('<leader>/t', "<cmd>lua require('telescope.builtin').treesitter()<CR>")

nnoremap('<leader>bL', "<cmd>lua require('telescope.builtin').buffers()<CR>")

-- Todo-comments
vim.api.nvim_set_keymap('n', '<leader>to', ':TodoTelescope<CR>',
                        {noremap = true, silent = false})
-- Fterm
vim.api.nvim_set_keymap('n', '<F5>', '<CMD>lua require("FTerm").toggle()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<F5>',
                        '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
                        {noremap = true, silent = true})

nnoremap('<leader>wh', '<cmd>wincmd h<CR>')
nnoremap('<leader>wj', '<cmd>wincmd j<CR>')
nnoremap('<leader>wk', '<cmd>wincmd k<CR>')
nnoremap('<leader>wl', '<cmd>wincmd l<CR>')

nnoremap('<leader>w+', '<cmd>vertical resize +5<CR>')
nnoremap('<leader>w-', '<cmd>vertical resize -5<CR>')
