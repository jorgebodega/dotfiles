return require('packer').startup {
    function(use)
        use 'antoinemadec/FixCursorHold.nvim' -- Fix CursorHold Performance

        use {
            'dyng/ctrlsf.vim',
            config = function() require 'lt.plugins.ctrlsf' end
        }

        use 'rrethy/vim-illuminate' -- highlight matching words when cursor on it
        use 'terryma/vim-expand-region'

        use 'gennaro-tedesco/nvim-peekup' -- shows register preview
        use 'numtostr/BufOnly.nvim' -- deletes all buffers except
        use 'liuchengxu/vim-which-key' -- shows 'emacs' preview of shortcuts
        use 'romainl/vim-cool' -- disabled search highlight until next search
        use 'AndrewRadev/sideways.vim' -- allows to move functions parameters
        use 'AndrewRadev/splitjoin.vim' -- allows to split one liner to multi lines

        use 'tpope/vim-abolish' -- :S to replace with smartcase

        use {'hrsh7th/nvim-compe', branch = 'master'}
        -- use 'nvim-lua/completion-nvim'
        -- use 'steelsojka/completion-buffers'
        -- use 'nvim-treesitter/completion-treesitter'

        -- Snippets
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
    end
}
