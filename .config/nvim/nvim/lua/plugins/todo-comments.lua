require("todo-comments").setup {
    signs = true, -- show icons in the signs column
    -- keywords recognized as todo comments
    keywords = {TODO = {icon = " ", color = "info", alt = {"@todo"}}}
    -- list of named colors where we try to extract the guifg from the
    -- list of hilight groups or use the hex color if hl not found as a fallback
    -- TODO: This will probably need some checks when colorscheme changes
    -- colors = {
    --     error = {"LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626"},
    --     warning = {"LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24"},
    --     info = {"LspDiagnosticsDefaultInformation", "#2563EB"},
    --     hint = {"LspDiagnosticsDefaultHint", "#10B981"},
    --     default = {"Identifier", "#7C3AED"}
    -- },
}

nnoremaps('<leader>to', ':TodoTelescope<CR>')
