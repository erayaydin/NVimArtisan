local colors = require("tokyonight.colors").setup({})
local installed, scrollbar = pcall(require, "scrollbar")

if not installed then
    return
end

scrollbar.setup({
    excluded_buftypes = {},
    excluded_filetypes = {
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
