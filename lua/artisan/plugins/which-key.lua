local installed, wk = pcall(require, "which-key")
if not installed then
    return
end

-- Colorscheme
wk.register({
  t = {
    name = "Theme",
    h = { ":Telescope colorscheme<CR>", "Find Colorscheme" },
    p = { ":Telescope colorscheme enable_preview=true<CR>", "Find Colorscheme with Previwer" },
  },
  b = {
      name = "Buffer",
      c = { ":BufferLinePickClose<CR>", "Close Buffer" },
      e = { ":noh<CR>", "Erase Search Highlights" },
      l = { ":BufferLineMoveNext<CR>", "Move Buffer Right" },
      h = { ":BufferLineMovePrev<CR>", "Move buffer Left" },
      n = { ":DashboardNewFile<CR>", "New Buffer"},
      r = { ":Neoformat<CR>", "Format Buffer" },
      m = { ":TZFocus<CR>", "Maximize Current Buffer" },
  },
  p = {
    name = "Packer",
    i = { ":PackerInstall<CR>", "Install packages" },
    u = { ":PackerUpdate<CR>", "Update packages" },
    r = { ":PackerClean<CR>", "Uninstall unnecessary packages" },
    s = { ":PackerSync<CR>", "Sync packages" },
    c = { ":PackerClean<CR>", "Compile packages" },
  },
  n = {
    name = "NvimTree",
    t = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
    f = { ":NvimTreeFocus<CR>", "Focus on NvimTree" },
  },
  f = {
    name = "Find",
    w = { ":Telescope live_grep<CR>", "Live Grep" },
    f = { ":Telescope find_files<CR>", "Find Files" },
    o = { ":Telescope oldfiles<CR>", "Old Files" },
    d = { ":Telescope find_directories<CR>", "Find Directory" },
    p = { ":Telescope media_files<CR>", "Media File" },
    b = { ":Telescope buffers<CR>", "Buffers" },
    h = { ":Telescope help_tags<CR>", "Help File" },
    B = { ":DashboardJumpMarks<CR>", "Find BookMark" },
  },
  g = {
    name = "Git",
    s = { ":Telescope git_status<CR>", "Status + Git Diff" },
    c = { ":Telescope git_commits<CR>", "Commit History" },
    C = { ":Telescope git_bcommits<CR>", "Buffer Commit History" },
    b = { ":Telescope git_branches<CR>", "Branches history" },
    k = { ":Gitsigns prev_hunk<CR>", "Next Hunk" },
    j = { ":Gitsigns next_hunk<CR>", "Prev Hunk" },
    p = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" },
    r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
    R = { ":Gitsigns reset_buffer<CR>", "Reset Buffer" },
    d = { ":Gitsigns diffthis<CR>", "Git Diff" },
    l = { ":Gitsigns blame_line<CR>", "Blame For Current Line"},
    S = { ":Gitsigns stage_hunk<CR>", "Stage Hunk"},
    u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},
  },
}, { prefix = "<leader>" })

wk.setup({
    key_labels = {
    ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    ["<cr>"] = "ENT",
    ["<tab>"] = "TAB",
    ["<a>"] = "ALT",
    ["<s>"] = "SHI",
    ["<c>"] = "CTR",
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  ignore_missing = false,
})

