local installed, dapui = pcall(require, "dapui")

if not installed then
    return
end

---@diagnostic disable: missing-fields
dapui.setup({
    icons = {
      expanded = "▾",
      collapsed = "▸"
    },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = true,
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 10,
            position = "bottom",
        },
    },
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
})
