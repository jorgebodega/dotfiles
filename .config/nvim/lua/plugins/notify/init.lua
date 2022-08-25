require('notify').setup({
  background_colour = require('theme.colors').bg,
})

vim.notify = require('notify')

require('plugins.notify.highlights')
