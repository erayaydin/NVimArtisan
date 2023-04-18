local installed, treesitter = pcall(require, "nvim-treesitter.configs")

if not installed then
    return
end

treesitter.setup({
    ensure_installed = { "lua", "http", "json", "python", "cpp" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = true,
    },
})

vim.cmd
[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
