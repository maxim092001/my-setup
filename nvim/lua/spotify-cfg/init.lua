local spotify = require("nvim-spotify")
local map = require("map").map

spotify.setup({
	status = {
		update_interval = 10000, -- the interval (ms) to check for what's currently playing
		format = "%s %t by %a", -- spotify-tui --format argument
	},
})

map("n", "<leader>sp", [[<Plug>(SpotifyPause)]], { silent = true })
map("n", "<leader>sd", [[<cmd>SpotifyDevices<CR>]], { silent = true })
map("n", "<leader>sn", [[<Plug>(SpotifySkip)]], { silent = true })
map("n", "<leader>so", [[<cmd>Spotify<CR>]], { silent = true })
map("n", "<leader>sb", [[<Plug>(SpotifyPrev)]], { silent = true })
map("n", "<leader>sn", [[<Plug>(SpotifyNext)]], { silent = true })
map("n", "<leader>ss", [[<Plug>(SpotifySave)]], { silent = true })
