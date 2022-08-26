-- Main
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local opt = vim.opt
local global_opt = vim.opt_global
local api = vim.api
local map = require('custom.map').map

-- Tabs
vim["softtabstop"] = 2
vim.o["shiftwidth"] = 2
vim.o["tabstop"] = 2
opt.smartindent = true

-- Number
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.relativenumber = true

-- Yank highlight
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

-- Tree mappings
map("n", "<leader>nt", ":NvimTreeOpen")
map('n', "<leader>nf", [[<cmd>NvimTreeFindFile<CR>]])

-- Fold mappings
map("n", "<leader>fo", ":foldopen<CR>")
map("n", "<leader>fc", ":foldclose<CR>")

cmd('packadd packer.nvim')

require('custom.plugins')

local lsp = require'lspconfig'
local virtualtypes = require'virtualtypes'

require('lspsaga').init_lsp_saga()
require("tmux").setup()

if vim.fn.executable('ocamllsp') then
  lsp.ocamllsp.setup { on_attach=virtualtypes.on_attach }
end

require("transparent").setup({
	enable = true
})

require("trouble").setup({
 auto_open = true
})

require("lsp-colors").setup({})

-- Which key
require("which-key").setup()
--
-- -- Git signs
require('custom.gitsigns').setup()

-- Rust
require('rust-tools').setup({})

-- Comments
require('Comment').setup()

-- Remove gitblame text by default. Use :GitBlameToggle
vim.g.gitblame_display_virtual_text = 0

-- Global
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")
global_opt.termguicolors = true
global_opt.hidden = true
global_opt.showtabline = 1
global_opt.updatetime = 300
global_opt.showmatch = true
global_opt.ignorecase = true
global_opt.smartcase = true
global_opt.mouse = 'a'
global_opt.syntax = 'on'

-- Tree
require('nvim-tree').setup()

-- Tabs mappings
require('custom.tabs').setup()

-- Terminal
require("toggleterm").setup{
	open_mapping = [[<c-\>]]
}

-- Completion
require('custom.cmp').setup()

-- Lsp mappings
require('custom.lsp_mappings').setup()

-- Metals config
require('custom.metals_config').setup()

-- Theme
-- require('nightfox').load('nordfox')
require('custom.themer').setup()

-- Status line
require("custom.statusline")

opt.statusline = "%!luaeval('Super_custom_status_line()')"

require('custom.language_servers')

-- Language servers
-- require'lspconfig'.hls.setup{}
-- require'lspconfig'.pyright.setup{}

-- Dap config
require('custom.dap').setup()

-- Treesitter

require('custom.treesitter_configs').setup()

-- Telescope
require('custom.telescope').setup()
