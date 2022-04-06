-- Aliases
local opt = vim.opt

-- Decrease time of update (for completion menu)
-- Default: 4000
opt.updatetime = 300
vim.g.cursorhold_updatetime = 100

-- Print the line numbers
-- Default: false
opt.number = true

-- Minimal number of columns for the line number
-- Default: 4
opt.numberwidth = 2

-- Show the line number relative to the line with the cursor
-- Default: false
opt.relativenumber = true

-- Always draw the signcolumn with fixed space
-- Default: auto
opt.signcolumn = "yes:3"

-- Don't show mode
-- Default: true
opt.showmode = false

-- Enable 24-bit RGB color
-- Default: false
opt.termguicolors = true

-- Enable clipboard
-- Default: ""
opt.clipboard = "unnamedplus"

-- Enable mouse in all modes
-- Default: ""
opt.mouse = "a"

-- Enable cursor line
-- Default: false
opt.cursorline = true

-- Number of spaces that a <Tab> counts for
-- Default: 8
opt.tabstop = 4

-- Number of spaces to use for each step of indent
-- Default: 8
opt.shiftwidth = 4

-- Enable smart autoindenting when starting a new line
-- Default: false
opt.smartindent = true

-- Enable smart search case
-- Default: false
opt.smartcase = true

-- Default: false
opt.expandtab = true

-- Default: false
opt.smarttab = true

-- Highlight previous search matches
-- Default: true
opt.hlsearch = true

-- Highlight matches when typing
-- Default: true
opt.incsearch = true

-- Ignore case in search patterns
-- Default: false
opt.ignorecase = true

-- Set terminal bi-directional
-- Default: false
opt.termbidi = true

-- Allow backspacing
-- Default: "indent,eol,start"
opt.backspace = "indent,eol,start"

-- Splitting a window will put the new window below
-- Default: false
opt.splitbelow = true

-- Splitting a window will put the new window right
-- Default: false
opt.splitright = true

-- Enable ruler and statusline
-- Default: true
opt.ruler = true

-- Time in milliseconds to wait for a key
-- Default: 50
opt.ttimeoutlen = 20

-- Time in milliseconds to wait for a mapped
-- Default: 1000
opt.timeoutlen = 1000

-- Completion menu options
-- Default: "menu,preview"
opt.completeopt = "menuone,noselect"

-- Set line number for help files
vim.cmd
[[
augroup help_config
  autocmd!
  autocmd FileType help :set number
augroup END
]]

-- Auto open nvim-tree when directory given,
-- if not argument given open dashboard
vim.cmd
[[
if index(argv(), ".") >= 0
  autocmd VimEnter * NvimTreeOpen
  bd1
elseif len(argv()) == 0
  autocmd VimEnter * Dashboard
endif
]]

-- Statusline hide file types and buffer types
statusline_hide = {
  "dashboard",
  "TelescopePrompt",
  "TelescopeResults",
  "terminal",
  "toggleterm"
}

-- TODO: Move this function to the `utils.lua` file.
function hide_statusline(types)
  for _,type in pairs(types) do
    if vim.bo.filetype == type or vim.bo.buftype == type then
      opt.laststatus = 0
      opt.ruler = false
      opt.cursorline = false
      break
    else
      opt.laststatus = 2
      opt.ruler = true
      opt.cursorline = true
    end
  end
end

vim.cmd("autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua hide_statusline(statusline_hide)")
