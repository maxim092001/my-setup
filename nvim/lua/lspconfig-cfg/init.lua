local lspconfig = require("lspconfig")
local virtualtypes = require("virtualtypes")

-- OCaml
if vim.fn.executable("ocamllsp") then
	lspconfig.ocamllsp.setup({ on_attach = virtualtypes.on_attach })
end

-- Python
lspconfig.pyright.setup({})

-- Haskell
lspconfig.hls.setup({})

-- Scala (not used due to nvim-metals)
-- lspconfig.metals.setup({})

-- Lua
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})
