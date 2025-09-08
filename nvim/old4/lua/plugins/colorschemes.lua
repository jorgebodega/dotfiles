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
    name = "catppuccin",
    priority = 150,
    version = "*",
  },
}
