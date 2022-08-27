local capabilities = vim.lsp.protocol.make_client_capabilities()

--lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
	--capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
--})

-- Metals specific
-- adjyst
metals_config = require('metals').bare_config()
metals_config.settings = {
	showImplicitArguments = true,
	serverVersion = "0.10.9+271-a8bb69f6-SNAPSHOT"
}
metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
metals_config.on_attach = function(client, bufnr)
	require("metals").setup_dap()
end
