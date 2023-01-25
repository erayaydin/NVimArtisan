local plugin_loader = {}

local fn, opt = vim.fn, vim.opt

local path = require('artisan.utils.path')

local lazy_pack_path = path.join(path.data(), 'site', 'pack', 'lazy', 'opt')

local function fix_lazy_cache()
    local cache = require("lazy.core.cache")
    ---@diagnostic disable-next-line: redundant-parameter
    cache.setup({
        performance = {
            cache = {
                enabled = true,
                path = path.join(path.cache(), "lazy", "cache"),
            },
        },
    })
    cache.setup = function() end
end

function plugin_loader.init(opts)
    opts = opts or {}

    -- Determine installation path of the plugin manager
    local install_path = opts.install_path or path.join(lazy_pack_path, 'lazy.nvim')

    -- Install lazy.nvim if its not installed
    if not path.is_directory(install_path) then
        plugin_loader.install(install_path)
    end

    -- Add lazy.nvim to the runtime path
    opt.runtimepath:append(install_path)

    -- Fix lazy cache directory issue
    fix_lazy_cache()
end

function plugin_loader.install(install_path)
    vim.notify("Installing lazy.nvim...")
    fn.system { "git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git", install_path }
end

function plugin_loader.load(plugins)
    -- Check lazy.nvim installation
    local installed, lazy = pcall(require, 'lazy')
    if not installed then
        print('lazy.nvim not installed!')
        return
    end

    -- Remove autoload of all plugins
    vim.opt.runtimepath:remove(path.join(lazy_pack_path, "*"))

    -- Configure lazy.nvim
    local configured = xpcall(function()
        lazy.setup(plugins, {
            install = {
                missing = true,
                -- TODO: add different colorscheme support
                colorscheme = { 'tokyonight' },
            },
            ui = {
                border = 'rounded',
            },
            root = lazy_pack_path,
            git = {
                timeout = 120,
            },
            lockfile = path.join(path.config(), "lazy-lock.json"),
            performance = {
                rtp = {
                  reset = false,
                },
            },
            readme = {
                root = path.join(path.data(), "lazy", "readme"),
            },
        })
    end, debug.traceback)

    -- Show error when something wrong
    if not configured then
        print(("Problems detected while loading plugins\n\n%s"):format(debug.traceback()))
    end
end

require("artisan.plugins")

return plugin_loader