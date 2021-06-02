local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        prompt_prefix = "λ -> ",
        selection_caret = "|> ",
        file_ignore_patterns = {
            ".backup", ".swap", ".langservers", ".session", ".undo", "*.git",
            "node_modules", "vendor", ".cache", ".vscode-server", ".Desktop",
            ".Documents", "classes"
        },
        -- Don't pass to normal mode with ESC, problem with telescope-project
        mappings = {i = {["<esc>"] = actions.close}}
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

-- Extensions

require('telescope').load_extension('octo')
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('ultisnips')
-- require('telescope').load_extension('project')

-- Implement delta as previewer for diffs

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')

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
nnoremap('<leader>gc', ':Octo issue create<CR>')
nnoremap('<leader>i', ':Octo issue list<CR>')

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

local M = {}

local delta = previewers.new_termopen_previewer {
    get_command = function(entry)
        -- this is for status
        -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
        -- just do an if and return a different command
        if entry.status == '??' or 'A ' then
            return {
                'git', '-c', 'core.pager=delta', '-c',
                'delta.side-by-side=false', 'diff', entry.value
            }
        end

        -- note we can't use pipes
        -- this command is for git_commits and git_bcommits
        return {
            'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false',
            'diff', entry.value .. '^!'
        }

    end
}

M.my_git_commits = function(opts)
    opts = opts or {}
    opts.previewer = delta

    builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
    opts = opts or {}
    opts.previewer = delta

    builtin.git_bcommits(opts)
end

M.my_git_status = function(opts)
    opts = opts or {}
    opts.previewer = delta

    builtin.git_status(opts)
end

M.my_note = function(opts)
    opts = opts or {}
    builtin.live_grep {prompt_title = ' Note ', cwd = '~/Note'}
end

M.project_files = function(opts)
    opts = opts or {} -- define here if you want to define something
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end

M.show_diagnostics = function(opts)
    opts = opts or {}
    vim.lsp.diagnostic.set_loclist({open_loclist = false})
    require'telescope.builtin'.loclist(opts)
end

return M
