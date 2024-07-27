return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    name = "treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "jq",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown_inline",
        "markdown",
        "proto",
        "python",
        "query",
        "regex",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
    version = "*",
  },
}
