metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  serverVersion = "0.11.2",
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

metals_config.on_attach = function (client, bufnr)
    require("metals").setup_dap()
end

vim.cmd
[[
  augroup lsp
    au!
    au FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)
  augroup end
]]
