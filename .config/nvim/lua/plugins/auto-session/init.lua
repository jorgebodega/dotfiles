local config = require('core.user')
local u = require('utils')

local defaults = {
  pre_save_cmds = { 'NvimTreeClose', 'cclose', 'lua vim.notify.dismiss()' },
  post_restore_cmds = { 'NvimTreeRefresh' },
  auto_session_enabled = false,
  auto_save_enabled = true,
  auto_restore_enabled = false,
}

require('auto-session').setup(u.merge(defaults, config.auto_session or {}))
