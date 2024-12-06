local installed, gitsigns = pcall(require, "gitsigns")

if not installed then
  return
end

gitsigns.setup({
  signs = {
    add          = { text = '│', },
    change       = { text = '│', },
    delete       = { text = '_', },
    topdelete    = { text = '‾', },
    changedelete = { text = '~', },
  },
  current_line_blame = true,
})
