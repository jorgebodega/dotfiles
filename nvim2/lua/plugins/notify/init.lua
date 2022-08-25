local icons = require('theme.icons')

local notify = require('notify')

vim.notify = notify
notify.setup({
  icons = {
    ERROR = icons.error,
    WARN = icons.warn,
    INFO = icons.info,
    DEBUG = icons.debug,
    TRACE = icons.trace,
  },
  stages = 'slide',
  background_colour = require('theme.colors').bg,
})

require('plugins.notify.highlights')
