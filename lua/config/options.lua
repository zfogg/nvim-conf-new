-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.relativenumber = false

vim.g.mapleader = ","
vim.g.maplocalleader = "//"

-- {{
local o = vim.opt
o.number = true
o.numberwidth = 2

o.title = true
o.showtabline = 1 -- show buffer tabs when more than `n`
o.history = 2048 -- persist mode-cmdline history
o.visualbell = true
if vim.env.SHELL then
  o.shell = vim.env.SHELL
end
o.updatetime = 220
vim.g.netrw_dirhistmax = 0

o.exrc = true
o.secure = true

vim.o.sessionoptions = "curdir,"
  .. "tabpages,"
  .. "winsize,"
  .. "help,"
  .. "globals,"
  .. "skiprtp,"
  .. "folds,"
  .. "options,"
  .. "resize,"
  .. "winpos"

vim.cmd([[
set path=.,,**
let &cdpath = ','.substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')
set cdpath+=.,,**
]])

-- {{{ wild, undo, swap, backup
o.wildmenu = true
o.wildignorecase = true
--vim.o.wildchar = ("\t"):byte() // <tab> is the default plus this doesn't even work and throws an error
vim.o.wildmode = "longest:full,full"
o.wildignore:append({ "*.o", "*.obj", "*.so", "*.exe", "*.dll", "*.manifest", "*.dmg" })
o.wildignore:append({ "*.swp", "*.pyc", "*.class" })
o.wildignore:append({ "*.tar", "*.bz", "*.gz", "*.xz", "*.zip", "*.7z", "*.rar" })
o.wildignore:append({ "*/.git/*", "*/node_modules/*" })
o.wildignore:append({ "*.swc", "*.swc.old" })
o.wildignore:append({ "*.DS_Store" })
o.wildignore:append({ "*~", "~*" })

o.complete:append({ "i" })
o.complete:remove({ "*~", "~*" })
o.completeopt = "menu,menuone,preview"
o.conceallevel = 2
o.concealcursor = "nvic"

o.undofile = true

o.swapfile = true
o.backupdir:remove(".")
o.directory:remove(".")

vim.cmd([[
if has('wildignore')
  let s:backupskip_dirs = []
  for s:dir_name in split(&undodir, ',') + split(&directory, ',') + split(&backupdir, ',')
    call add(s:backupskip_dirs, fnamemodify(s:dir_name, ':p:h').'/*')
  endfor
  let &backupskip.=join(s:backupskip_dirs, ',')
endif
]])
-- }}} undo / redo, swap, backup

-- {{{ Moving around and editing
o.virtualedit = "all" -- Let cursor move past $ in command mode.
o.backspace:append({ "indent", "eol", "start" }) -- Allow backspacing over autoindent, EOL, and BOL.
o.autoindent = true -- Always set autoindenting on.
--o.lazyredraw = true -- For better macro performance.
o.lazyredraw = false -- For better UI performance
o.redrawtime = 1200 -- For better macro performance.
o.maxmempattern = 100000 -- For better macro performance.
o.ttimeoutlen = 130 -- Time (ms) for a key code sequence to complete.
-- }}} Moving around and editing

--o.cpo = "aABcdEefFIMnoPqRstWXZ+;_"

-- {{{ 'formatoptions'
--   default: "tcqj"
--   mine: "cjlnqrwo"
o.formatoptions:append("c") -- Autowrap comments using textwidth - :help fo-table
o.formatoptions:append("j") -- Delete comment character when joining commented lines
o.formatoptions:append("l") -- do not wrap lines that have been longer when starting insert mode already
o.formatoptions:append("n") -- Recognize numbered lists
o.formatoptions:append("q") -- Allow formatting of comments with "gq"
o.formatoptions:append("r") -- Insert comment leader after hitting <Enter>
o.formatoptions:append("w") -- A whitespace line ending indicates a continued paragraph.
o.formatoptions:remove("t") -- Don't wrap text using textwidth
o.formatoptions:append("o") -- Insert the current comment leader 'o' or 'O' in Normal mode.
-- }}} 'formatoptions'

-- {{{ Tiny aesthetic tweaks
o.cul = true
o.ruler = true -- Show the cursor position all the time.
o.scrolljump = 4 -- Scroll n lines at a time at bottom/top
o.scrolloff = 4 -- Keep n context lines above and below the cursor.
o.sidescroll = 1 -- FIXME
o.sidescrolloff = 8 -- FIXME
o.showmatch = true -- Briefly jump to a paren once it's balanced.
o.list = true -- Visually display tabs and trailing whitespace.
vim.cmd([[
set listchars =
  \eol:¬,
  \tab:→\ ,
  \trail:·,
  \extends:⟩,
  \precedes:⟨,
  \nbsp:␣
set fillchars =
  \vert:\ ,
  \stl:\ ,
  \stlnc:\ 
]])
-- }}} Tiny aesthetic tweaks

-- {{{ Whitespace
o.expandtab = true -- Use spaces, not tabs, for autoindent/tab key.
o.copyindent = true --
o.preserveindent = true --
o.tabstop = 2 -- <Tab> inserts n spaces.
o.softtabstop = 2 -- <BS> over an autoindent deletes both spaces.
o.shiftwidth = 0 -- An indent level is n spaces.
o.shiftwidth = 2 -- An indent level is n spaces.
o.shiftround = true -- Rounds indent to a multiple of shiftwidth.
o.wrap = false -- Don't wrap text.
o.linebreak = true -- Don't wrap textin the middle of a word.
o.wrapmargin = 0 -- Seriously, don't break lines.
o.textwidth = 0 -- Don't break lines.
o.showbreak = "↪\\" -- Visualize wrapped lines.
-- }}} Whitespace

-- {{{ Folding
o.foldenable = true
o.foldmethod = "syntax"
o.foldopen:append({ "percent", "quickfix", "tag", "undo" })
o.foldnestmax = 3
o.foldminlines = 3

vim.g.fastfold_skip_filetypes = {
  "taglist",
  "fern",
  "nerdtree",
  "help",
  "vim",
}
-- }}} Folding

-- {{{ Reading and writing.
o.autowrite = false -- Never write a file unless I request it.
o.autowriteall = false -- NEVER.
o.autoread = false -- Don't automatically re-read changed files.
o.modeline = true -- Allow vim options to be embedded in files.
o.modelines = 3 -- look in the first or last `n` lines.
o.ffs = { "unix", "mac", "dos" } -- Try recognizing dos, unix, and mac line endings.
-- }}}  Reading and writing.

-- shortmess {{{
vim.cmd([[
    " NOTE: Vim default "filnxtToOF"
    ":set shortmess=aOstTI " :help 'shortmess'
    "
    "set shm+=a  " shortcut for shm+=ailmnrwx
    "set shm-=O
    "set shm+=O
    "set shm+=s
    "set shm+=t
    "set shm+=T
    "set shm-=W
    "set shm-=A
    "set shm+=I
    "set shm+=c
    "set shm-=q
    "set shm-=F
]])
-- }}}

-- Messages, info, and statuses. {{{
o.confirm = true -- Y-N-C prompt if closing with unsaved changes.
o.showcmd = true -- Show incomplete normal mode commands as I type.
o.showmode = false -- Don't show the current editor mode in the cmd line.
o.report = 0 -- : commands always print changed line count.
o.ruler = true -- Show some info, even without statuslines.
o.laststatus = 2 -- Always show statusline, even if only 1 window.
-- }}}

-- {{{ Searching and Patterns
o.ignorecase = true -- Default to using case insensitive searches.
o.smartcase = true -- unless uppercase letters are used in the regex.
o.smarttab = true -- Handle tabs more intelligently.
o.smartindent = true -- Indent intelligently.
o.cindent = true -- Indent even more intelligently.
o.hlsearch = true -- Highlight searches by default.
o.incsearch = true -- Incrementally search while typing a /regex.
o.regexpengine = 1 -- Auto-switch regexp engines if workload hangs.

-- http://www.ascii-code.com/
--         '@'       == /[a-zA-Z]/ == filter(isalpha, $ascii_arr)
--         ,48-57,   == /[0-9]/    == filter(isdigit, $ascii_arr)
--         ,192-255, == /[À-ÿ]/    /* accented characters - extended ascii */
--         ,,,       == /,/
--         ,@-@,     == /@/
--         ,^,,      == /[^,]/
--         ,^<EOL>   == /\^/
--     NOTE: 'text-obj' patterns for 'word' and file /path
--
-- 'isfname' 'isf'  string
--   default: @,48-57,/,.,-,_,+,,,#,$,%,~,=
if vim.fn.has("unix") ~= 0 then
  o.isfname = "@,48-57,_,#,~,$,-,/,\\,.,+,,,%,="
end
--set isfname+=@,48-57,_,#,~,$,-,/,.,+,,,%,=

-- 'isident' 'isi'  string
--   default: @,48-57,_,192-255
o.isident:append({ "@", "48-57", "_", "192-255" })
-- 'iskeyword' 'isk'  string
--   default: @,48-57,_
--   custom:  @,48-57,_,192-255,:
--   ft=help: !-~,^*,^|,^",192-255
o.iskeyword:append({ "@", "48-57", "_", "192-255" })

if vim.fn.executable("rg") then
  vim.o.grepprg = "rg -H --vimgrep --context=0"
  vim.o.grepformat = "%f:%l:%c:%m"
else
  if vim.fn.has("unix") ~= 0 then
    vim.o.grepprg = "grep --color=never -e --exclude-dir .git -nrI $* . /dev/null"
  end
end

-- }}} Searching and Patterns

-- {{{ Syntax
vim.cmd([[
syntax sync minlines=16 maxlines=512 linebreaks=1
]])
o.synmaxcol = 700
-- }}} Syntax

-- {{{ Clipboard
if vim.fn.has("osx") ~= 0 then
  vim.g.clipboard = {
    name = "pbcopy",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy",
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste",
    },
    cache_enabled = 1,
  }
elseif vim.fn.has("unix") ~= 0 then
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard -in",
      ["*"] = "xclip -selection clipboard -in",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -out",
      ["*"] = "xclip -selection clipboard -out",
    },
    cache_enabled = 1,
  }
end
-- }}} Clipboard

-- {{{ Mouse stuff
-- INFO: https://www.iterm2.com/faq.html
if vim.fn.has("mouse_sgr") ~= 0 and vim.fn.has("ttymouse") ~= 0 then
  print("HAS TTYMOUSE")
  o.ttymouse = "sgr"
end
-- }}} Mouse stuff

-- }}

-- this doesn't work lol
--vim.opt.shell = "C:\\WINDOWS\\system32\\wsl.exe -d Arch -u loomen --cd " .. vim.fn.getcwd()
--vim.g.terminal_emulator = "powershell"
