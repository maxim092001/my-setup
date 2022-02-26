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
	use { "themercorp/themer.lua" }

	-- Github themes
  -- use { "projekt0n/github-nvim-theme" }

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
	
	-- Search
	use { 'ggandor/lightspeed.nvim' }

	-- Comments
	use { 'numToStr/Comment.nvim' }

	-- Git
	use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  tag = 'release' -- To use the latest release
 }

	-- Rust
	use { 'simrat39/rust-tools.nvim' }


	-- Which key
	use { "folke/which-key.nvim" }

end)

-- Github themes 
-- require('github-theme').setup()

-- Which key
require("which-key").setup()

-- Git signs
require('gitsigns').setup({
	signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
	signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
	 attach_to_untracked = true,
   current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
   current_line_blame_opts = {
  	virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  -- current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_unk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
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

-- This command contain error

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



-- Theme
-- require('nightfox').load('nordfox')
require("themer").setup({
 	colorscheme = "gruvbox-material-dark-medium",
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
require'telescope'.load_extension("themes")

-- Telescope mappings
map("n", "<leader>gr", [[<cmd>Telescope lsp_references<CR>]])
map('n', '<leader>ff', [[<cmd>Telescope find_files<CR>]])
map('n', '<leader>fg', [[<cmd>Telescope live_grep<CR>]])
map('n', '<leader>fh', [[<cmd>Telescope help_tags<CR>]])


-- NvimTree mappings
map('n', "<leader>nf", [[<cmd>NvimTreeFindFile<CR>]])
