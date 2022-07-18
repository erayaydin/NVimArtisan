local installed, toggleterm = pcall(require, "toggleterm")

if not installed then
    return
end

toggleterm.setup({
    open_mapping = "<c-t>",
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        width = 120,
        height = 40,
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

-- Disable cursorline on terminal
vim.cmd("autocmd WinEnter,BufEnter * if &ft is \"toggleterm\" | set nocursorline | else | set cursorline | endif")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local btm = Terminal:new({ cmd = "btm", hidden = true, direction = "float" })

function _G.lazygit_toggle()
    lazygit:toggle()
end

function _G.btm_toggle()
    btm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>lua btm_toggle()<CR>", {noremap = true, silent = true})
