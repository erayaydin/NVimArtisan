local M = {
    sep = package.config:sub(1, 1) == '\\' and '\\' or '/',
    env = {
        data = 'NVIMARTISAN_DATAPATH',
        config = 'NVIMARTISAN_CONFIGPATH',
        cache = 'NVIMARTISAN_CACHEPATH',
    },
}

local uv = vim.loop

local function get_custom_path(env, default)
    if not env then
        return default
    end

    local custom_path = os.getenv(env)
    if custom_path then
        return custom_path
    end

    return default
end

function M.data(env)
    return get_custom_path(env or vim.env[M.env.data], vim.call("stdpath", "data"))
end

function M.config(env)
    return get_custom_path(env or vim.env[M.env.config], vim.call("stdpath", "config"))
end

function M.cache(env)
    return get_custom_path(env or vim.env[M.env.cache], vim.call("stdpath", "cache"))
end

function M.join(...)
    return table.concat({ ... }, M.sep)
end

function M.is_directory(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == "directory" or false
end

function M.is_file(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == "file" or false
end

return M