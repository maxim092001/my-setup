local lspconfig = require('lspconfig')

local virtualtypes = require'virtualtypes'
if vim.fn.executable('ocamllsp') then
	lspconfig.ocamllsp.setup { on_attach=virtualtypes.on_attach }
end

lspconfig.rust_analyzer.setup {}
lspconfig.pyright.setup {}

lspconfig.hls.setup {}

lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
		},
	},
}
