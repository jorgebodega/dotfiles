require('plugins.telescope.remaps')

local telescope = require('telescope')
-- require('telescope').load_extension('octo')
telescope.load_extension('fzy_native')
-- require('telescope').load_extension('project')
-- require('telescope').load_extension('ultisnips')

local actions = require('telescope.actions')
telescope.setup {
    defaults = {
        file_ignore_patterns = {
            ".backup", ".swap", ".langservers", ".session", ".undo", "*.git",
            "node_modules", "vendor", ".cache", ".vscode-server", ".Desktop",
            ".Documents", "classes"
        },
        -- Don't pass to normal mode with ESC, problem with telescope-project
        mappings = {i = {["<esc>"] = actions.close}},
        prompt_prefix = "λ -> "
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

-- Implement delta as previewer for diffs

local previewers = telescope.previewers
local builtin = telescope.builtin
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
    local ok = pcall(builtin.git_files, opts)
    if not ok then builtin.find_files(opts) end
end

M.show_diagnostics = function(opts)
    opts = opts or {}
    vim.lsp.diagnostic.set_loclist({open_loclist = false})
    builtin.loclist(opts)
end

return M
