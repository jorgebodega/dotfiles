local M = {}

M.setup = function()
  -- if is_headless then
  --   return
  -- end

  local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  treesitter_configs.setup {
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
      config = {
        typescript = "// %s",
        css = "/* %s */",
        scss = "/* %s */",
        html = "<!-- %s -->",
        svelte = "<!-- %s -->",
        vue = "<!-- %s -->",
        json = "",
      },
    },
    ensure_installed = "all",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml", "python" } },
    matchup = {
      enable = false, -- mandatory, false will disable the whole extension
    },
    rainbow = {
      enable = false,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = nil,
    },
    textsubjects = {
      enable = false,
      keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
    },
  }
end

return M
