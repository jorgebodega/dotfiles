return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_diagnostics = true,
      enable_git_status = true,
      enable_modified_markers = true,
      popup_border_style = "single",
    })
  end,
  dependencies = {
    { "MunifTanjim/nui.nvim", tag = "0.2.0" },
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  tag = "3.13",
}
