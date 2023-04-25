return {
  -- Initial plugins required
  { "folke/lazy.nvim", version = "^9" },
  "nvim-lua/plenary.nvim",

  -- Key helpers
  {
    "folke/which-key.nvim",
    event = "UIEnter",
    opts = {
      plugins = {
        spelling = { enabled = true },
        presets = { operators = false },
      },
      window = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      disable = { filetypes = { "TelescopePrompt" } },
    },
    version = "^1",
  },

  -- Easy escape
  {
    "max397574/better-escape.nvim",
    config = true,
    event = "InsertCharPre",
  },
}
