-- vim:foldmethod=marker
local use = require("packer").use

return require("packer").startup({
    function()
        -- Packer itself
        use { "wbthomason/packer.nvim" }

        -- Performance {{{

        -- Impatient
        -- Improve startup time
        -- Repo: https://github.com/lewis6991/impatient.nvim
        use {
            "lewis6991/impatient.nvim",
            config = function()
                require("impatient")
            end
        }

        -- Filetype
        -- Replacement for the included filetype.vim
        -- Github: https://github.com/nathom/filetype.nvim
        use {
            "abzcoding/filetype.nvim",
            branch = "fix/qf-syntax",
        }

        -- FixCursorHold
        -- Fixes CursorHold performance bug
        -- Github: https://github.com/antoinemadec/FixCursorHold.nvim
        use "antoinemadec/FixCursorHold.nvim"

        -- }}}

        -- Themes & Color Schemes {{{

        use "rebelot/kanagawa.nvim"

        -- Nord Theme
        -- Neovim theme based off of the Nord
        -- Repo: https://github.com/shaunsingh/nord.nvim
        use "shaunsingh/nord.nvim"

        -- }}}

        -- Utilities {{{

        -- Plenary
        -- Usefull lua functions
        -- Github: https://github.com/nvim-lua/plenary.nvim
        use "nvim-lua/plenary.nvim"

        -- Popup
        -- Popup API
        -- Github: https://github.com/nvim-lua/popup.nvim
        use {
            "nvim-lua/popup.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
            }
        }

        -- VimResize
        -- Resize function helper
        use "artart222/vim-resize"

        -- }}}

        -- ToggleTerm
        -- Multiple terminal windows
        -- Github:
        use {
            "akinsho/nvim-toggleterm.lua",
            config = function()
                require("artisan.plugins.toggleterm")
            end
        }

        -- TrueZen
        -- Clean and elegant distraction-free writing
        -- Github: https://github.com/Pocco81/TrueZen.nvim
        use {
            "Pocco81/TrueZen.nvim",
            cmd = {
                "TZFocus",
                "TZAtaraxis",
                "TZMinimalist",
            },
            config = function()
                require("artisan.plugins.truezen")
            end
        }

        -- Dashboard
        -- Startup screen
        -- Github:
        use {
            "glepnir/dashboard-nvim",
            cmd = {
                "Dashboard",
                "DashboardChangeColorscheme",
                "DashboardFindFile",
                "DashboardFindHistory",
                "DashboardFindWord",
                "DashboardNewFile",
                "DashboardJumpMarks",
                "SessionLoad",
                "SessionSave"
            },
            setup = function()
                require("artisan.plugins.dashboard")
            end
        }


        -- TreeSitter
        -- Nvim Treesitter configurations and abstraction layer (+advanced highlighting)
        -- Github: https://github.com/nvim-treesitter/nvim-treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            after = "impatient.nvim",
            config = function()
                require("artisan.plugins.treesitter")
            end
        }

        -- IndentBlankline
        -- Indentation guides to all lines
        -- Github: https://github.com/lukas-reineke/indent-blankline.nvim
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufEnter",
            config = function()
                require("artisan.plugins.indent-blankline")
            end
        }

        -- WebDevIcons
        -- Add web devicons
        -- Github: https://github.com/kyazdani42/nvim-web-devicons
        use "kyazdani42/nvim-web-devicons"

        -- NvimTree
        -- File explorer tree
        -- Github: https://github.com/kyazdani42/nvim-tree.lua
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("artisan.plugins.nvim-tree")
            end
        }

        -- Bufferline
        -- Snazzy bufferline
        -- Github: https://github.com/akinsho/bufferline.nvim
        use {
            "akinsho/nvim-bufferline.lua",
            after = "nvim-web-devicons",
            config = function()
                require("artisan.plugins.bufferline")
            end
        }

        -- Statusline
        -- Statusline plugin
        -- Github: https://github.com/nvim-lualine/lualine.nvim
        use {
            "nvim-lualine/lualine.nvim",
            after = "nvim-web-devicons",
            config = function()
                require("artisan.plugins.lualine")
            end
        }

        -- Colorizer
        -- Color highlighter
        -- Github: https://github.com/norcalli/nvim-colorizer.lua
        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufEnter",
            config = function()
                require("artisan.plugins.colorizer")
            end
        }

        -- NeoFormat
        -- Formatting code
        -- Github: https://github.com/sbdchd/neoformat
        use {
            "sbdchd/neoformat",
            cmd = "Neoformat"
        }

        -- Scrollbar
        -- Interactive vertical scrollbars
        -- Github: https://github.com/dstein64/nvim-scrollview
        use {
            "dstein64/nvim-scrollview",
            event = "BufRead",
            config = function()
                require("artisan.plugins.scrollview")
            end
        }

        -- NeoScroll
        -- Smooth scroll
        -- Github:
        use {
            "karb94/neoscroll.nvim",
            event = "BufRead",
            config = function()
                require("neoscroll").setup()
            end
        }

        -- TodoComments
        --
        -- Github:
        use {
            "folke/todo-comments.nvim",
            event = "BufEnter",
            config = function()
                require("artisan.plugins.todo-comments")
            end
        }

        -- WhichKey
        --
        -- Github:
        use {
            "folke/which-key.nvim",
            event = "VimEnter",
            config = function()
                require("artisan.plugins.which-key")
            end
        }

        -- Mkdir
        --AAutomatically creates missing directories on saving a file
        -- Github: https://github.com/jghauser/mkdir.nvim
        use {
            "jghauser/mkdir.nvim",
            cmd = "new",
            config = function()
                require("mkdir")
            end
        }

        -- Kommentary
        -- Commenting plugin
        -- Github: https://github.com/b3nj5m1n/kommentary
        use {
            "b3nj5m1n/kommentary",
            after = "nvim-treesitter"
        }

        -- ContextCommentString
        -- Smart way for changing commentstring
        -- Github: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
        use {
            "JoosepAlviste/nvim-ts-context-commentstring",
            after = "kommentary"
        }

        -- MatchUp
        -- Better navigate and highlight matching words
        -- Github: https://github.com/andymass/vim-matchup
        use {
            "andymass/vim-matchup",
            event = "BufRead"
        }

        -- Fuzzy Finder {{{

        -- Telescope Fzf Native Extension
        -- C port of the Fzf
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
            cmd = "Telescope"
        }

        -- Telescope Project Extensions
        -- Repo: https://github.com/nvim-telescope/telescope-project.nvim
        use "nvim-telescope/telescope-project.nvim"

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            after = "telescope-fzf-native.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
            },
            config = function()
                require("artisan.plugins.telescope")
            end
        }

        -- }}}

        -- VCS Support {{{

        -- Fugitive
        -- Git commands
        -- Github:
        use {
            "tpope/vim-fugitive",
            cmd = "Git"
        }

        -- GitSigns
        -- Git diff signs on buffer
        -- Github:
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = function()
                require("artisan.plugins.gitsigns")
            end
        }

        -- }}}

        -- Code Completion {{{

        -- FriendlySnippets
        -- Preconfigured snippets
        -- Github: https://github.com/rafamadriz/friendly-snippets
        use {
            "rafamadriz/friendly-snippets",
            event = "InsertEnter"
        }

        -- CompletionEngine ok
        -- Github:
        use {
            "hrsh7th/nvim-cmp",
            after = "friendly-snippets",
            requires = {
                "hrsh7th/cmp-vsnip",
                "hrsh7th/vim-vsnip",
            },
            config = function()
                require("artisan.plugins.nvim-cmp")
            end
        }

        -- CmpBuffer
        -- Github:
        use {
            "hrsh7th/cmp-buffer",
            after = "nvim-cmp"
        }

        -- CmpPath
        -- Github:
        use {
            "hrsh7th/cmp-path",
            after = "nvim-cmp"
        }

        -- LuaSnip
        -- Snippet engine
        -- Github:
        use {
            "L3MON4D3/LuaSnip",
            after = "nvim-cmp",
            config = function ()
                require("luasnip/loaders/from_vscode").load()
            end
        }

        -- CompletionLuaSnip
        -- LuaSnip completion source for nvim-cmp
        -- Github: https://github.com/saadparwaiz1/cmp_luasnip
        use {
            "saadparwaiz1/cmp_luasnip",
            after = "LuaSnip"
        }

        -- CompletionNvimLua
        -- nvim-cmp source for neovim lua API
        -- Github: https://github.com/hrsh7th/cmp-nvim-lua
        use {
            "hrsh7th/cmp-nvim-lua",
            after = "nvim-cmp"
        }

        -- CmpNvimLsp
        -- Github:
        use {
            "hrsh7th/cmp-nvim-lsp",
            after = "nvim-lspconfig"
        }

        use {'kevinhwang91/nvim-bqf'}

        -- }}}

        -- Language Server Protocol {{{

        -- LSPConfig
        -- Quickstart LSP client configuration
        -- Github:
        use {
            "neovim/nvim-lspconfig",
            event = "BufEnter",
            config = function()
                require("artisan.plugins.lsp")
            end
        }

        -- LSPInstaller
        -- Manage LSP servers
        -- Github: https://github.com/williamboman/nvim-lsp-installer/
        --[[
        use {
            "williamboman/nvim-lsp-installer",
            after = "nvim-lspconfig",
            config = function()
                require("artisan.plugins.lsp-installer")
            end
        }
        ]]

        -- LSPSignature
        use {
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function ()
                require("lsp_signature").setup()
            end
        }

        -- Metals Language Server (for Scala)
        use {
            "scalameta/nvim-metals",
            after = "cmp-nvim-lsp",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("artisan.plugins.lsp-metals")
            end
        }

        -- Database {{{
        use {
            "kristijanhusak/vim-dadbod-ui",
            requires = { "tpope/vim-dadbod" },
            config = function()
                require("artisan.plugins.dadbod")
            end
        }

        use "kristijanhusak/vim-dadbod-completion"

        -- }}}

        -- Debug Adapter {{{

        -- DAP
        -- Debug Adapter Protocol
        -- Github: https://github.com/mfussenegger/nvim-dap
        use {
            "mfussenegger/nvim-dap",
            event = "BufRead"
        }

        -- DAPInstall
        -- Manage several debuggers
        -- Github: https://github.com/Pocco81/DAPInstall.nvim
        use {
            "Pocco81/dap-buddy.nvim",
            after = "nvim-dap",
            commit = "24923c3819a450a772bb8f675926d530e829665f"
        }

        -- DAPUI
        -- UI for DAP
        -- Github: https://github.com/rcarriga/nvim-dap-ui
        use {
            "rcarriga/nvim-dap-ui",
            after = "dap-buddy.nvim",
            config = function()
                require("artisan.plugins.dap")
            end
        }

        -- }}}

    end, config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end
        }
    }
})

