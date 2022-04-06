local installed, dap = pcall(require, "dap")
if not installed then
    return
end

local dap_install = require("dap-install")
dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})
local debuggers = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(debuggers) do
    dap_install.config(debugger)
end

require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    sidebar = {
        elements = {
            {
                id = "scopes",
                size = 0.25,
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "left",
    },
    tray = {
        elements = { "repl" },
        size = 10,
        position = "bottom",
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})

-- Set fallback terminal command
dap.defaults.fallback.terminal_win_cmd = "ToggleTerm"

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

-- Define signs
vim.fn.sign_define("DapBreakpoint", {text="● ", texthl="DiagnosticSignError", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointCondition", {text="● ", texthl="DiagnosticSignWarn", linehl="", numhl=""})
vim.fn.sign_define("DapLogPoint", {text="● ", texthl="DiagnosticSignInfo", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text="→ ", texthl="DiagnosticSignWarn", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointReject", {text="●" , texthl="DiagnosticSignHint", linehl="", numhl=""})

