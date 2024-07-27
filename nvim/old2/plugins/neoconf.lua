return {
  {
    "folke/neoconf.nvim",
    opts = {
      import = {
        vscode = false,
      },
    },
    priority = 100, -- Need to be loaded BEFORE LspZero
  },
}
