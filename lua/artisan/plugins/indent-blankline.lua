local installed, ibl = pcall(require, "ibl")

if not installed then
    return
end

ibl.setup({
    scope = {
        show_end = true,
    },
    exclude = {
        filetypes = {
            "help",
            "terminal",
            "packer",
            "lspinfo",
            "vista_king",
            "alpha",
            'mason',
        },
        buftypes = {
            "terminal",
        },
    },
    indent = {
        char = "▏",
    },
    whitespace = {
        remove_blankline_trail = false,
    },
})

