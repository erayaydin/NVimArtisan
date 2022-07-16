local installed, autopairs = pcall(require, "nvim-autopairs")

if not installed then
    return
end

autopairs.setup({
    disable_filetype = { "TelescopePrompt" },
})
