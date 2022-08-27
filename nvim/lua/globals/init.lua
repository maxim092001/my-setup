local exec = vim.api.nvim_exec
local opt = vim.opt
local global_opt = vim.opt_global

opt.smartindent = true
-- Remove gitblame text by default. Use :GitBlameToggle
vim.g.gitblame_display_virtual_text = 0

-- Global
global_opt.completeopt = { "menu", "noinsert", "noselect" }
global_opt.shortmess:remove("F"):append("c")
global_opt.termguicolors = true
global_opt.hidden = true
global_opt.showtabline = 1
global_opt.updatetime = 300
global_opt.showmatch = true
global_opt.ignorecase = true
global_opt.smartcase = true
global_opt.mouse = 'a'
global_opt.syntax = 'on'



vim["softtabstop"] = 2
vim.o["shiftwidth"] = 2
vim.o["tabstop"] = 2

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

