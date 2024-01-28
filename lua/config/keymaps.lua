-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
print("still keymapping")
vim.g.mapleader = ","

vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<leader>w", ":w<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<cr>")

vim.keymap.set("n", "<leader>c<space>", "<Plug>NERDCommenterToggle")
vim.keymap.set("x", "<leader>c<space>", "<Plug>NERDCommenterToggle")

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
