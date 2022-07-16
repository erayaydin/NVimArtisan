local plugins = {
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
}

local providers = {
    "node",
    "perl",
    "python3",
    "ruby",
}

-- Disable builtin plugins
for _, plugin in pairs(plugins) do
    vim.g["loaded_" .. plugin] = true
end

-- Disable providers
for _, provider in ipairs(providers) do
    vim.g["loaded_" .. provider .. "_provider"] = false
end
