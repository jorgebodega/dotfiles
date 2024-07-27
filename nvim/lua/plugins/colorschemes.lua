return {
  {
    "catppuccin/nvim",
    priority = 900,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        integrations = {
          treesitter = true,
        },
      })

      -- vim.api.nvim_command("colorscheme catppuccin-frappe")
    end,
  },
}
