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

-- Temporary
-- @see https://github.com/jay-babu/mason-nvim-dap.nvim/issues/124
---@diagnostic disable-next-line: undefined-field
dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}
