local core_plugins = {
  -- Package manager
  { "wbthomason/packer.nvim" },

  -- Common libraries
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Icons
  { "kyazdani42/nvim-web-devicons" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    requires = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
  },

  -- Snippets
  { "rafamadriz/friendly-snippets" },
  { "L3MON4D3/LuaSnip" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
    },
  },
  {
    "hrsh7th/cmp-buffer",
    requires = {
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "hrsh7th/cmp-path",
    requires = {
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    requires = {
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    requires = {
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "hrsh7th/cmp-nvim-lua",
    requires = {
      "hrsh7th/nvim-cmp",
    },
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      { "rafamadriz/friendly-snippets" },
      { "L3MON4D3/LuaSnip" },
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
    },
  },

  -- -- Formatter
  -- -- Linter
  -- { "jose-elias-alvarez/null-ls.nvim" },
}

local default_snapshot_path = join_paths(runtime_nvim_dir, "snapshots", "default.json")

local file_readed, content = pcall(vim.fn.readfile, default_snapshot_path)
if not file_readed then
  return core_plugins
end

local default_sha1 = vim.fn.json_decode(content)

local get_default_sha1 = function(spec)
  local short_name, _ = require("packer.util").get_plugin_short_name(spec)
  return default_sha1[short_name] and default_sha1[short_name].commit
end

for _, spec in ipairs(core_plugins) do
  -- Manually lock the commit hash since Packer's snapshots are unreliable in headless mode
  spec["commit"] = get_default_sha1(spec)
end

return core_plugins
