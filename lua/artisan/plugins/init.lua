-- vim:foldmethod=marker
local installed, packer = pcall(require, "packer")

if not installed then
    return
end

local plugins = {
    -- Packer itself
    ["wbthomason/packer.nvim"] = {},

    -- Performance {{{

    -- Impatient
    -- Improve startup time
    -- Repo: https://github.com/lewis6991/impatient.nvim
    ["lewis6991/impatient.nvim"] = {
        config = function()
            require("impatient")
        end,
    },


    -- Filetype
    -- Replacement for the included filetype.vim
    -- Repo: https://github.com/nathom/filetype.nvim
    ["abzcoding/filetype.nvim"] = {
        branch = "fix/qf-syntax",
    },

    -- FixCursorHold
    -- Fixes CursorHold performance bug
    -- Repo: https://github.com/antoinemadec/FixCursorHold.nvim
    ["antoinemadec/FixCursorHold.nvim"] = {},

    -- }}}

    -- Utilities {{{

    -- Plenary
    -- Usefull lua functions
    -- Repo: https://github.com/nvim-lua/plenary.nvim
    ["nvim-lua/plenary.nvim"] = { module = "plenary" },

    -- Popup
    -- Popup API
    -- Repo: https://github.com/nvim-lua/popup.nvim
    ["nvim-lua/popup.nvim"] = {
        requires = { "nvim-lua/plenary.nvim" },
    },

    -- Notify
    -- Fancy notifications
    -- Repo: https://github.com/rcarriga/nvim-notify
    ["rcarriga/nvim-notify"] = {
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("artisan.plugins.notify")
        end,
    },

    ["famiu/bufdelete.nvim"] = {
        cmd = { "Bdelete", "Bwipeout" },
    },

    -- }}}

    -- General {{{

    --
    ["kyazdani42/nvim-web-devicons"] = {
        config = function()
            require("artisan.plugins.nvim-web-devicons")
        end,
    },

    -- NvimTree
    -- File explorer tree
    -- Repo: https://github.com/kyazdani42/nvim-tree.lua
    ["kyazdani42/nvim-tree.lua"] = {
        after = { "nvim-web-devicons" },
        config = function()
            require("artisan.plugins.nvim-tree")
        end,
    },

    -- Lualine
    -- Statusline plugin
    -- Repo:
    ["nvim-lualine/lualine.nvim"] = {
        after = { "nvim-web-devicons" },
        config = function()
            require("artisan.plugins.lualine")
        end,
    },

    -- Bufferline
    -- Tabline plugin
    -- Repo:
    ["akinsho/nvim-bufferline.lua"] = {
        after = { "nvim-web-devicons" },
        config = function()
            require("artisan.plugins.bufferline")
        end,
    },

    -- WhichKey
    ["folke/which-key.nvim"] = {
        event = "VimEnter",
        config = function()
            require("artisan.plugins.which-key")
        end,
    },

    ["goolord/alpha-nvim"] = {
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require("artisan.plugins.alpha")
        end,
    },

    ["akinsho/toggleterm.nvim"] = {
        tag = "v2.*",
        config = function()
            require("artisan.plugins.toggleterm")
        end,
    },

    -- }}}

    -- Code {{{

    -- TreeSitter
    -- Nvim Treesitter configurations and abstraction layer (+advanced highlighting)
    -- Repo: https://github.com/nvim-treesitter/nvim-treesitter
    ["nvim-treesitter/nvim-treesitter"] = {
        run = ":TSUpdate",
        config = function()
            require("artisan.plugins.treesitter")
        end,
    },

    -- IndentBlankline
    -- Indentation guides to lines
    -- Repo: https://github.com/lukas-reineke/indent-blankline.nvim
    ["lukas-reineke/indent-blankline.nvim"] = {
        event = "BufEnter",
        config = function()
            require("artisan.plugins.indent-blankline")
        end,
    },

    -- Colorizer
    -- Color Highlighter
    -- Repo: https://github.com/norcalli/nvim-colorizer.lua
    ["norcalli/nvim-colorizer.lua"] = {
        event = "BufEnter",
        config = function()
            require("artisan.plugins.colorizer")
        end,
    },

    -- TodoComments
    -- Highlight todo comments
    -- Repo: https://github.com/folke/todo-comments.nvim
    ["folke/todo-comments.nvim"] = {
        event = "BufEnter",
        config = function()
            require("artisan.plugins.todo-comments")
        end,
    },

    -- Comment
    -- Smart and powerful commenting plugin
    -- Repo: https://github.com/numToStr/Comment.nvim
    ["numToStr/Comment.nvim"] = {
        event = "BufEnter",
        config = function()
            require("artisan.plugins.comment")
        end,
    },

    -- Twilight
    -- Dims inactive portions of the code
    -- Repo: https://github.com/folke/twilight.nvim
    ["folke/twilight.nvim"] = {
        event = "BufEnter",
        config = function()
            require("artisan.plugins.twilight")
        end,
    },

    -- Fugitive
    -- Git commands
    -- Repo: https://github.com/tpope/vim-fugitive
    ["tpope/vim-fugitive"] = {
        cmd = "Git",
    },

    -- Git Signs
    -- Git diff signs on the buffer
    -- Repo: https://github.com/lewis6991/gitsigns.nvim
    ["lewis6991/gitsigns.nvim"] = {
        event = "BufRead",
        config = function()
            require("artisan.plugins.gitsigns")
        end,
    },

    ["windwp/nvim-autopairs"] = {
        event = "InsertEnter",
        config = function()
            require("artisan.plugins.nvim-autopairs")
        end,
    },

    -- }}}

    -- Finders, Filters, Previewers, Pickers {{{

    -- Telescope Fzf Native Extension
    -- C port of the fzf
    -- Repo: https://github.com/nvim-telescope/telescope-fzf-native.nvim
    ["nvim-telescope/telescope-fzf-native.nvim"] = {
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        cmd = "Telescope"
    },

    -- Telescope
    ["nvim-telescope/telescope.nvim"] = {
        after = { "telescope-fzf-native.nvim" },
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("artisan.plugins.telescope")
        end,
    },

    -- Telescope Symbols Extension
    -- Picking symbols
    -- Repo: https://github.com/nvim-telescope/telescope-symbols.nvim
    ["nvim-telescope/telescope-symbols.nvim"] = {
        requires = { "nvim-telescope/telescope.nvim" },
    },

    -- Telescope Env Extension
    -- Watch environment variables
    -- Repo: https://github.com/LinArcX/telescope-env.nvim
    ["LinArcX/telescope-env.nvim"] = {
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("env")
        end,
    },

    -- Telescope Conventional Commits Extension
    -- Repo: https://github.com/olacin/telescope-cc.nvim
    ["olacin/telescope-cc.nvim"] = {
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("conventional_commits")
        end,
    },

    -- Telescope Ports Extension
    -- Watch open ports
    -- INFO: Make sure its install on Linux only
    ["LinArcX/telescope-ports.nvim"] = {
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("ports")
        end,
    },

    ["nvim-telescope/telescope-frecency.nvim"] = {
        requires = { "tami5/sqlite.lua", "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("frecency")
        end,
    },

    ["nvim-telescope/telescope-project.nvim"] = {
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("project")
        end,
    },

    -- }}}

    -- Code Completion {{{

    -- Friendly snippets
    -- Repo:
    ["rafamadriz/friendly-snippets"] = {
        module = "cmp_nvim_lsp",
        event = "InsertEnter",
    },

    -- Autocompletion plugin
    -- Repo:
    ["hrsh7th/nvim-cmp"] = {
        after = "friendly-snippets",
        config = function()
            require("artisan.plugins.cmp")
        end,
    },

    -- Luasnip
    -- Snippets plugin
    -- Repo:
    ["L3MON4D3/LuaSnip"] = {
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            require("artisan.plugins.snippets")
        end,
    },

    -- Snippets source for nvim-cmp
    -- Repo:
    ["saadparwaiz1/cmp_luasnip"] = {
        after = "LuaSnip",
    },

    -- LSP source for nvim-cmp
    -- Repo:
    ["hrsh7th/cmp-nvim-lsp"] = {
        after = "cmp_luasnip",
    },

    --
    ["hrsh7th/cmp-buffer"] = {
        after = "cmp-nvim-lsp",
    },

    --
    ["hrsh7th/cmp-path"] = {
        after = "cmp-buffer",
    },

    -- }}}

    -- Language Server Protocol {{{

    -- LSPConfig
    -- Repo:
    ["neovim/nvim-lspconfig"] = {
        event = "BufEnter",
        config = function()
            require("artisan.plugins.lsp")
        end,
    },

    -- LSP Signature
    -- LSP signature hint
    -- Repo: https://github.com/ray-x/lsp_signature.nvim
    ["ray-x/lsp_signature.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require("lsp_signature").setup()
        end,
    },

    ["scalameta/nvim-metals"] = {
        requires = { "nvim-lua/plenary.nvim" },
        after = { "cmp-nvim-lsp" },
        config = function()
            require("artisan.plugins.nvim-metals")
        end,
    },

    -- }}}

    -- Debug Adapter Protocol {{{

    ["mfussenegger/nvim-dap"] = {
        event = "BufRead",
        config = function()
            require("artisan.plugins.dap")
        end,
    },

    ["rcarriga/nvim-dap-ui"] = {
        after = "nvim-dap",
        config = function()
            require("artisan.plugins.dapui")
        end,
    },

    -- }}}

    -- Style {{{

    -- Tokyonight Theme
    -- Repo:
    ["folke/tokyonight.nvim"] = {
        config = function()
            require("artisan.theme")
        end,
    },

    -- Nvim Scrollbar
    -- Extensible Neovim Scrollbar
    -- Repo: https://github.com/petertriho/nvim-scrollbar
    ["petertriho/nvim-scrollbar"] = {
        after = { "tokyonight.nvim" },
        config = function()
            require("artisan.plugins.scrollbar")
        end,
    },

    -- NeoScroll
    -- Smooth scrolling
    -- Repo: https://github.com/karb94/neoscroll.nvim
    ["karb94/neoscroll.nvim"] = {
        event = "BufRead",
        config = function()
            require("neoscroll").setup()
        end,
    },

    -- }}}

}

local plugins_copy = vim.deepcopy(plugins)
local plugins_table = {}

for key, _ in pairs(plugins_copy) do
    plugins_copy[key][1] = key
    plugins_table[#plugins_table + 1] = plugins_copy[key]
end

packer.init({
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
})

packer.startup(function(use)
    for _, plugin in pairs(plugins_table) do
        use(plugin)
    end
end)
