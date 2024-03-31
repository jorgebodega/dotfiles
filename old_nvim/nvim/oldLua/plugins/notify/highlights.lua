local colors = require "theme.colors"
local set_highlight = require("utils.highlights").set_highlight

set_highlight("NotifyINFOBorder", {
  guifg = colors.info,
})
set_highlight("NotifyINFOTitle", {
  guifg = colors.info,
})
set_highlight("NotifyINFOIcon", {
  guifg = colors.info,
})
set_highlight("NotifyWARNBorder", {
  guifg = colors.warn,
})
set_highlight("NotifyWARNTitle", {
  guifg = colors.warn,
})
set_highlight("NotifyWARNIcon", {
  guifg = colors.warn,
})
set_highlight("NotifyERRORBorder", {
  guifg = colors.error,
})
set_highlight("NotifyERRORTitle", {
  guifg = colors.error,
})
set_highlight("NotifyERRORIcon", {
  guifg = colors.error,
})
set_highlight("NotifyTRACEBorder", {
  guifg = colors.trace,
})
set_highlight("NotifyTRACETitle", {
  guifg = colors.trace,
})
set_highlight("NotifyTRACEIcon", {
  guifg = colors.trace,
})
