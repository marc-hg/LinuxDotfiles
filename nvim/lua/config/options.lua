-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable format on save
vim.g.autoformat = false

-- Use tabs instead of spaces
vim.opt.expandtab = false
vim.opt.tabstop = 1
vim.opt.shiftwidth = 1
vim.opt.softtabstop = 1

-- Disable swap files
vim.opt.swapfile = false

-- LSP timeout settings for large files
vim.g.lsp_timeout = 30000 -- 30 seconds timeout

-- Load formatting configuration
require("config.formatting")
