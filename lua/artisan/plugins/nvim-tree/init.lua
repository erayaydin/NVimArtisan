local installed, nvim_tree = pcall(require, "nvim-tree")

if not installed then
    return
end

-- Aliases
local callback = require("nvim-tree.config").nvim_tree_callback

-- Setup nvim-tree
nvim_tree.setup({
    actions = {
        open_file = {
            window_picker = {
                exclude = {
                    filetype = {
                        "packer",
                        "vista_kind",
                        "notify",
                        "help",
                        "toggleterm",
                    },
                    buftype = {
                        "terminal",
                    },
                },
            },
        },
    },
    open_on_setup = true,
    ignore_ft_on_setup = { "alpha" },
    diagnostics = {
        enable = true,
    },
    filters = {
        custom = {
            "\\.git",
            "node_modules",
            "\\.cache",
            "__pycache__",
        },
    },
    git = {
        ignore = false,
        timeout = 500,
    },
    view = {
        width = "20",
        adaptive_size = true,
        mappings = {
            list = {
                { key = "<C-h>", cb = callback("toggle_dotfiles") },
            },
        },
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "icon",
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
})
