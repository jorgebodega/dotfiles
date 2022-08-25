local u = require('utils')
local defaults = require('lsp.providers.defaults')
local null_ls = require('null-ls')

require('null-ls').setup(u.merge(defaults, {
  sources = {
    null_ls.builtins.code_actions.eslint_d.with({
      prefer_local = 'node_modules/.bin',
    }),
    null_ls.builtins.diagnostics.eslint_d.with({ prefer_local = 'node_modules/.bin' }),
    null_ls.builtins.formatting.eslint_d.with({ prefer_local = 'node_modules/.bin' }),
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.prettierd.with({
      env = { PRETTIERD_LOCAL_PRETTIER_ONLY = 1 },
    }),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
  },
}))
