local capabilities = vim.lsp.protocol.make_client_capabilities()
local api = vim.api
local cmd = vim.cmd

local metals_config = require("metals").bare_config()
metals_config.settings = {
	showImplicitArguments = true,
	serverVersion = "0.10.9+271-a8bb69f6-SNAPSHOT",
	scalafmtConfigPath = ".scalafmt.conf",
	scalafixConfigPath = ".scalafix.conf",
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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

cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
cmd([[autocmd FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])
