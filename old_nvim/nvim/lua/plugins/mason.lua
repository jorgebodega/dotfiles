local M = {}

M.setup = function()
  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end

  mason.setup {
    ui = {
      border = "rounded",
      icons = {
        package_installed = icons.ui.Check,
        package_uninstalled = icons.ui.Close,
        package_pending = icons.ui.Reload,
      },
    },
  }
end

return M
