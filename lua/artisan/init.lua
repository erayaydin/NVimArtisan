local M = {}

local builtins = require('artisan.utils.builtins')
local plugin_loader = require('artisan.plugin-loader')

function M:run()
    -- Set options
    require("artisan.options")

    -- Disable builtin providers and plugins
    builtins.disable_plugins()
    builtins.disable_providers()

    -- Initialize plugin loader
    plugin_loader.init()

    -- Set mappings
    require("artisan.mappings")

    -- Load plugins
    plugin_loader.load(require('artisan.plugins'))
end

return M