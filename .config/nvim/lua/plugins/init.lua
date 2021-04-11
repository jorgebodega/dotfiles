local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

require('packer').startup {
    function(use)
        use {'wbthomason/packer.nvim', opt = true}

        -- Color scheme
        use {
            'arcticicestudio/nord-vim',
            config = function() require 'plugins.nord' end
        } -- Theme

        use 'kyazdani42/nvim-web-devicons' -- Dev Icons
        use {
            'kyazdani42/nvim-tree.lua',
            config = function() require 'plugins.nvim-tree' end
        }

        use {
            'glepnir/galaxyline.nvim',
            branch = 'main',
            config = function() require 'plugins.galaxyline' end
        }

        -- Start options
        use {
            'mhinz/vim-startify',
            config = function() require 'plugins.startify' end
        } -- Start screen
        use 'tweekmonster/startuptime.vim' -- benchmark startup

        -- Git extensions
        use {
            'tpope/vim-fugitive',
            config = function() require 'plugins.fugitive' end
        } -- Git blames, logs...
        use 'airblade/vim-rooter' -- Autodetect root directory
        use {
            'f-person/git-blame.nvim',
            config = function() require 'plugins.gitblame' end
        } -- Line git blame
        use {
            'lewis6991/gitsigns.nvim',
            config = function() require 'plugins.gitsigns' end,
            requires = {'nvim-lua/plenary.nvim'}
        } -- Git signs for side and galaxyline

        use 'psliwka/vim-smoothie' -- Smoother scroll
        use {
            'jdhao/better-escape.vim',
            config = function() require 'plugins.betterescape' end
        } -- Avoid use of escape
        -- use 'justinmk/vim-sneak' -- Add some movements by text
        use {
            'b3nj5m1n/kommentary',
            config = function() require 'plugins.kommentary' end
        } -- Add ease comments
        use 'tpope/vim-surround' -- Change surrounding arks
        -- use 'tpope/vim-repeat' -- Extends . repeat, for example for make it work with vim-sneak
        -- use 'bkad/CamelCaseMotion' -- Allows to move by camelCase with w e
        use {
            'glepnir/indent-guides.nvim',
            config = function() require 'plugins.indent-guides' end
        }
        use 'farmergreg/vim-lastplace' -- Remember last place of cursor

        -- This is not acceptable. Maybe it will be changed when 0.5 release.
        -- Autocomplete & Linters
        use 'neovim/nvim-lspconfig'
        use 'glepnir/lspsaga.nvim'
        use 'nvim-lua/lsp-status.nvim'
        use 'nvim-lua/lsp_extensions.nvim'
        use 'onsails/lspkind-nvim'
        -- TODO: check the tjdevries library
        use 'mattn/vim-lsp-settings'
        use 'prabirshrestha/vim-lsp'
        -- Snippets
        use {
            'hrsh7th/vim-vsnip',
            config = function() require 'plugins.snippets' end
        }
        use 'hrsh7th/vim-vsnip-integ'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
            config = function() require 'plugins.telescope' end
        }
        use 'nvim-telescope/telescope-fzy-native.nvim'

        -- Firenvim
        -- use {
        --     'glacambre/firenvim',
        --     run = function() vim.fn['firenvim#install'](0) end
        -- }

        -- Language packs
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function() vim.cmd [[TSUpdate]] end
        }
    end
}

if not packer_exists then vim.cmd [[PackerInstall]] end
