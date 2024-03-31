return {
  {
    "nvim-telescope/telescope.nvim",
    -- cmd = "Telescope",
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)

      telescope.load_extension("frecency")
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = { "VeryLazy" },
    opts = {
      file_ignore_patterns = { "%.git/." },
    },
  },
}
