local lsp = vim.lsp
local diagnostic = vim.diagnostic
local installed, lspconfig = pcall(require, "lspconfig")

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

diagnostic.config({
    virtual_text = {
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = "single",
})
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
    border = "single",
})

local cmp_installed, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local capabilities = {}

if cmp_installed then
    capabilities = cmp_nvim_lsp.default_capabilities()
end

local on_attach = function()
    print("Attached!")
end

require("artisan.plugins.lsp.lua")(lspconfig, on_attach, capabilities)
require("artisan.plugins.lsp.python")(lspconfig, on_attach, capabilities)
require("artisan.plugins.lsp.php")(lspconfig, on_attach, capabilities)
require("artisan.plugins.lsp.json")(lspconfig, on_attach, capabilities)
