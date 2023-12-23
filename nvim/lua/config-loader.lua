M = {}

function M.setup()
  local configs = {
    "plugins.luasnip",
    "plugins.lsp-zero",
    "plugins.mason-lspconfig",
    "plugins.mason",
    "plugins.telescope",
    "plugins.treesitter",
  }

  for _, config in ipairs(configs) do
    require(config).setup()
  end
end

return M
