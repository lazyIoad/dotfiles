-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.autoindent = true
-- opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = false
opt.expandtab = true
opt.formatoptions = "jcroqlnt"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.list = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2

opt.shortmess = ""
opt.shortmess:append({C = true, I = true, W = true, c = true})
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.wrap = false
return nil
