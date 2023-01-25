local M = {}

function M:run()
    -- Set options
    require("artisan.options")

    -- Disable builtin providers and plugins
    require("artisan.builtin")

    -- Set mappings
    require("artisan.mappings")

    -- Install plugin loader and plugins
    require("artisan.plugin-loader")

    -- Show notification
    vim.notify_once("NVimArtisan v0.3.0 loaded!", "info", {
        title = "NVimArtisan",
        timeout = 500,
    })
end

return M