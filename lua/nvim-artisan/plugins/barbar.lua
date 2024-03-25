local installed, barbar = pcall(require, "barbar")

if not installed then
  return
end

barbar.setup({
  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = true,
  -- Enable/disable icons
  icons = {
    inactive = {
      separator = {
        left = "▎",
      }
    },
    separator = {
      left = "▎",
    },
    pinned = {
      button = "車",
      filename = true,
    },
    button = "",
    modified = {
      button = "●",
    },
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
      [vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
      [vim.diagnostic.severity.INFO] = { enabled = true, icon = "" },
      [vim.diagnostic.severity.HINT] = { enabled = true, icon = "󰌶" },
    },
  },
  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,
  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,
  -- Sets the maximum buffer name length.
  maximum_length = 30,
  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    NvimTree = true,
  },
})
