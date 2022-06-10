local installed, lspconfig = pcall(require, "lspconfig")
if not installed then
    return
end

lspconfig.pyright.setup {}
lspconfig.yamlls.setup {
    settings = {
        yaml = {
            customTags = {
                "!Equals sequence", "!FindInMap sequence", "!GetAtt scalar", "!GetAtt", "!GetAZs scalar", "!ImportValue scalar", "!Join sequence scalar", "!Ref scalar", "!Select sequence", "!Split sequence", "!Sub scalar", "!And sequence", "!Not sequence", "!Equals sequence", "!Sub sequence", "!ImportValue scalar", "!If sequence"
            }
        }
    }
}
lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                }
            }
        }
    }
}
lspconfig.dockerls.setup {}
lspconfig.bashls.setup {}
lspconfig.phpactor.setup {}
