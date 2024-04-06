local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
else
end
do end (vim.opt.rtp):prepend(lazypath)
local lazy = require("lazy")
local disabled_plugins = {"gzip", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin"}
return lazy.setup({performance = {rtp = {disabled_plugins = disabled_plugins}}, spec = {{import = "plugins"}}})
