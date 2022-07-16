local installed, devicons = pcall(require, "nvim-web-devicons")

if not installed then
    return
end

devicons.setup({
    override = {},
})
