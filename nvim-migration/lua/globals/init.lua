local global_opt = vim.opt_global
local opt = vim.opt

opt.smartindent = true
global_opt.completeopt = { "menu", "noinsert", "noselect" }
global_opt.hidden = true
global_opt.termguicolors = true
global_opt.showtabline = 1
global_opt.updatetime = 300
global_opt.showmatch = true
global_opt.ignorecase = true
global_opt.syntax = 'on'
global_opt.mouse = 'a'
global_opt.shortmess:remove("F"):append("c")

vim["softtabstop"] = 2
vim.o["shiftwidth"] = 2
vim.o["tabstop"] = 2

vim.wo.number = true
vim.wo.cursorline = true
vim.wo.relativenumber = true
