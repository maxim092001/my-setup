local capabilities = vim.lsp.protocol.make_client_capabilities()
local api = vim.api
local cmd = vim.cmd

local map = require("map").map

local metals_config = require("metals").bare_config()

metals_config.settings = {
	showImplicitArguments = true,
	scalafmtConfigPath = ".scalafmt.conf",
	scalafixConfigPath = ".scalafix.conf",
	showInferredType = true,
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
metals_config.on_attach = function(client, bufnr)
	map("n", "K", [[<cmd>Lspsaga hover_doc<CR>]], { silent = true }, bufnr)
	map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]], { silent = true }, bufnr)
	map("n", "rn", [[<cmd>Lspsaga rename<CR>]], { silent = true }, bufnr)
	map("n", "gd", [[<cmd>Lspsaga peek_definition<CR>]], { silent = true }, bufnr)
	map("n", "<leader>ld", [[<cmd>Lspsaga show_line_diagnostics<CR>]], { silent = true }, bufnr)
	map("n", "<leader>cd", [[<cmd>Lspsaga show_cursor_diagnostics<CR>]], { silent = true }, bufnr)
	map("n", "]e", [[<cmd> Lspsaga diagnostic_jump_next<CR>]], { silent = true }, bufnr)
	map("n", "[e", [[<cmd>Lspsaga diagnostic_jump_prev<CR>]], { silent = true }, bufnr)
	map("n", "gh", [[<cmd>Lspsaga lsp_finder<CR>]], { silent = true }, bufnr) -- references
	map("n", "<leader>ca", [[<cmd>Lspsaga code_action<CR>]], {}, bufnr)
end
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
	-- NOTE: You may or may not want java included here. You will need it if you
	-- want basic Java support but it may also conflict if you are using
	-- something like nvim-jdtls which also works on a java filetype autocmd.
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})

-- cmd([[augroup lsp]])
cmd([[augroup scalametals]])
cmd([[autocmd!]])
-- cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
cmd([[autocmd FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])
