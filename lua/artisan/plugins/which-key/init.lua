local installed, wk = pcall(require, "which-key")
if not installed then
    return
end

wk.setup({
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
    },
    popup_mappings = {
        scroll_down = '<c-d>',
        scroll_up = '<c-u>',
    },
    key_labels = {
        ["<space>"] = "SPC",
        ["<leader>"] = "LEA",
        ["<cr>"] = "ENT",
        ["<tab>"] = "TAB",
        ["<a>"] = "ALT",
        ["<s>"] = "SHI",
        ["<c>"] = "CTR",
    },
    window = {
        border = "single",
    },
})
