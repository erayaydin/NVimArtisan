return function(lspconfig, before, capabilities)

    local on_attach = function(client, bufnr)
        before(client, bufnr)
    end

    local util = require "lspconfig/util"

    lspconfig.gopls.setup({
        cmd = {"gopls", "serve"},
        filetypes = {"go", "gomod"},
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
