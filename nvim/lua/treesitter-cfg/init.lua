require("nvim-treesitter.configs").setup({
	ensure_installed = { "scala", "ocaml", "lua", "python", "haskell", "sql" },
	highlight = {
		enable = true,
	},
})
