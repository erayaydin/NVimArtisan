local installed, lualine = pcall(require, "lualine")
if not installed then
    return
end

lualine.setup({
    options = {
        theme = "auto",
        disabled_filetypes = {
            "toggleterm",
            "NvimTree",
            "vista_kind",
            "dapui_scopes",
            "dapui_breakpoints",
            "dapui_stacks",
            "dapui_watches",
            "dap-repl"
        },
        section_separators = { left = " ", right = " " },
        component_separators = { left = "│", right = "│" },
    },
    extensions = { "fugitive" },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            { "branch" },
            {
                "diff",
                symbols = {
                    added = "  ",
                    modified = "柳",
                    removed = " "
                },
            },
            {"diagnostics"}
        },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
})


