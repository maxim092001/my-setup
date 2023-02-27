local map = require("map").map
local lspsaga = require("lspsaga")

lspsaga.setup({
	ui = {
		colors = {
			normal_bg = "#1f2335",
		},
	},
})

map("n", "K", [[<cmd>Lspsaga hover_doc<CR>]], { silent = true })
map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
map("n", "rn", [[<cmd>Lspsaga rename<CR>]], { silent = true })
map("n", "gd", [[<cmd>Lspsaga peek_definition<CR>]], { silent = true })
map("n", "<leader>ld", [[<cmd>Lspsaga show_line_diagnostics<CR>]], { silent = true })
map("n", "<leader>cd", [[<cmd>Lspsaga show_cursor_diagnostics<CR>]], { silent = true })
map("n", "]e", [[<cmd> Lspsaga diagnostic_jump_next<CR>]], { silent = true })
map("n", "[e", [[<cmd>Lspsaga diagnostic_jump_prev<CR>]], { silent = true })
map("n", "gh", [[<cmd>Lspsaga lsp_finder<CR>]], { silent = true }) -- references
map("n", "<leader>ca", [[<cmd>Lspsaga code_action<CR>]])
