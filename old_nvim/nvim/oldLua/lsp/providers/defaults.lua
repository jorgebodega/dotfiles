local M = {}

M.on_attach = require("lsp.utils.attach").on_attach

M.flags = {
  debounce_text_changes = 150,
}

M.capabilities = {}

M.root_dir = function(fname)
  local util = require("lspconfig").util
  return util.root_pattern ".git"(fname)
    or util.root_pattern "tsconfig.base.json"(fname)
    or util.root_pattern "package.json"(fname)
    or util.root_pattern ".eslintrc.js"(fname)
    or util.root_pattern ".eslintrc.json"(fname)
    or util.root_pattern "tsconfig.json"(fname)
end

M.autostart = true

M.single_file_support = true

return M
