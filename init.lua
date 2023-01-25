-- Start impatient ASAP
pcall(require, "impatient")

-- Check nvim version
if vim.fn.has('nvim-0.8') ~= 1 then
    error('Need NeoVim v0.8+')
end

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
