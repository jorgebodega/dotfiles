vim.g.ctrlsf_ackprg = 'rg'
vim.g.ctrls_auto_preview = 1
vim.g.ctrlsf_search_mode = 'async'

nmap('<C-F>f', '<Plug>CtrlSFPrompt')
nmap('<C-F>f', '<Plug>CtrlSFVwordExec')
nmap('<C-F>n', '<Plug>CtrlSFCwordExec')
nnoremap('<C-F>t', ':CtrlSFToggle<CR>')
