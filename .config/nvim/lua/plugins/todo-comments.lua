local icons = require('theme.icons')

require('todo-comments').setup({
  keywords = {
    FIX = {
      icon = icons.debug,
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug' },
    },
    TODO = { icon = icons.check },
    HACK = { icon = icons.flame },
    WARN = { icon = icons.warn },
    PERF = { icon = icons.perf },
    NOTE = { icon = icons.note },
  },
})
