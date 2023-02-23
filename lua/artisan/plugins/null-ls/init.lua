local installed, null_ls = pcall(require, "null-ls")

if not installed then
    return
end

null_ls.setup({
    log_level = "debug",
    sources = {
        -- = Formatting =

        -- PHP
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.phpcbf,
        null_ls.builtins.formatting.pint,

        -- Scala
        null_ls.builtins.formatting.scalafmt,

        -- = Diagnostics =

        -- Lua
        null_ls.builtins.diagnostics.luacheck.with({
            extra_args = { "--globals vim" },
        }),

        -- PHP
        null_ls.builtins.diagnostics.phpcs.with({
            extra_args = { "--standard=PSR12" },
        }),
    },
})
