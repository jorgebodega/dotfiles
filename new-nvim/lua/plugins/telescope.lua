return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        file_ignore_patterns = { "%.git/." },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
