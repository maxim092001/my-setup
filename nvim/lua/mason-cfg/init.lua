require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ocamllsp", "pyright", "hls", "clangd", "jsonls", "texlab", "rust_analyzer" },
})

local lspconfig = require("lspconfig")
local virtualtypes = require("virtualtypes")

-- OCaml
if vim.fn.executable("ocamllsp") then
	lspconfig.ocamllsp.setup({ on_attach = virtualtypes.on_attach })
end

lspconfig.rust_analyzer.setup({})

-- Python
lspconfig.pyright.setup({})

-- Latex
lspconfig.texlab.setup({})

-- Haskell
lspconfig.hls.setup({})

-- C++
lspconfig.clangd.setup({})

-- Scala (not used due to nvim-metals)
-- lspconfig.metals.setup({})

-- Lua
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

lspconfig.jsonls.setup({})
