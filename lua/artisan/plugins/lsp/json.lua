return function(lspconfig, before, capabilities)
    print("jsonls registered!")
    local on_attach = function(client, bufnr)
        print("Json attaching!")
        before(client, bufnr)
        print("Json attached!")
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
