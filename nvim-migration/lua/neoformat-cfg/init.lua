
-- require'neoformat'
_G.neoformat_enable_lua = [[ stylua ]]

--vim.api.nvim_exec([[
--	augroup fmt
--		autocmd!
--		autocmd BufWritePre * undojoin | Neoformat
--	augroup END
--]], false)
