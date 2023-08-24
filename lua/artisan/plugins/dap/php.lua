---@diagnostic disable-next-line: different-requires
local dap = require("dap")

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("XDG_STATE_HOME") .. "/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for XDebug",
        port = 9003,
        pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}"
        }
    },
}
