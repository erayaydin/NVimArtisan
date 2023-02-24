return function(lspconfig, before, capabilities)
    local on_attach = function(client, bufnr)
        before(client, bufnr)
    end

    lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            },
        },
    })
end
