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

-- quit
nnoremap('<leader>q', '<cmd>q<CR>')
nnoremap('<leader>Q', '<cmd>q!<CR>')

-- save
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

-- Remap convenient change between windows commands
nnoremap('<leader>h', '<cmd>wincmd h<CR>')
nnoremap('<leader>j', '<cmd>wincmd j<CR>')
nnoremap('<leader>k', '<cmd>wincmd k<CR>')
nnoremap('<leader>l', '<cmd>wincmd l<CR>')

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
