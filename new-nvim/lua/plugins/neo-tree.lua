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
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ff", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    { "<leader>fl", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
    { "<leader>fr", ":Neotree toggle right<CR>", silent = true, desc = "Right File Explorer" },
  },
  lazy = true,
}
