local M = {
  plugins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
  },
  providers = {
    "node",
    "perl",
    "python3",
    "ruby",
  },
}

local g = vim.g

function M.disable_plugins()
  for _, plugin in pairs(M.plugins) do
    M.disable_plugin(plugin)
  end
end

function M.disable_plugin(plugin)
  g["loaded_" .. plugin] = true
end

function M.disable_providers()
  for _, provider in ipairs(M.providers) do
    M.disable_provider(provider)
  end
end

function M.disable_provider(provider)
  g["loaded_" .. provider .. "_provider"] = false
end

return M
