-- vim:foldmethod=marker
return {
    -- Lazy.nvim itself
    { 'folke/lazy.nvim', tag = 'stable' },

    -- Performance {{{

    -- Impatient
    -- Improve startup time
    -- Repo: https://github.com/lewis6991/impatient.nvim
    {
        'lewis6991/impatient.nvim',
        config = function()
            require("impatient")
        end,
    },

    -- Filetype
    -- Replacement for the included filetype.vim
    -- Repo: https://github.com/nathom/filetype.nvim
    {
        'abzcoding/filetype.nvim',
        branch = "fix/qf-syntax",
    },

    -- }}}

    -- Utilities {{{

    -- Plenary
    -- Usefull lua functions
    -- Repo: https://github.com/nvim-lua/plenary.nvim
    {
        'nvim-lua/plenary.nvim',
        name = 'plenary',
    },

    -- Popup
    -- Popup API
    -- Repo: https://github.com/nvim-lua/popup.nvim
    {
        'nvim-lua/popup.nvim',
        dependencies = { 'plenary' },
    },

    -- Notify
    -- Fancy notifications
    -- Repo: https://github.com/rcarriga/nvim-notify
    {
        'rcarriga/nvim-notify',
        config = function()
            require('artisan.plugins.notify')
        end,
    },

    {
        'ellisonleao/carbon-now.nvim',
        cmd = "CarbonNow",
        config = function()
            require('artisan.plugins.carbon')
        end,
    },

    -- }}}

    -- General {{{

    --
    {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require("artisan.plugins.nvim-web-devicons")
        end,
    },

    -- NvimTree
    -- File explorer tree
    -- Repo: https://github.com/kyazdani42/nvim-tree.lua
    {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('artisan.plugins.nvim-tree')
        end,
    },

    -- Lualine
    -- Statusline plugin
    -- Repo: https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('artisan.plugins.lualine')
        end,
    },

    -- Barbar
    -- Tabline plugin
    -- Repo: https://github.com/romgrk/barbar.nvim
    {
        'romgrk/barbar.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('artisan.plugins.bufferline')
        end,
    },

    -- WhichKey
    {
        'folke/which-key.nvim',
        config = function()
            require('artisan.plugins.which-key')
        end,
        event = 'VeryLazy',
    },

    {
        'goolord/alpha-nvim',
        lazy = false,
        config = function()
            require('artisan.plugins.alpha')
        end,
    },

    {
        'akinsho/toggleterm.nvim',
        event = 'VeryLazy',
        branch = 'main',
        config = function()
            require('artisan.plugins.toggleterm')
        end,
    },

    -- }}}

    -- Code {{{

    -- TreeSitter
    -- Nvim Treesitter configurations and abstraction layer (+advanced highlighting)
    -- Repo: https://github.com/nvim-treesitter/nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('artisan.plugins.treesitter')
        end,
    },

    -- IndentBlankline
    -- Indentation guides to lines
    -- Repo: https://github.com/lukas-reineke/indent-blankline.nvim
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufEnter',
        config = function()
            require('artisan.plugins.indent-blankline')
        end,
    },

    -- Colorizer
    -- Color Highlighter
    -- Repo: https://github.com/norcalli/nvim-colorizer.lua
    {
        'norcalli/nvim-colorizer.lua',
        event = 'BufEnter',
        config = function()
            require("artisan.plugins.colorizer")
        end,
    },

    -- Comment
    -- Smart and powerful commenting plugin
    -- Repo: https://github.com/numToStr/Comment.nvim
    {
        'numToStr/Comment.nvim',
        event = 'BufRead',
        config = function()
            require('artisan.plugins.comment')
        end,
    },

    -- Twilight
    -- Dims inactive portions of the code
    -- Repo: https://github.com/folke/twilight.nvim
    {
        'folke/twilight.nvim',
        event = 'BufEnter',
        config = function()
            require("artisan.plugins.twilight")
        end,
    },

    -- Fugitive
    -- Git commands
    -- Repo: https://github.com/tpope/vim-fugitive
    { 'tpope/vim-fugitive', cmd = 'Git' },

    -- Git Signs
    -- Git diff signs on the buffer
    -- Repo: https://github.com/lewis6991/gitsigns.nvim
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
            require('artisan.plugins.gitsigns')
        end,
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require('artisan.plugins.nvim-autopairs')
        end,
    },

    -- }}}

    -- Finders, Filters, Previewers, Pickers {{{

    -- Telescope Fzf Native Extension
    -- C port of the fzf
    -- Repo: https://github.com/nvim-telescope/telescope-fzf-native.nvim
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        lazy = true,
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'telescope-fzf-native.nvim', 'nvim-lua/plenary.nvim' },
        lazy = true,
        cmd = 'Telescope',
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require('artisan.plugins.telescope')
        end,
    },

    -- Telescope Symbols Extension
    -- Picking symbols
    -- Repo: https://github.com/nvim-telescope/telescope-symbols.nvim
    {
        'nvim-telescope/telescope-symbols.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },

    -- Telescope Env Extension
    -- Watch environment variables
    -- Repo: https://github.com/LinArcX/telescope-env.nvim
    {
        'LinArcX/telescope-env.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require("telescope").load_extension("env")
        end,
    },

    -- Telescope Conventional Commits Extension
    -- Repo: https://github.com/olacin/telescope-cc.nvim
    {
        'olacin/telescope-cc.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require("telescope").load_extension("conventional_commits")
        end,
    },

    -- Telescope Ports Extension
    -- Watch open ports
    -- INFO: Make sure its install on Linux only
    {
        'LinArcX/telescope-ports.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require("telescope").load_extension("ports")
        end,
    },

    {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'tami5/sqlite.lua' },
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require("telescope").load_extension("frecency")
        end,
    },

    {
        'nvim-telescope/telescope-project.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require("telescope").load_extension("project")
        end,
    },

    -- }}}

    -- Code Completion {{{

    -- Friendly snippets
    -- Repo:
    { 'rafamadriz/friendly-snippets', lazy = true },

    -- Autocompletion plugin
    -- Repo:
    {
        'hrsh7th/nvim-cmp',
        event = { 'InsertEnter', 'CmdlineEnter' },
        dependencies = {
            'cmp-nvim-lsp',
            'cmp_luasnip',
            'cmp-buffer',
            'cmp-path',
        },
        config = function()
            require("artisan.plugins.cmp")
        end,
    },

    -- Luasnip
    -- Snippets plugin
    -- Repo:
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        dependencies = { 'friendly-snippets' },
        config = function()
            require('artisan.plugins.snippets')
        end,
    },

    -- Snippets source for nvim-cmp
    -- Repo:
    { 'saadparwaiz1/cmp_luasnip', lazy = true },

    -- LSP source for nvim-cmp
    -- Repo:
    { 'hrsh7th/cmp-nvim-lsp', lazy = true },

    --
    { 'hrsh7th/cmp-buffer', lazy = true },

    --
    { 'hrsh7th/cmp-path', lazy = true },

    -- }}}

    -- Language Server Protocol {{{

    -- LSPConfig
    -- Repo:
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'mason-lspconfig.nvim', 'b0o/schemastore.nvim' },
        config = function()
            require('artisan.plugins.lsp')
        end,
    },

    -- mason-lspconfig.nvim
    -- Integration of lspconfig and mason.nvim
    -- Repo: https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim', lazy = true, dependencies = { 'williamboman/mason.nvim' } },

    -- Mason
    -- Portable package manager to install LSP servers
    -- DAP servers, linters and formatters.
    -- Repo: https://github.com/williamboman/mason.nvim
    {
        'williamboman/mason.nvim',
        config = function()
            require('artisan.plugins.mason')
        end,
    },

    -- LSP Signature
    -- LSP signature hint
    -- Repo: https://github.com/ray-x/lsp_signature.nvim
    {
        'ray-x/lsp_signature.nvim',
        config = function()
            require("lsp_signature").setup()
        end,
    },

    {
        'scalameta/nvim-metals',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("artisan.plugins.nvim-metals")
        end,
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("artisan.plugins.null-ls")
        end,
    },

    {
        'j-hui/fidget.nvim',
        config = function()
            require("artisan.plugins.fidget")
        end,
    },

    {
        'folke/trouble.nvim',
        dependencies ='kyazdani42/nvim-web-devicons',
        config = function()
            require("artisan.plugins.trouble")
        end,
    },

    -- }}}

    -- Debug Adapter Protocol {{{

    {
        'mfussenegger/nvim-dap',
        config = function()
            ---@diagnostic disable-next-line: different-requires
            require('artisan.plugins.dap')
        end,
    },

    {
        'rcarriga/nvim-dap-ui',
        config = function()
            require('artisan.plugins.dapui')
        end,
    },

    -- }}}

    -- Testing, Linting {{{

    {
        'nvim-neotest/neotest',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-phpunit",
        },
        config = function()
            require("artisan.plugins.neotest")
        end,
    },

    -- }}}

    -- Database {{{

    { 'tpope/vim-dadbod' },

    {
        'kristijanhusak/vim-dadbod-ui',
        config = function()
            vim.g.db_ui_env_variable_url = 'DATABASE_URL'
            vim.g.db_ui_env_variable_name = 'DATABASE_NAME'
        end,
    },

    -- }}}

    -- Tools {{{

    {
        'NTBBloodbath/rest.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("artisan.plugins.rest")
        end,
    },

    -- }}}

    -- Style {{{

    -- Tokyonight Theme
    -- Repo:
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- Nvim Scrollbar
    -- Extensible Neovim Scrollbar
    -- Repo: https://github.com/petertriho/nvim-scrollbar
    {
        'petertriho/nvim-scrollbar',
        config = function()
            require("artisan.plugins.scrollbar")
        end,
    },

    -- NeoScroll
    -- Smooth scrolling
    -- Repo: https://github.com/karb94/neoscroll.nvim
    {
        'karb94/neoscroll.nvim',
        event = "BufRead",
        config = function()
            require("neoscroll").setup()
        end,
    },

    -- }}}

}
