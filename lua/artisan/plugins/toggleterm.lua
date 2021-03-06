local installed, toggle_term = pcall(require, "toggleterm")
if not installed then
    return
end

toggle_term.setup {
    open_mapping = "<c-t>",
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    float_opts = {
        border = "curved",
        width = 120,
        height = 40,
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
}

-- Disable cursorline on terminal
vim.cmd("autocmd WinEnter,BufEnter * if &ft is \"toggleterm\" | set nocursorline | else | set cursorline | endif")


