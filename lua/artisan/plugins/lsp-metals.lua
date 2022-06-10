local metals = require("metals")
MetalsConfig = metals.bare_config()
MetalsConfig.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  serverVersion = "0.11.2",
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
MetalsConfig.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

MetalsConfig.on_attach = function (client, bufnr)
    require("metals").setup_dap()
--    metals.setup_dap()
end

vim.cmd
[[
  augroup lsp
    au!
    au FileType java,scala,sbt lua require("metals").initialize_or_attach(MetalsConfig)
  augroup end
]]
