return require('packer').startup(function(use)
  -- LSP
  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')
  -- use {'onsails/lspkind-nvim', config = lua_path 'lspkind'}
  -- use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}

  -- -- Syntax
  -- use 'moll/vim-node'
  -- use 'zdharma-continuum/zinit-vim-syntax'
  -- use {'editorconfig/editorconfig-vim', config = lua_path "editorconfig"}
  -- use 'chrisbra/csv.vim'
  -- use 'npxbr/glow.nvim'
  -- use 'junegunn/vim-easy-align'
  -- use {'mhartington/formatter.nvim', config = lua_path "formatter"}

  -- -- Status Line and Bufferline
  -- use {'famiu/feline.nvim', config = lua_path "feline"}

  -- -- Telescope
  -- use {'nvim-telescope/telescope.nvim', config = lua_path "telescope"}
  -- use 'nvim-telescope/telescope-fzy-native.nvim'
  -- use 'nvim-telescope/telescope-project.nvim'
  -- use {'pwntester/octo.nvim', config = lua_path "octo"}

  -- -- Registers
  -- use 'tversteeg/registers.nvim'
  -- use {'AckslD/nvim-neoclip.lua', config = lua_path "nvim-neoclip"}

  -- -- Move & Search & replace
  -- use 'windwp/nvim-spectre'
  -- use {'nacro90/numb.nvim', config = lua_path "numb"}
  -- use {'dyng/ctrlsf.vim', config = lua_path "ctrlsf"}
  -- use {'kevinhwang91/nvim-hlslens', config = lua_path "hlslens"}
  -- use {'ggandor/lightspeed.nvim', config = lua_path "lightspeed"}
  -- use {'karb94/neoscroll.nvim', config = lua_path "neoscroll"}
  -- use 'dstein64/nvim-scrollview'
  -- use 'chaoren/vim-wordmotion'
  -- use 'fedepujol/move.nvim'

  -- -- Tmux
  -- use 'christoomey/vim-tmux-navigator'

  -- -- Tags
  -- use {'ludovicchabant/vim-gutentags', config = lua_path "vim-gutentags"}

  -- -- General Plugins
  -- use {'mhinz/vim-startify', config = lua_path "vim-startify"}
  -- -- use {'wfxr/minimap.vim', config = lua_path "minimap"}
  -- -- use {'GustavoKatel/sidebar.nvim', config = lua_path "sidebar"} TODO Check this
  -- use {'luukvbaal/stabilize.nvim', config = lua_path "stabilize"}
  -- -- use {"beauwilliams/focus.nvim", config = lua_path "focus"} TODO Check this
  -- use {'goolord/alpha-nvim', config = lua_path "alpha-nvim"}
end)
