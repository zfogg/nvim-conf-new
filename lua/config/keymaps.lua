-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":")

-- FIXME: make this flash the screen when i save maybe with operator-flashy or something
vim.keymap.set("n", "<leader>w", "<cmd>silent w<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>") -- INFO: set by vim-bbye
vim.keymap.set(
  "n",
  "<leader>wq",
  ":normal " .. vim.g.mapleader .. "w" .. vim.g.mapleader .. "q<cr>",
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>c<space>", "<Plug>NERDCommenterToggle")
vim.keymap.set("x", "<leader>c<space>", "<Plug>NERDCommenterToggle")

--vim.keymap.set("n", "<leader>n<space>", "<cmd>Neotree toggle reveal show<cr>")

-- Telescope
--vim.keymap.set("n", "<c-t><c-t>", ":Telescope builtin<cr>", { noremap = true, silent = true })

-- Find files
vim.keymap.set("n", "<c-t><c-f>", ":Telescope find_files<cr>", { noremap = true, silent = true })
--vim.keymap.set("n", "<leader><c-f>", ":Telescope find_files<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-t>g", ":Telescope git_files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-g>", ":Telescope git_files<cr>", { noremap = true, silent = true })

-- Grep live
vim.keymap.set("n", "<c-t>f", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-f>", ":Telescope live_grep<cr>", { noremap = true, silent = true })

-- Frequent files
vim.keymap.set("n", "<C-t>p", function()
  require("telescope").extensions.frecency.frecency({ workspace = "CWD" })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", function()
  require("telescope").extensions.frecency.frecency({ workspace = "CWD" })
end, { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set("n", "<c-t>l", ":Telescope diagnostics<cr>", { noremap = true, silent = true })
--vim.keymap.set("n", "<c-l>", ":Telescope diagnostics<cr>", { noremap = true, silent = true })

vim.cmd([[
inoremap <C-c> <Esc>

" Tabs and splits. {{{
    nnoremap <Leader><C-t> :tabnew<CR>
    nnoremap <Leader>x     :tabclose<CR>
    nnoremap <Leader>j     :tabprevious<CR>
    nnoremap <Leader>k     :tabnext<CR>
    " Resize splits.
    nnoremap <S-Up>    5<C-W>+
    nnoremap <S-Down>  5<C-W>-
    nnoremap <S-Right> 5<C-W>>
    nnoremap <S-Left>  5<C-W><
    nnoremap   <Up>     <C-W>+
    nnoremap   <Down>   <C-W>-
    nnoremap   <Right>  <C-W>>
    nnoremap   <Left>   <C-W><
" }}}

" Et cetera. {{{
    " Enter Replace mode from Visual mode.
    vnoremap R r<Space>R

    " Don't let `single-repeat` disturb the cursor's location.
    "map . .`[

    " Delete trailing whitespace.
    nnoremap <Leader>S :call z#util#TrimWhitespace()<CR>

    " Fixes for display glitches.
    nnoremap <silent> <Leader><Space><Space> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>,<Space>
    nnoremap <Leader>rd :redraw!<CR>

    " Set the background to transparent.
    "nnoremap <Leader>bg :hi Normal ctermbg=NONE<CR>

    " Change to the directory of the current buffer's file.
    "nnoremap <Leader>lcd :lcd %:p:h<BAR>pwd<CR>
    nnoremap <Leader>cd  :cd  %:p:h<BAR>pwd<CR>

    " INFO: https://github.com/markonm/traces.vim#neovim-v023
    if exists('&inccommand')
        set inccommand=nosplit
    endif
" }}}
]])
-- TODO:
-- ctrl-c to clear flash.nvim searches
-- ,<space> to clear comments
