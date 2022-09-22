local map = require'map'.map

require'telescope'.setup {
	border = false,
}

map("n", "<leader>fr", [[<cmd>Telescope lsp_references<CR>]])
map('n', '<leader>ff', [[<cmd>Telescope find_files<CR>]])
map('n', '<leader>fg', [[<cmd>Telescope live_grep<CR>]])
map('n', '<leader>fh', [[<cmd>Telescope help_tags<CR>]])
