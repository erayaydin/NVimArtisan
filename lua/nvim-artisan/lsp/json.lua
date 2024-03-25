local installed, lspconfig = pcall(require, 'lspconfig')
if not installed then
  return
end

local schemastore_installed, schemastore = pcall(require, 'schemastore')
if not schemastore_installed then
  return
end

lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
})
