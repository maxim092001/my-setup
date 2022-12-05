local cmd = vim.cmd

cmd("packadd packer.nvim")

local packer = require("packer")

packer.startup(function(use)
	-- Packer
	use({ "wbthomason/packer.nvim", opt = true })

	-- Themer
	use({ "themercorp/themer.lua" })

	-- Tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- Plenary, used for async plugins such as telescope
	use({ "nvim-lua/plenary.nvim" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Tagbar to show tags in file
	use({ "majutsushi/tagbar" })

	-- FZF - fuzzy finder
	use({ "junegunn/fzf.vim" })

	-- Terminal
	use({ "akinsho/toggleterm.nvim" })

	-- Tabs
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Easy to use search
	use({ "ggandor/lightspeed.nvim" })

	-- Which key hints
	use({ "folke/which-key.nvim" })

	-- Comments
	use({ "numToStr/Comment.nvim" })

	-- Lspconfig
	use({ "neovim/nvim-lspconfig" })

	-- Lspsaga
	use({ "glepnir/lspsaga.nvim" })

	-- Lsp colors
	use({ "folke/lsp-colors.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Formatters
	use({ "sbdchd/neoformat" })

	-- Completion
	use({ "hrsh7th/nvim-cmp", requires = { { "hrsh7th/vim-vsnip" } } })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp" })

	-- Lualine (pretty statusline)
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Pretty troubles
	use({
		"folke/trouble.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Ocaml
	use({ "jubnzv/virtual-types.nvim" })

	-- Scala
	use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })

	-- Parentheses completion
	use({ "windwp/nvim-autopairs" })

	-- Symbols
	use({ "simrat39/symbols-outline.nvim" })

	-- Onedark theme
	use({ "navarasu/onedark.nvim" })
end)
