-- require'neoformat'
_G.neoformat_enable_lua = [[ stylua ]]
_G.neoformat_enable_scala = [[ scalafmt	]]
_G.neoformat_enable_ocaml = [[ ocamlformat ]]
_G.neoformat_enable_python = [[ black ]]
_G.neoformat_enable_cpp = [[ clang-format ]]
vim.api.nvim_exec(
	[[
	augroup fmt
		autocmd!
		autocmd BufWritePre * undojoin | Neoformat
	augroup END
]],
	false
)
