local installed, wk = pcall(require, "which-key")
if not installed then
  return
end

wk.setup({
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  keys = {
    scroll_down = '<c-d>',
    scroll_up = '<c-u>',
  },
  replace = {
    key = {
      { "<SPACE>", "SPC" },
      { "<LEADER>", "LEA" },
      { "<CR>", "ENT" },
      { "<TAB>", "TAB" },
      { "<A>", "ALT" },
      { "<S>", "SHI" },
      { "<C>", "CTR" },
      { "<D>", "CMD" },
    },
  },
  win = {
    border = "single",
  },
})
