require'FTerm'.setup({
    dimensions = {height = 0.8, width = 0.8, x = 0.5, y = 0.5},
    border = 'single' -- or 'double'
})

nnoremaps('<F5>', '<CMD>lua require("FTerm").toggle()<CR>')
tnoremaps('<F5>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
