local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd[[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'
    use {
	    'VonHeikemen/lsp-zero.nvim',
	    requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},

      -- Format Support
      {'jose-elias-alvarez/null-ls.nvim'},

      --{'MunifTanjim/prettier.nvim'}
	  }
  }
    -- Color hightlighter
    use {'norcalli/nvim-colorizer.lua'}

    -- Added Tabs
    use {
     'romgrk/barbar.nvim',
     requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
       requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
      'akinsho/flutter-tools.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    use 'simrat39/rust-tools.nvim'

    -- Discord Presence
    use 'andweeb/presence.nvim'

    use 'windwp/nvim-autopairs'

    use {
      'windwp/nvim-ts-autotag',
      config = function ()
       require('nvim-ts-autotag').setup({})
      end
    }

    use 'lewis6991/gitsigns.nvim'

    use 'tpope/vim-surround'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
end)
