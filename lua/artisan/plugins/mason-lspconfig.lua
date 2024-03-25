local installed, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not installed then
  return
end

local function symbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

symbol("Error", "")
symbol("Info", "")
symbol("Hint", "")
symbol("Warn", "")

vim.diagnostic.config({
  virtual_text = {
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "cssls",
    "phpactor",
    "tailwindcss",
    "yamlls",
    "docker_compose_language_service",
  }
})

mason_lspconfig.setup_handlers({
  -- Automatic server handler
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
  -- Manual specific language servers
  ["lua_ls"] = function()
    require("artisan.lsp.lua-ls")
  end,
  ["jsonls"] = function()
    require("artisan.lsp.jsonls")
  end,
  ["phpactor"] = function()
    require("artisan.lsp.phpactor")
  end,
})
