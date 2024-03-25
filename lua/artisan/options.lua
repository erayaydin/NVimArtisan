-- Aliases
local opt = vim.opt
local g = vim.g

-- Show statusline only for last window
-- Default: 2
opt.laststatus = 3

-- Don't show mode
-- Default: true
opt.showmode = false

-- Update title of the window
-- Default: false
opt.title = true

-- Enable clipboard
-- Default: ""
opt.clipboard = "unnamedplus"

-- Enable cursor line
-- Default: false
opt.cursorline = true

-- Default: false
opt.expandtab = true

-- Default: false
opt.smarttab = true

-- Number of spaces to use for each step of indent
-- Default: 8
opt.shiftwidth = 2

-- Enable smart autoindenting when starting a new line
-- Default: false
opt.smartindent = true

-- Fill with space for empty lines at the end of abuffer
-- Default: { eob = "~", ... }
opt.fillchars = { eob = " " }

-- Ignore case in search patterns
-- Default: false
opt.ignorecase = true

-- Enable smart search case
-- Default: false
opt.smartcase = true

-- Enable mouse in all modes
-- Default: ""
opt.mouse = "a"

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

-- Don't give search hit messages and intro
opt.shortmess:append "sI"

-- Always draw the signcolumn with fixed space
-- Default: auto
opt.signcolumn = "yes:3"

-- Splitting a window will put the new window below
-- Default: false
opt.splitbelow = true

-- Splitting a window will put the new window right
-- Default: false
opt.splitright = true

-- Number of spaces that a <Tab> counts for
-- Default: 8
opt.tabstop = 2

-- Enable 24-bit RGB color
-- Default: false
opt.termguicolors = true

-- Time in milliseconds to wait for a mapped
-- Default: 1000
opt.timeoutlen = 1000

-- Time in milliseconds to wait for a key
-- Default: 50
opt.ttimeoutlen = 20

-- Save undo history
-- Default: false
opt.undofile = true

-- Decrease time of update (CursorHold + swap)
-- Default: 4000
opt.updatetime = 300

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
opt.completeopt = "menuone,noselect"

-- Show space and eol characters
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

-- Decrease time of cursorhold update
g.cursorhold_updatetime = 100

-- Set leader key as <space>
-- Default: '\'
g.mapleader = " "
