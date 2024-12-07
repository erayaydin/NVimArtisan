-- Aliases
local opt = vim.opt
local g = vim.g
local env = vim.env

-- Show statusline only for last window
-- Default: 2
opt.laststatus = 3

-- Don't show mode
-- Default: true
opt.showmode = false

-- Update title of the window
-- Default: false
opt.title = true

-- Enable clipboard if not in SSH
-- Default: ""
opt.clipboard = env.SSH_TTY and "" or "unnamedplus"

-- Enable cursor line
-- Default: false
opt.cursorline = true

-- Default: false
opt.expandtab = true

-- Default: false
opt.smarttab = true

-- Round indent to multiple of 'shiftwidth'
-- Default: false
opt.shiftround = true

-- Number of spaces to use for each step of indent
-- Default: 8
opt.shiftwidth = 2

-- Enable smart autoindenting when starting a new line
-- Default: false
opt.smartindent = true

-- Spell languages
-- Default: "en"
-- A comma-separated list of word list names
opt.spelllang = { "en" }

-- Fill with space for empty lines at the end of abuffer
-- Default: { eob = "~", ... }
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Sets the fold level
-- Default: 0
opt.foldlevel = 99

-- The kind of folding used for the current window
-- Default: "manual"
opt.foldmethod = "expr"

-- It is evaluated for each line to obtain its fold level
-- Default: "0"
opt.foldexpr = "v:lua.require'nvim-artisan.util.ui'.foldexpr()"

-- An expression which is used to specify the text displayed for a closed fold
-- Default: "foldtext()"
opt.foldtext = ""

-- Expression which is evaluated to format a range of lines
-- Default: ""
opt.formatexpr ="v:lua.require'nvim-artisan.util.format'.formatexpr()"

-- :see fo-table
-- Default: "tcqj"
opt.formatoptions = "jcroqlnt"

-- Program to use for the :grep command
opt.grepprg = "rg --vimgrep"

-- Format to recognize for the ":grep" command output
-- Default: "%f:%l:%m,%f:%l%m,%f  %l%m"
opt.grepformat = "%f:%l:%c:%m"

-- Ignore case in search patterns
-- Default: false
opt.ignorecase = true

-- Shows the effects of commands with preview flag
-- Default: "nosplit"
opt.inccommand = "nosplit"

-- Behaviors of the jumplist
-- Default: "clean"
opt.jumpoptions = "view"

-- Enable smart search case
-- Default: false
opt.smartcase = true

-- Enable mouse in all modes
-- Default: ""
opt.mouse = "a"

-- Wrap long lines
-- Default: false
opt.linebreak = true

-- Wrap long lines virtually
-- Default: true
opt.wrap = false

-- Scrolling works with screen lines
-- Default: false
opt.smoothscroll = true

-- Print the line numbers
-- Default: false
opt.number = true

-- Minimal number of columns for the line number
-- Default: 4
opt.numberwidth = 2

-- Show the line number relative to the line with the cursor
-- Default: false
opt.relativenumber = true

-- Enable ruler and statusline
-- Default: true
opt.ruler = true

-- Minimal number of screen lines to keep above and below the cursor
-- Default: 0
opt.scrolloff = 4

-- The minimal number of screen columns to keep
-- Default: 0
opt.sidescrolloff = 8

-- Changes the effect of the :mksession command
-- Default: "blank,buffers,curdir,folds,help,tabpages,winsize,terminal"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Don't give some messages
-- Default: "ltToOCF"
opt.shortmess:append({ s = true, I = true, W = true, c = true, C = true })

-- Always draw the signcolumn with fixed space
-- Default: auto
opt.signcolumn = "yes:3"

-- Splitting a window will put the new window below
-- Default: false
opt.splitbelow = true

-- Splitting a window will put the new window right
-- Default: false
opt.splitright = true

-- Scroll behavior when opening, closing or resizing horizontal splits
-- Default: "cursor"
opt.splitkeep = "screen"

-- The content of the area to the side of a window
-- Default: ""
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]

-- Number of spaces that a <Tab> counts for
-- Default: 8
opt.tabstop = 2

-- Enable 24-bit RGB color
-- Default: false
opt.termguicolors = true

-- Time in milliseconds to wait for a mapped
-- Default: 1000
opt.timeoutlen = 300

-- Time in milliseconds to wait for a key
-- Default: 50
opt.ttimeoutlen = 20

-- Save undo history
-- Default: false
opt.undofile = true

-- Maximum number of changes that can be undone
-- Default: 1000
opt.undolevels = 10000

-- Decrease time of update (CursorHold + swap)
-- Default: 4000
opt.updatetime = 200

-- Change behavior of virtual editin
-- Default: ""
opt.virtualedit = "block"

-- Completion mode
-- Default: "full"
opt.wildmode = "longest:full,full"

-- Enable move cursor on h,l,left,right
-- Default: "b,s"
opt.whichwrap:append "<>[]hl"

-- Highlight previous search matches
-- Default: true
opt.hlsearch = true

-- Highlight matches when typing
-- Default: true
opt.incsearch = true

-- Allow backspacing
-- Default: "indent,eol,start"
opt.backspace = "indent,eol,start"

-- Completion menu options
-- Default: "menu,preview"
opt.completeopt = "menu,menuone,noselect"

-- Hide conceal syntax attribute
-- Default: 0
opt.conceallevel = 2

-- Show space and eol characters
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

-- Enable pseudo-transparency for the popup-menu
-- Default: 0
opt.pumblend = 10

-- Maximum number of items to show in the popup menu
-- Default: 0
opt.pumheight = 10

-- Decrease time of cursorhold update
g.cursorhold_updatetime = 100

-- Set leader key as <space>
-- Default: '\'
g.mapleader = " "
