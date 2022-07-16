local installed, bufferline = pcall(require, "bufferline")

if not installed then
    return
end

bufferline.setup({
    options = {
        --- @diagnostic disable-next-line: assign-type-mismatch
        numbers = function(opts)
            return string.format("%s", opts.id)
        end,
        --- @diagnostic disable-next-line: assign-type-mismatch
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
            },
            {
                filetype = "vista",
                text = "LSP Tags",
            },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
    },
})
