-- Main

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local opt = vim.opt
local global_opt = vim.opt_global

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Tabs
vim["softtabstop"] = 2
vim.o["shiftwidth"] = 2
vim.o["tabstop"] = 2
opt.smartindent = true

-- Number
vim.wo.number = true

-- Yank highlight
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)



-- Tree mappings
map("n", "<leader>t", ":NvimTreeOpen")


cmd('packadd packer.nvim')
require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
	use { 'neovim/nvim-lspconfig' }
	use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile'}
	use { 'nvim-lua/plenary.nvim' }
	use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }}


	-- Markdown preview
	use{ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }

	use { 'mfussenegger/nvim-dap' }

	use { 'hrsh7th/nvim-cmp', requires = {{'hrsh7th/vim-vsnip'}}}
	use { 'hrsh7th/cmp-vsnip' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-cmdline' }
	use { "hrsh7th/cmp-path" }
	--
	-- Navigation
  use { 'majutsushi/tagbar' }
	use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
	use {'junegunn/fzf.vim'}
	
	-- Some shit for statusline
	use { "tpope/vim-fugitive" }
  use { "tpope/vim-vinegar" }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- Themer
	-- use { 'EdenEast/nightfox.nvim' }
	use {
		"themercorp/themer.lua",
		config = function()
				require("themer").setup({
						colorscheme = "everforest",
						styles = {
								comment = { style = 'italic' },
								["function"] = { style = 'italic' }, 
								functionbuiltin = { style = 'italic' }, 
								variable = { style = 'italic' }, 
								variableBuiltIn = { style = 'italic' }, 
								parameter  = { style = 'italic' }, 
						},
				})
		end
}

	-- Terminal
	use { "akinsho/toggleterm.nvim" }

	-- Tabs
	use {
  	'romgrk/barbar.nvim',
  	requires = {'kyazdani42/nvim-web-devicons'}
  }


	-- Tree
	use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
	}

end)

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

-- LSP mappings
map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
map("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]])
map("v", "K", [[<Esc><cmd>lua require("metals").type_of_range()<CR>]])
map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
map("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
map("n", "<leader>rn", [[<cmd>lua vim.lsp.buf.rename()<CR>]])
map("n", "<leader>ca", [[<cmd>lua vim.lsp.buf.code_action()<CR>]])
map("n", "<leader>ws", [[<cmd>lua require("metals").hover_worksheet()<CR>]])
map("n", "<leader>tt", [[<cmd>lua require("metals.tvp").toggle_tree_view()<CR>]])
map("n", "<leader>tr", [[<cmd>lua require("metals.tvp").reveal_in_tree()<CR>]])
map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>o", [[<cmd>lua vim.lsp.buf.formatting()<CR>]])
map("n", "<leader>st", [[<cmd>lua require("metals").toggle_setting("showImplicitArguments")<CR>]])
map("n", "<leader>im", [[<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>]])
cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
cmd([[autocmd FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])

--local lsp_config = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

--lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
  --capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
--})

-- Metals specific

metals_config = require('metals').bare_config()
metals_config.settings = {
	showImplicitArguments = true,
	serverVersion = "0.10.9+271-a8bb69f6-SNAPSHOT"
}
metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end


-- Telescope mappings
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fh', ':Telescope help_tags<cr>')

-- Theme
-- require('nightfox').load('nordfox')

require("themer").setup({
	colorscheme = "everforest",
	styles = {
			comment = { style = 'italic' },
			["function"] = { style = 'italic' }, 
			functionbuiltin = { style = 'italic' }, 
			variable = { style = 'italic' }, 
			variableBuiltIn = { style = 'italic' }, 
			parameter  = { style = 'italic' }, 
	},
})
-- Status line
require("custom.statusline")

opt.statusline = "%!luaeval('Super_custom_status_line()')"

-- Language servers
require'lspconfig'.hls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.sql.setup{}
-- require'lspconfig'.sumneko_lua.setup{}



-- Dap config
local dap = require("dap")

dap.configurations.scala = {
	{
		type = "scala",
		request = "launch",
		name = "RunOrTest",
		metals = {
			runType = "runOrTestFile",
			--args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
		},
	},
	{
		type = "scala",
		request = "launch",
		name = "Test Target",
		metals = {
			runType = "testTarget",
		},
	},
}

map("n", "<leader>dc", [[<cmd>lua require("dap").continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require("dap").repl.toggle()<CR>]])
map(
	"n",
	"<leader>ds",
	[[<cmd>lua require("dap.ui.widgets").sidebar(require("dap.ui.widgets").scopes).toggle()<CR>]]
)
map("n", "<leader>dK", [[<cmd>lua require("dap.ui.widgets").hover()<CR>]])
map("n", "<leader>dt", [[<cmd>lua require("dap").toggle_breakpoint()<CR>]])
map("n", "<leader>dso", [[<cmd>lua require("dap").step_over()<CR>]])
map("n", "<leader>dsi", [[<cmd>lua require("dap").step_into()<CR>]])
map("n", "<leader>dl", [[<cmd>lua require("dap").run_last()<CR>]])

require("metals").setup_dap()


-- Treesitter

require('nvim-treesitter.configs').setup {
	ensure_installed = 'maintained',
	highlight = {
		enable = true
	}
}

-- Telescope
require'telescope'.setup {
	border = false,
}
