local installed, nvim_tree = pcall(require, "nvim-tree")
if not installed then
    return
end

-- Aliases
local g = vim.g
local callback = require("nvim-tree.config").nvim_tree_callback

-- Configuration (before setup)
g.nvim_tree_auto_ignore_ft = { "dashboard" }

-- Setup nvim-tree
nvim_tree.setup {
    open_on_tab = false,
    update_cwd = true,
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                exclude = {
                    filetype = {
                        "packer",
                        "vista_kind",
                        "toggleterm",
                    },
                    buftype = {
                        "terminal",
                    },
                }
            }
        },
    },
    update_to_buf_dir = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    filters = {
        custom = {
            ".git",
            "node_modules",
            ".cache",
            "__pycache__"
        }
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = "15%",
        side = 'left',
        auto_resize = true,
        mappings = {
            list = {
                { key = "<S-h>", cb = ":call ResizeLeft(3)<CR>" },
                { key = "<C-h>", cb = callback("toggle_dotfiles") },
            }
        },
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "icon",
        add_trailing = false,
        indent_markers = {
            enable = true,
        }
    },
}
