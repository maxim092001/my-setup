local cmd = vim.cmd
cmd("packadd packer.nvim")

local packer = require("packer")

packer.startup(function(use)

	-- Packer
	use { 'wbthomason/packer.nvim', opt = true }

	-- Themer
	use { "themercorp/themer.lua" }

	-- Tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},	
	}

	-- Plenary, used for async plugins such as telescope
	use { 'nvim-lua/plenary.nvim' }
	
	-- Telescope
	use { 
		'nvim-telescope/telescope.nvim', 
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}
	
	-- Tagbar to show tags in file
	use { 'majutsushi/tagbar' }

	-- FZF - fuzzy finder 
	use { 'junegunn/fzf.vim' }

	-- Terminal
	use { 'akinsho/toggleterm.nvim' }

	-- Tabs
	use {
		'romgrk/barbar.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}

	-- Easy to use search
	use { 'ggandor/lightspeed.nvim' }

	-- Which key hints
	use { 'folke/which-key.nvim' }

	-- Comments
	use { 'numToStr/Comment.nvim' }

	-- Lspconfig
	use { 'neovim/nvim-lspconfig' }

	-- Lspsaga
	use { 'tami5/lspsaga.nvim' }

	-- Lsp colors
	use { 'folke/lsp-colors.nvim' }

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Lua
	use { 'sbdchd/neoformat' }
end)
