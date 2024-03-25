local installed, lspconfig = pcall(require, 'lspconfig')

if not installed then
  return
end

lspconfig.phpactor.setup({
  filetypes = { "php", "blade" },
  root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  },
})
