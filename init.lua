-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = ","

--vim.cmd([[
--:profile start profile.log
--:profile func *
--:profile file *
--echom "PROFILING"
--]])

require("zfogg")
require("config.lazy")
