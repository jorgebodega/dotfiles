local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'kabouzeid/nvim-lspinstall'
    -- use 'glepnir/lspsaga.nvim'
    -- use 'nvim-lua/lsp-status.nvim'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'windwp/nvim-autopairs'
    use 'andymass/vim-matchup'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use 'glepnir/indent-guides.nvim'

    -- Syntax
    use 'moll/vim-node'
    -- use 'zinit-zsh/zplugin-vim-syntax'
    use 'editorconfig/editorconfig-vim'
    -- use 'chrisbra/csv.vim'
    use 'junegunn/vim-easy-align'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Comments
    use 'b3nj5m1n/kommentary'

    -- Status Line and Bufferline
    use 'famiu/feline.nvim'
    use 'romgrk/barbar.nvim'
    use {'numtostr/BufOnly.nvim', cmd = 'BufOnly'}
    use 'AndrewRadev/sideways.vim'
    use 'AndrewRadev/splitjoin.vim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    -- use 'nvim-telescope/telescope-project.nvim'
    use 'fhill2/telescope-ultisnips.nvim'
    use 'pwntester/octo.nvim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    -- use 'kdheepak/lazygit.nvim'
    -- use 'rhysd/committia.vim'
    use 'sindrets/diffview.nvim'
    use 'f-person/git-blame.nvim'

    -- Registers
    use 'tversteeg/registers.nvim'

    -- Move & Search & replace
    use 'windwp/nvim-spectre'
    use 'nacro90/numb.nvim'
    use 'dyng/ctrlsf.vim'
    use 'kevinhwang91/nvim-hlslens'
    use 'kshenoy/vim-signature'
    use 'karb94/neoscroll.nvim'
    use 'dstein64/nvim-scrollview'
    use 'chaoren/vim-wordmotion'
    use 'terryma/vim-expand-region'

    -- Tim Pope docet
    use 'tpope/vim-sensible'
    -- use 'tpope/vim-rails'
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    -- use 'tpope/vim-bundler'
    use 'tpope/vim-capslock'
    use 'tpope/vim-repeat'
    use 'tpope/vim-endwise'
    -- use 'tpope/vim-rvm'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-dadbod'
    use 'tpope/vim-jdaddy'
    use 'tpope/vim-fugitive'

    -- Tmux
    use 'tmux-plugins/vim-tmux-focus-events'
    use 'christoomey/vim-tmux-navigator'

    -- Colorschema
    use 'sainnhe/gruvbox-material'
    use 'arcticicestudio/nord-vim'

    -- Tags
    -- use 'ludovicchabant/vim-gutentags'

    -- General Plugins
    use 'jdhao/better-escape.vim'
    use 'numtostr/FTerm.nvim'
    -- use 'lambdalisue/suda.vim'
    use 'tweekmonster/startuptime.vim'
    use 'folke/todo-comments.nvim'
    use 'rrethy/vim-illuminate'
    use 'farmergreg/vim-lastplace'
    use 'jeffkreeftmeijer/vim-numbertoggle'
    use 'airblade/vim-rooter'
    use 'mhinz/vim-startify'
    -- use {'wfxr/minimap.vim', run = ':!cargo install --locked code-minimap'} -- TODO: Add command to install base package
end)
