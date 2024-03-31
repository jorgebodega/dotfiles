local M = {}

M.setup = function()
  local status_ok, masonlsp = pcall(require, "mason-lspconfig")
  if not status_ok then
    return
  end

  masonlsp.setup()
end

return M
