local cmd = vim.cmd
local map = require'map'.map

map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
-- map("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]])
--
-- map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
-- map("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
-- map("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
-- map("n", "<leader>rn", [[<cmd>lua vim.lsp.buf.rename()<CR>]])
-- map("n", "<leader>ca", [[<cmd>lua vim.lsp.buf.code_action()<CR>]])
--
-- map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>o", [[<cmd>lua vim.lsp.buf.formatting()<CR>]])
--
-- New mappings with lsp saga

map("n", "K", [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]])
map("n", "<leader>sd", [[<cmd> lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]])
map("n", "<leader>ss", [[<cmd> lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>]])
map("n", "<leader>gs", [[<cmd> lua require('lspsaga.signaturehelp').signature_help()<CR>]])
map("n", "<leader>ca", [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]])
-- map("n", "<leader>ca", [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]])
map("n", "[e", [[<cmd> lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]])
map("n", "]e", [[<cmd> lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]])
map("n", "gd", [[<cmd> lua require'lspsaga.provider'.preview_definition()<CR>]])
map("n", "<leader>rn", [[<cmd> lua require('lspsaga.rename').rename()<CR>]])
map("n", "gh", [[<cmd> lua require'lspsaga.provider'.lsp_finder()<CR>]])

-- Other lsp mappings
map("n", "<leader>st", [[<cmd>lua require("metals").toggle_setting("showImplicitArguments")<CR>]])
map("n", "<leader>im", [[<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>]])
map("n", "<leader>ws", [[<cmd>lua require("metals").hover_worksheet()<CR>]])
map("n", "<leader>tt", [[<cmd>lua require("metals.tvp").toggle_tree_view()<CR>]])
map("n", "<leader>tr", [[<cmd>lua require("metals.tvp").reveal_in_tree()<CR>]])
map("v", "K", [[<Esc><cmd>lua require("metals").type_of_range()<CR>]])

cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
cmd([[autocmd FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])
