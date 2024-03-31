return {
  {
    "folke/which-key.nvim",
    config = function()
      local which_key = require("which-key")
      which_key.setup()

      which_key.register(require("config.which-key.defaults"), {
        mode = "n",
        prefix = "<leader>",
      })

      -- which_key.register(require("config.which-key.non_leader"))
    end,
    event = "VeryLazy",
  },
}
