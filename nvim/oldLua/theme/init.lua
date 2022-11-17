local highlights = require "utils.highlights"

local get_highlight = highlights.get_highlight
local set_highlight = highlights.set_highlight

local statusline_colors = get_highlight "StatusLine"
local error_colors = get_highlight "DiagnosticError"
local warning_colors = get_highlight "DiagnosticWarn"
local hint_colors = get_highlight "DiagnosticHint"
local info_colors = get_highlight "DiagnosticInfo"

set_highlight("DiagnosticErrorInv", {
  guibg = error_colors.guifg,
  guifg = statusline_colors.guibg,
})

set_highlight("DiagnosticWarnInv", {
  guibg = warning_colors.guifg,
  guifg = statusline_colors.guibg,
})

set_highlight("DiagnosticHintInv", {
  guibg = hint_colors.guifg,
  guifg = statusline_colors.guibg,
})

set_highlight("DiagnosticInfoInv", {
  guibg = info_colors.guifg,
  guifg = statusline_colors.guibg,
})
