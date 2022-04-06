local installed, gitsigns = pcall(require, "gitsigns")
if not installed then
    return
end

gitsigns.setup({
    signcolumn = true,
    numhl = false,
    attach_to_untracked = true,
    current_line_blame = true,
    sign_priority = 1,
    update_debounce = 100,
    max_file_length = 40000,
    keymaps = {
        noremap = true,
        buffer = true,
    }
})

