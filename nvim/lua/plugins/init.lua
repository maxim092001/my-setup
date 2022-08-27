local cmd = vim.cmd
cmd('packadd packer.nvim')
local packer = require('packer')

packer.startup(function(use)

	use { 'wbthomason/packer.nvim', opt = true }
	use { 'neovim/nvim-lspconfig' }
	use { "tami5/lspsaga.nvim" }
	use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile'}
	use { 'nvim-lua/plenary.nvim' }
	use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }}


	-- Markdown preview
	use{ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }

	use { 'mfussenegger/nvim-dap' }

	use { 'hrsh7th/nvim-cmp', requires = {{'hrsh7th/vim-vsnip'}}}
	use { 'hrsh7th/cmp-vsnip' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	-- use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-cmdline' }
	use { "hrsh7th/cmp-path" }

	-- Navigation
	use { 'majutsushi/tagbar' }
	use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
	use {'junegunn/fzf.vim'}

	-- Some shit for statusline
	use { "tpope/vim-fugitive" }
	use { "tpope/vim-vinegar" }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Themer
	use { "themercorp/themer.lua" }
	--

	-- Terminal
	use { "akinsho/toggleterm.nvim" }


	-- Tabs
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use { 'folke/lsp-colors.nvim' }

	-- Tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}

	-- Search
	use { 'ggandor/lightspeed.nvim' }

	-- Comments
	use { 'numToStr/Comment.nvim' }
	--
	-- Git
	use {
	'lewis6991/gitsigns.nvim',
	requires = {
		'nvim-lua/plenary.nvim'
	},
	tag = 'release' -- To use the latest release
 }

	-- Rust
	use { 'simrat39/rust-tools.nvim' }


	-- Which key
	use { "folke/which-key.nvim" }

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}

	use { "xiyaowong/nvim-transparent" }

	use { "junegunn/goyo.vim" }

	use { "aserowy/tmux.nvim" }

	use { 'ocaml/vim-ocaml' }

	use { 'jubnzv/virtual-types.nvim' }

	use { 'masukomi/vim-markdown-folding' }

	use { 'tpope/vim-markdown' }

	use { "sumneko/lua-language-server" }

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)
