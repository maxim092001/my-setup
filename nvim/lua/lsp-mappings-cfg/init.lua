local map = require("map").map
local lspsaga = require("lspsaga")

lspsaga.init_lsp_saga()

map("n", "K", [[<cmd>Lspsaga hover_doc<CR>]], { silent = true })
map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
map("n", "gr", [[<cmd> vim.lsp.bug.references()<CR> ]])
map("n", "gd", [[<cmd> Lspsaga peek_definition<CR>]], { silent = true })
map("n", "<leader>sd", [[<cmd>Lspsaga show_line_diagnostics<CR>]], { silent = true })
map("n", "<leader>ss", [[<cmd>Lspsaga show_cursor_diagnostics<CR>]], { silent = true })
map("n", "]e", [[<cmd> Lspsaga diagnostic_jump_next<CR>]], { silent = true })
map("n", "[e", [[<cmd>Lspsaga diagnostic_jump_prev<CR>]], { silent = true })
map("n", "gh", [[<cmd>Lspsaga lsp_finder<CR>]], { silent = true })
map("n", "<leader>ca", [[<cmd>Lspsaga code_action<CR>]])
