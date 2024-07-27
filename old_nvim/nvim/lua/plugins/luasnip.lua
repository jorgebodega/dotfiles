local M = {}

M.setup = function()
  -- local paths = {}

  -- paths[#paths + 1] = join_paths(runtime_dir, "site", "pack", "packer", "start", "friendly-snippets")

  -- local user_snippets = join_paths(get_config_dir(), "snippets")
  -- if utils.is_directory(user_snippets) then
  --   paths[#paths + 1] = user_snippets
  -- end

  require("luasnip.loaders.from_lua").lazy_load()
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()
end

return M
