local cmd = vim.cmd

cmd("packadd packer.nvim")

local packer = require("packer")

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]])

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

	-- Experimental noice
	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})

	-- Commects for todo
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Illuminate (mark under cursor)
	use({
		"RRethy/vim-illuminate",
	})

	-- Tokyonight theme
	use({ "folke/tokyonight.nvim" })

	-- spotify
	use({
		"KadoBOT/nvim-spotify",
		requires = "nvim-telescope/telescope.nvim",
		run = "make",
	})

	-- tmux navigation
	use({
		"christoomey/vim-tmux-navigator",
	})

	-- git signs
	use({
		"lewis6991/gitsigns.nvim",
	})

	-- Mason
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})

	-- Latex
	use({ "lervag/vimtex" })

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	use("rafamadriz/friendly-snippets")
end)
