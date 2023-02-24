return function(lspconfig, before, capabilities)

    local on_attach = function(client, bufnr)
        before(client, bufnr)
    end

    lspconfig.phpactor.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
        },
    })
end
