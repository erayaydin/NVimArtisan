local installed, carbon = pcall(require, "carbon-now")

if not installed then
    return
end

carbon.setup({
    -- FIXME: check darwin / linux / windows
    open_cmd = "open -u",
    options = {
        theme = "monokai",
        window_theme = "none",
        font_family = "Hack",
        font_size = "18px",
        bg = "gray",
        line_numbers = true,
        line_height = "133%",
        drop_shadow = false,
        drop_shadow_offset_y = "20px",
        drop_shadow_blur = "68px",
        width = "680",
        watermark = false,
    },
})
