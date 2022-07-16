local installed, metals = pcall(require, "metals")

if not installed then
    return
end

local config = metals.bare_config()
config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

config.on_attach = function()
  require("metals").setup_dap()
end

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(config)
  end,
  group = nvim_metals_group,
})
