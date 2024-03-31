local user_config = require('core.user')

vim.cmd([[packadd packer.nvim]])
local packer = require('packer')

-- @TODO: check if snapshot exists, if not create it
packer.init({
  -- snapshot = 'Cosmic',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
    prompt_border = 'rounded',
  },
  -- compile_path = vim.fn.stdpath('config') .. '/lua/compiled.lua',
})

return packer.startup(function(use)
  use({ 'wbthomason/packer.nvim' })
  use({ 'lewis6991/impatient.nvim' })
  use({ 'nvim-lua/popup.nvim' })
  use({ 'nvim-lua/plenary.nvim' })
  use({ 'jdhao/better-escape.vim' }) --, event = 'InsertEnter' })
  -- use({ 'Tastyep/structlog.nvim' })

  use({
    'shaunsingh/nord.nvim',
    as = 'nord',
    config = function()
      require('plugins.nord')
    end,
  })

  use({
    'rcarriga/nvim-notify',
    config = function()
      require('plugins.notify')
    end,
    after = 'nord',
  })

  -- theme stuff
  use({ -- statusline
    'NTBBloodbath/galaxyline.nvim',
    branch = 'main',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('plugins.galaxyline')
    end,
    after = 'nord',
  })

  -- file explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('plugins.nvim-tree')
    end,
    -- todo check if this is needed
    -- cmd = {
    --   'NvimTreeClipboard',
    --   'NvimTreeClose',
    --   'NvimTreeFindFile',
    --   'NvimTreeOpen',
    --   'NvimTreeRefresh',
    --   'NvimTreeToggle',
    -- },
  })

  -- use({
  --   'CosmicNvim/cosmic-ui',
  --   requires = {
  --     'MunifTanjim/nui.nvim',
  --   },
  --   config = function()
  --     require('plugins.cosmic-ui')
  --   end,
  --   event = 'BufWinEnter',
  -- })

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end,
    requires = {
      { 'b0o/SchemaStore.nvim' },
      { 'williamboman/nvim-lsp-installer' },
      -- { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('lsp.providers.null_ls')
        end,
        after = 'nvim-lspconfig',
      },
      -- {
      --   'ray-x/lsp_signature.nvim',
      --   config = function()
      --     require('plugins.lsp-signature')
      --   end,
      --   after = 'nvim-lspconfig',
      -- },
    },
    event = 'BufWinEnter',
  })

  -- snippets
  use({ 'rafamadriz/friendly-snippets' })
  use({
    'L3MON4D3/LuaSnip',
    config = function()
      require('plugins.luasnip')
    end,
  })

  -- autocompletion
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.nvim-cmp')
    end,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      -- { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      -- { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      -- { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        config = function()
          require('plugins.autopairs')
        end,
        after = 'nvim-cmp',
      },
    },
    event = 'InsertEnter',
  })

  -- -- git commands
  -- -- todo maybe this one could be deleted
  -- use({
  --   'tpope/vim-fugitive',
  --   opt = true,
  --   cmd = 'Git',
  --   disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'fugitive'),
  -- })

  -- git column signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim', opt = true },
    event = 'BufWinEnter',
    config = function()
      require('plugins.gitsigns')
    end,
  })

  -- file navigation
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        -- todo mirar fzy
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('plugins.telescope.mappings').init()
      require('plugins.telescope')
    end,
    event = 'BufWinEnter',
  })

  -- -- session/project management
  -- use({
  --   'glepnir/dashboard-nvim',
  --   config = function()
  --     require('plugins.dashboard')
  --   end,
  -- })

  -- use({
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('plugins.auto-session')
  --   end,
  -- })

  -- lang/syntax stuff
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,
  })

  -- -- comments and stuff
  -- use({
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('plugins.comments')
  --   end,
  --   event = 'BufWinEnter',
  -- })

  -- -- todo highlights
  -- use({
  --   'folke/todo-comments.nvim',
  --   requires = 'nvim-lua/plenary.nvim',
  --   config = function()
  --     require('plugins.todo-comments')
  --   end,
  --   event = 'BufWinEnter',
  -- })

  -- if cosmic_packer.first_install then
  --   packer.sync()
  -- end
end)
