local installed, bufferline = pcall(require, "bufferline")
if not installed then
    return
end

bufferline.setup({
    options = {
        numbers = function(opts)
            return string.format("%s", opts.id)
        end,
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            },
            {
                filetype = "vista",
                text = "LSP Tags",
            }
        }
    }
})

