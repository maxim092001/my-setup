require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"scala",
		"ocaml",
		"lua",
		"python",
		"haskell",
		"sql",
		"cpp",
		"vim",
		"bash",
		"markdown",
		"regex",
		"markdown_inline",
		"fish",
	},
	highlight = {
		enable = true,
	},
})
