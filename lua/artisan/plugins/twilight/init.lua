local installed, twilight = pcall(require, "twilight")

if not installed then
    return
end

twilight.setup({
    dimming = {
        alpha = 0.25,
    },
})
