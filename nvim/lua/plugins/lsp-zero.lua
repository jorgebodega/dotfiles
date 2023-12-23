local M = {}

M.setup = function()
  local status_ok, lspzero = pcall(require, "lsp-zero")
  if not status_ok then
    return
  end

  lspzero.preset "recommended"
  lspzero.nvim_workspace()
  lspzero.setup()
end

return M
