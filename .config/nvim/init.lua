-- Packer
-- require('plugins')

-- LSP Config
-- require('lsp')

-- Config
-- require('settings')
-- require('settings.color')
-- require('settings.font')
-- require('settings.completion')
-- require('settings.filetype')
-- require('settings.keymap')

do
  local ok, _ = pcall(require, 'impatient')

  if not ok then
    vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
  end
end

local ok, err = pcall(require, 'lua')

if not ok then
  error(('Error loading core...\n\n%s'):format(err))
end
