local installed, colorizer = pcall(require, "colorizer")

if not installed then
    return
end

colorizer.setup({
    "*",
    css = { rgb_fn = true },
}, { mode = "background" })
