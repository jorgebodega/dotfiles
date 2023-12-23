return {
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        integrations = {
          aerial = true,
          alpha = true,
          gitsigns = true,
          mason = true,
          telescope = true,
          treesitter = true,
        },
      })

      vim.api.nvim_command("colorscheme catppuccin")
    end,
    enabled = true,
    name = "catppuccin",
    priority = 1000,
    tag = "v1.5.0",
  },
}
