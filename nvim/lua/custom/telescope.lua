local map = require('custom.map').map

local setup = function()
-- Telescope
	require'telescope'.setup {
		border = false,
	}
	-- require'telescope'.load_extension("themes")

	-- Telescope mappings
	map("n", "<leader>gr", [[<cmd>Telescope lsp_references<CR>]])
	map('n', '<leader>ff', [[<cmd>Telescope find_files<CR>]])
	map('n', '<leader>fg', [[<cmd>Telescope live_grep<CR>]])
	map('n', '<leader>fh', [[<cmd>Telescope help_tags<CR>]])

end

return {
	setup = setup,
}
