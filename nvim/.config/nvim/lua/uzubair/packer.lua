-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim")

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- maximizes and restores the current window
  use("szw/vim-maximizer")

  -- alternates to esc
  use { "jdhao/better-escape.vim", event="InsertEnter" }

  -- essential plugins
  -- replace the contents using the gr + motion
  use("inkarkat/vim-ReplaceWithRegister")

  use("tpope/vim-markdown")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-obsession")
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")

  -- colorschemes
  -- use("eddyekofo94/gruvbox-flat.nvim")
  use("gruvbox-community/gruvbox")

  -- hop
  use("phaazon/hop.nvim")

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  -- statusline
  use("nvim-lualine/lualine.nvim")

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  -- Project management with telescope
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Fuzzy Finder (files, lsp, etc)
  use 'cljoly/telescope-repo.nvim'
  use { 
    'nvim-telescope/telescope.nvim', branch = '0.1.x', 
    requires = { 
      'nvim-lua/plenary.nvim'
    }
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use('nvim-treesitter/playground')

  -- Additional text objects via treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

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
	  }
  }

  use('mbbill/undotree')
  use 'lewis6991/gitsigns.nvim'

  -- autoclose parens, brackets, quotes, etc...
  use("windwp/nvim-autopairs")

  --  wilder
  use('gelguy/wilder.nvim')

  -- which-key
  use('folke/which-key.nvim')

  use('glepnir/dashboard-nvim')

  use('rcarriga/nvim-notify')

  if packer_bootstrap then
    require("packer").sync()
  end
end)
