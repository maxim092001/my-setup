local setup = function()
	require('nvim-treesitter.configs').setup {
		ensure_installed = {'scala', 'lua'},
		highlight = {
			enable = true
		}
	}
end

return {
	setup = setup
}
