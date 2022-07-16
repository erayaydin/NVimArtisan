return function(lspconfig, before, capabilities)

    local on_attach = function(client, bufnr)
        before(client, bufnr)
        print("Python attached!")
    end

    lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
