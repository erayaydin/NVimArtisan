local installed, lualine = pcall(require, "lualine")

if not installed then
    return
end

lualine.setup({
    options = {
        theme = "tokyonight",
        disabled_filetypes = {
            "NvimTree",
            "vista_kind",
            "alpha",
            "terminal",
            "toggleterm",
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            { "branch" },
            {
                "diff",
                symbols = {
                    added = "",
                    modified = "柳",
                    removed = "",
                },
            },
            { "diagnostics" },
        },
        lualine_c = { "filename" },

        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    extensions = {
        "fugitive", "nvim-tree", "quickfix",
    },
})
