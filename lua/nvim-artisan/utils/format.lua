local plugin_loader_installed, plugin_loader = pcall(require, "nvim-artisan.plugin-loader")

local M = {}

function M.formatexpr()
  if (plugin_loader_installed and plugin_loader.has("conform.nvim")) then
    return require("conform").formatexpr()
  end
  return vim.lsp.formatexpr({ timeout_ms = 3000 })
end

return M
