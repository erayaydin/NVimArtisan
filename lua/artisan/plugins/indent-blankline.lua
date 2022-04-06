local installed, indent_blankline = pcall(require, "indent_blankline")
if not installed then
    return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
    show_end_of_line = true,
    char = "▏",
    filetype_exclude = {
        "help",
        "terminal",
        "packer",
        "dashboard",
        "lsp-installer",
        "lspinfo",
        "vista_kind",
    },
    buftype_exclude = {
        "terminal",
    },
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
    space_char_blankline = " ",
})


