local installed, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installed then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup({
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    })
    vim.cmd [[ do User LspAttachBuffers ]]
end)


