local M = {}

local builtins = require("nvim-artisan.utils.builtins")
local plugin_loader = require("nvim-artisan.plugin-loader")

function M:run()
  -- Set options
  require("nvim-artisan.options")

  -- Initialize plugin loader
  plugin_loader.init()

  -- Load plugins
  plugin_loader.load(require("nvim-artisan.plugins"))

  -- Set mappings
  require("nvim-artisan.mappings")
end

return M
