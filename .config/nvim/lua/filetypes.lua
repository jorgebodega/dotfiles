addEventListener('set to javascript.jsx', {'BufNewFile,BufRead *.jsx'},
                 function() vim.cmd('set filetype=javascript.jsx') end)

addEventListener('set to typescript.tsx', {'BufNewFile,BufRead *.tsx'},
                 function() vim.cmd('set filetype=typescript.tsx') end)

addEventListener('set to markdown.mdx', {'BufNewFile,BufRead *.mdx'},
                 function() vim.cmd('set filetype=markdown.mdx') end)

addEventListener('Set wrap if markdown',
                 {'Filetype markdown,Filetype markdown.mdx'},
                 function() vim.cmd('set wrap') end)

