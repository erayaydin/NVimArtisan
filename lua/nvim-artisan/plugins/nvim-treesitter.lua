local installed, treesitter = pcall(require, "nvim-treesitter.configs")

if not installed then
  return
end

---@diagnostic disable-next-line: missing-fields
treesitter.setup({
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "gdscript",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gpg",
    "graphql",
    "groovy",
    "html",
    "http",
    "java",
    "javascript",
    "jq",
    "json",
    "kotlin",
    "lua",
    "make",
    "muttrc",
    "php",
    "proto",
    "python",
    "regex",
    "ruby",
    "rust",
    "scala",
    "scss",
    "sql",
    "ssh_config",
    "svelte",
    "swift",
    "terraform",
    "tmux",
    "toml",
    "tsv",
    "twig",
    "typescript",
    "vim",
    "xml",
    "yaml",
    "zig",
  },
  highlight = {
    enable = true,
  },
})

vim.cmd
[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
