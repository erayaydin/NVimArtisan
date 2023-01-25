local fn, opt = vim.fn, vim.opt

local path = require('artisan.utils.path')

local install = function(path)
    vim.notify("Installing lazy.nvim...")
    fn.system { "git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git", path }
end

local path = path.join(path.data(), 'site', 'pack', 'lazy', 'opt', 'lazy.nvim')

if fn.empty(fn.glob(path)) ~= 0 then
    install(path)
end

opt.runtimepath:append(path)

require("artisan.plugins")
