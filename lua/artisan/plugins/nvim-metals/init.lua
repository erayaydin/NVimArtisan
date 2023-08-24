local installed, metals = pcall(require, "metals")

if not installed then
    return
end

local config = metals.bare_config()
config.settings = {
  showImplicitArguments = true,
  sbtScript = "/usr/bin/sbt -ivy /home/eray/.local/share/ivy2 -sbt-dir /home/eray/.local/share/sbt",
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

config.capabilities = require("cmp_nvim_lsp").default_capabilities()

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
