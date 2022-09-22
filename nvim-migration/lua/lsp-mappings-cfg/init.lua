local cmd = vim.cmd

local map = require'map'.map

map('n', 'K', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]])
