require("toggleterm").setup({
	open_mapping = [[<C-T>]],
})

local map = require("map").map

map("n", "<leader>tf", [[<cmd>ToggleTerm direction=float<cr>]], { silent = true })
map("n", "<leader>ltf", [[<cmd>Lspsaga term_toggle<cr>]], { silent = true })

-- Lazygit integration

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
