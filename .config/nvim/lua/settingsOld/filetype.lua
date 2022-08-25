vim.api.nvim_exec(
  [[
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
autocmd BufNewFile,BufRead /*.rasi setf css
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
]],
  true
)
