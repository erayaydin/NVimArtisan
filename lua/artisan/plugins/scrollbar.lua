local colors = require("tokyonight.colors").setup({})
local installed, scrollbar = pcall(require, "scrollbar")

if not installed then
    return
end

---@diagnostic disable-next-line: undefined-field
scrollbar.setup({
  hide_if_all_visible = true,
    excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "NvimTree",
    },
    handle = {
        color = colors.border_highlight,
    },
    marks = {
        Search = { color = colors.bg_statusline },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.info },
    },
})
