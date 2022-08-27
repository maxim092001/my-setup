local wk = require('which-key')
wk.setup {
	plugins = {
		marks = false,
		registers = false,
		spelling = { enabled = false, suggestions = 20 },
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = false,
			z = false,
			g = false
		}
	}
}
local mappings = {
	l = {
		name = "LSP",
		i = { ":LspInfo<CR>", "Connected Language Servers" }
	},

	t = {
		name = "Telescope",
		f = { ":Telescope find_files<cr>", "Find files" },
		g = { ":Telescope live_grep<cr>", "Grep" },
		h = { ":Telescope help_tags<cr>", "Help tags" },
		r = { ":Telescope lsp_references<cr>", "Lsp references" },
	},

	m = {
		name = "Markdown fold",
		o = { ":foldopen<cr>", "Open fold" },
		c = { ":foldclose<cr>", "Close fold" },
	},

	p = {
		name = "Packer",
		i = { ":PackerInstall", "Packer install" }
	},

	n = {
		name = "NvimTree",
		t = { ":NvimTreeOpen<cr>", "Open" },
		f = { ":NvimTreeFindFile<cr>", "Find File"}
	},

}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)

