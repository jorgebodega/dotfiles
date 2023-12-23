return {
  {
    'catppuccin/nvim',
    config = function(_, opts)
      require('catppuccin').setup(opts)

      vim.cmd.colorscheme 'catppuccin'
    end,
    name = 'catppuccin',
    opts = {
      flavour = 'frappe',
      background = {
        dark = 'frappe',
      },
      integrations = {
        aerial = true,
        cmp = true,
        gitsigns = true,
        mason = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
      },
    },
    priority = 1000,
  },
}
