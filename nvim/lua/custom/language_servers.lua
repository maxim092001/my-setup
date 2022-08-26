local setup = function()
	local servers = { 'pyright', 'rust_analyzer', 'hls' }
	for _, lsp in pairs(servers) do
		require('lspconfig')[lsp].setup {
			on_attach = on_attach,
			flags = {
				-- This will be the default in neovim 0.7+
				debounce_text_changes = 150,
			}
		}
end

end

return {
	setup = setup
}
