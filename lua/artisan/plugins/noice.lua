local installed, noice = pcall(require, "noice")

if not installed then
  return
end

noice.setup({
  lsp = {
        hover = {
          silent = true,
        },
      },
      presets = {
        lsp_doc_border = true,
      },
})
