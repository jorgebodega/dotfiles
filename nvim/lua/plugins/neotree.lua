return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = { "Neotree" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    close_if_last_window = true,
    enable_diagnostics = true,
    enable_git_status = true,
    enable_modified_markers = true,
    popup_border_style = "single",
  },
}
