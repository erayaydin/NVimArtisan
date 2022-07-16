local installed, _ = pcall(require, "dap")

if not installed then
    return
end

vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "DiagnosticSignHint",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "DiagnosticSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "DiagnosticSignInformation",
})

require("artisan.plugins.dap.python")
