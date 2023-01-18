local dap = require("dap")

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("XDG_DATA_HOME") .. "/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for XDebug",
        hostname = "0.0.0.0",
        port = 9003,
        log = true,
        stopOnEntry = true,
        serverSourceRoot = '/var/www/html/',
        localSourceRoot = '/Users/eray/Code/TestingEnv/PHP/laravel-app/',
    },
}
