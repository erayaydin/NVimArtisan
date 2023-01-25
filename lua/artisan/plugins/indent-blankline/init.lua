local installed, indent_blankline = pcall(require, "indent_blankline")

if not installed then
    return
end

indent_blankline.setup({
    filetype_exclude = {
        "help",
        "terminal",
        "packer",
        "lspinfo",
        "vista_king",
        "alpha",
        'mason',
    },
    buftype_exclude = {
        "terminal",
    },
    show_end_of_line = true,
    space_char_blankline = " ",
    char = "▏",
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
})

