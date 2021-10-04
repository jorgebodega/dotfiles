vim.api.nvim_exec([[
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.mdx set filetype=markdown.mdx
autocmd Filetype markdown,Filetype markdown.mdx
autocmd BufNewFile,BufRead /*.rasi setf css
augroup ruby_subtypes
  autocmd!
  autocmd BufNewFile,BufRead *.pdf.erb let b:eruby_subtype='html'
  autocmd BufNewFile,BufRead *.pdf.erb set filetype=eruby
augroup END
]], true)
