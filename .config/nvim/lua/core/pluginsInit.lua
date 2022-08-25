local custom_packer = require('packer')
local packer = custom_packer.packer

return packer.startup(function(use)
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
  })

  -- Theme
  use({
    'shaunsingh/nord.nvim',
    as = 'nord',
    config = require('plugins.nord'),
  })

  -- Icons
  use({
    'lewis6991/gitsigns.nvim',
    config = require('plugins.gitsigns'),
    requires = { 'kyazdani42/nvim-web-devicons' },
  })

  -- File explorer
  use({
    'kyazdani42/nvim-tree.lua',
    config = require('plugins.nvim-tree'),
  })

  -- Statusline
  use({ -- statusline
    'NTBBloodbath/galaxyline.nvim',
    branch = 'main',
    config = function()
      require('plugins.galaxyline')
    end,
  })
  use('romgrk/barbar.nvim')

  use({
    'CosmicNvim/cosmic-ui',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('plugins.cosmic-ui')
    end,
  })

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end,
    requires = {
      { 'b0o/SchemaStore.nvim' },
      { 'williamboman/nvim-lsp-installer' },
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('lsp.providers.null_ls')
        end,
        after = 'nvim-lspconfig',
      },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('plugins.lsp-signature')
        end,
        after = 'nvim-lspconfig',
      },
    },
  })

  -- Autocomplete
  use({
    'hrsh7th/nvim-cmp',
    config = require('plugins.nvim-cmp'),
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'quangnguyen30192/cmp-nvim-tags',
      'hrsh7th/cmp-path',
      'lukas-reineke/cmp-rg',
      'ray-x/cmp-treesitter',
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('plugins.luasnip')
        end,
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        config = function()
          require('plugins.auto-pairs')
        end,
        after = 'nvim-cmp',
      },
    },
  })

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    config = require('plugins.gitsigns'),
  })
  -- use 'kdheepak/lazygit.nvim'
  -- use 'rhysd/committia.vim'

  -- file navigation
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('plugins.telescope.mappings').init()
      require('plugins.telescope')
    end,
  })

  -- session/project management
  use({
    'glepnir/dashboard-nvim',
    config = function()
      require('plugins.dashboard')
    end,
  })

  use({
    'rmagatti/auto-session',
    config = function()
      require('plugins.auto-session')
    end,
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('plugins.treesitter'),
    requires = {
      'p00f/nvim-ts-rainbow',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
      {
        'lukas-reineke/indent-blankline.nvim',
        config = require('plugins.indent-blankline'),
        after = 'nvim-treesitter',
      },
    },
  })

  -- comments and stuff
  use({
    'numToStr/Comment.nvim',
    config = require('plugins.comments'),
  })

  -- TODO checks
  use({
    'folke/todo-comments.nvim',
    config = require('plugins.todo-comments'),
  })

  -- Tim Pope
  use({
    'tpope/vim-surround',
    'tpope/vim-capslock',
    'tpope/vim-repeat',
    'tpope/vim-jdaddy',
    'tpope/vim-fugitive',
    'tpope/vim-commentary',
  })

  -- Copilot
  use({ 'github/copilot.vim', config = require('plugins.copilot') })

  -- General
  use(
    {
      'rcarriga/nvim-notify',
      config = require('plugins.notify'),
    },
    'lambdalisue/suda.vim',
    'jeffkreeftmeijer/vim-numbertoggle',
    { 'airblade/vim-rooter', config = require('plugins.vim-rooter') },
    'andymass/vim-matchup'
  )

  if custom_packer.first_install then
    packer.sync()
  end
end)
