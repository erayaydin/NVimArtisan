local installed, nvim_tree = pcall(require, "nvim-tree")

if not installed then
  return
end

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Load default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings for nvim-tree
  vim.keymap.set("n", "<C-h>", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
end

-- Setup nvim-tree
nvim_tree.setup({
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = {
            "notify",
            "packer",
            "qf",
            "diff",
            "fugitive",
            "fugitiveblame",
            "vista_kind",
            "toggleterm",
          },
          buftype = {
            "nofile",
            "terminal",
            "help",
          },
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    git_ignored = false,
    custom = {
      "\\.git/",
      ".idea/",
      "node_modules",
      "\\.cache",
      "__pycache__",
    },
  },
  git = {
    timeout = 500,
  },
  view = {
    width = {
      min = 20,
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
        modified = "●",
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
  on_attach = on_attach,
})
