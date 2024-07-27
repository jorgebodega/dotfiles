return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      preview_config = {
        border = "rounded",
      },
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      update_debounce = 200,
    })
  end,
}
