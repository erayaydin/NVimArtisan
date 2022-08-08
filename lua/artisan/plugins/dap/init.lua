local installed, dap = pcall(require, "dap")

if not installed then
    return
end

vim.fn.sign_define("DapBreakpoint", {
    text = "●",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapBreakpointCondition", {
    text = "●",
    texthl = "DiagnosticSignWarn",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapLogPoint", {
    text = "●",
    texthl = "DiagnosticSignInfo",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapBreakpointRejected", {
    text = "●",
    texthl = "DiagnosticSignHint",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "DiagnosticSignInfo",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "DiagnosticSignInfo",
})

require("artisan.plugins.dap.python")
require("artisan.plugins.dap.scala")
require("artisan.plugins.dap.php")
