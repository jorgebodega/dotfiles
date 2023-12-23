require "core.icons"

local path_sep = "/"

function _G.safe_require(...)
  local ok, res = pcall(require, ...)
  if not ok then
    vim.notify(res, vim.log.levels.ERROR)
    return
  end

  return res
end

---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

_G.is_headless = #vim.api.nvim_list_uis() == 0

_G.runtime_dir = os.getenv "XDG_DATA_HOME"
_G.runtime_nvim_dir = join_paths(runtime_dir, "nvim")
_G.config_dir = os.getenv "XDG_CONFIG_HOME"
_G.config_nvim_dir = join_paths(config_dir, "nvim")
_G.cache_dir = os.getenv "XDG_CACHE_HOME"
_G.cache_nvim_dir = join_paths(cache_dir, "nvim")
