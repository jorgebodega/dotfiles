return {
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        integrations = {
          treesitter = true,
        },
      })

      vim.api.nvim_command("colorscheme catppuccin-frappe")
    end,
    event = "VeryLazy",
    name = "catppuccin",
    priority = 100,
    version = "*",
  },
}
