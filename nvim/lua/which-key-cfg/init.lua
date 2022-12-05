local wk = require'which-key'

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
	f = {
		name = "Telescope",
		f = { [[<CMD>Telescope find_files<CR>]], "Find files" },
		g = { [[<CMD>Telescope live_grep<CR>]], "Grep" },
		h = { [[<CMD>Telescope help_tags<CR>]], "Help tags" },
		r = { [[<CMD>Telescope lsp_references<CR>]], "Lsp references" },
	},

	p = {
		name = "Packer",
		i = { [[PackerInstall]], "PackerInstall" },
	},

	n = {
		name = "NvimTree",
		t = { [[<CMD>NvimTreeOpen<CR>]], "Open" },
		f = { [[<CMD>NvimTreeFindFile]], "Find file" },
	},
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
