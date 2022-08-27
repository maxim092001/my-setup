require'plugins'

require('lspsaga').init_lsp_saga()

require("tmux").setup()

-- require("transparent").setup({
	-- enable = true
-- })

require("trouble").setup({
 auto_open = true
})

require("lsp-colors").setup({})

-- Which key
require"which-key-config"
--
-- -- Git signs
require'gitsigns-config'

-- Rust
require('rust-tools').setup({})

-- Comments
require('Comment').setup()

-- Tabs mappings
require'tabs-config'

-- Terminal
require("toggleterm").setup{
	open_mapping = [[<c-\>]]
}

-- Completion
require'cmp-config'

-- Lsp mappings
require'lsp_mappings-config'

-- Metals config
require'metals-config'

-- Theme
-- require('nightfox').load('nordfox')
require'themer-config'

-- Status line
require('lualine').setup {
	options = {
		theme = "gruvbox"
	}
}
-- require'statusline'

-- opt.statusline = "%!luaeval('Super_custom_status_line()')"

require'language_servers-config'

-- Dap config
require'dap-config'

-- Treesitter

require'treesitter-config'

-- Telescope
require'telescope-config'

-- Globals
require'globals'
