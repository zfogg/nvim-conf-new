-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.relativenumber = false

vim.g.mapleader = ","
vim.g.maplocalleader = "//"

vim.opt.shell = "C:\\WINDOWS\\system32\\wsl.exe -d Arch -u loomen --cd " .. vim.fn.getcwd()
--vim.g.terminal_emulator = "powershell"
