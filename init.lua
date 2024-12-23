require "mappings"
require "commands"
require "options"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" 

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local plugins = require "plugins"

require("lazy").setup(plugins, require "lazy_config")
vim.cmd "syntax enable"

vim.cmd "colorscheme nekonight-palenight"
require("lazygrep").setup()
