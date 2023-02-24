local installed, null_ls = pcall(require, "null-ls")

if not installed then
    return
end

local function get_sources(sources)
    local tbl = {}

    for source_type, languages in pairs(sources) do
        for _, programs in pairs(languages) do
            for _, program in pairs(programs) do
                -- FIXME: dirty
                local builtin = ""
                local with = {}
                if type(program) == "string" then
                    builtin = program
                elseif type(program) == "table" then
                    builtin = program[1]
                    table.remove(program, 1)
                    with = program
                end

                local configured_builtin = null_ls.builtins[source_type][builtin].with(with)

                if vim.fn.executable(configured_builtin._opts.command) == 1 then
                    table.insert(tbl, configured_builtin)
                end
            end
        end
    end

    return tbl
end

null_ls.setup({
    log_level = "debug",
    sources = get_sources({
        diagnostics = {
            lua = {
                {
                    "luacheck",
                    extra_args = { "--globals vim" },
                },
            },
            php = {
                {
                    "phpcs",
                    extra_args = { "--standard=PSR12" },
                },
            },
            python = {
                "flake8",
            }
        },
        formatting = {
            php = {
                "phpcsfixer", "phpcbf", "pint",
            },
            scala = {
                "scalafmt",
            },
            python = {
                "black",
            },
        },
    }),
})
