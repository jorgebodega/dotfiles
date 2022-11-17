local null_ls = require "null-ls"

null_ls.setup {
  on_attach = require("lsp.utils.attach").on_attach,
  root_dir = function(fname)
    local util = require("lspconfig").util
    return util.root_pattern ".git"(fname)
      or util.root_pattern "tsconfig.base.json"(fname)
      or util.root_pattern "package.json"(fname)
      or util.root_pattern ".eslintrc.js"(fname)
      or util.root_pattern ".eslintrc.json"(fname)
      or util.root_pattern "tsconfig.json"(fname)
  end,
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettierd.with {
      env = {
        PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
      },
    },
    null_ls.builtins.formatting.stylua,
  },
}
