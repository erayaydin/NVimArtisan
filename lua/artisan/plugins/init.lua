-- vim:foldmethod=marker
return {
  -- Lazy.nvim itself
  {
    "folke/lazy.nvim",
    tag = "stable",
  },

  -- Performance {{{

  -- Filetype
  -- Replacement for the included filetype.vim
  -- Repo: https://github.com/nathom/filetype.nvim
  {
    "nathom/filetype.nvim",
  },

  -- }}}

  -- Utilities {{{

  -- Plenary
  -- Usefull lua functions
  -- Repo: https://github.com/nvim-lua/plenary.nvim
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },

  -- Popup
  -- Popup API
  -- Repo: https://github.com/nvim-lua/popup.nvim
  {
    "nvim-lua/popup.nvim",
    dependencies = { "plenary" },
  },

  -- Notify
  -- Fancy notifications
  -- Repo: https://github.com/rcarriga/nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("artisan.plugins.notify")
    end,
  },

  -- }}}

  -- General {{{

  -- Nvim Web Devicons
  -- Developer icons.
  -- Repo: https://github.com/nvim-tree/nvim-web-devicons
  {
    "kyazdani42/nvim-web-devicons",
  },

  -- NvimTree
  -- File explorer tree
  -- Repo: https://github.com/kyazdani42/nvim-tree.lua
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("artisan.plugins.nvim-tree")
    end,
  },

  -- Lualine
  -- Statusline plugin
  -- Repo: https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("artisan.plugins.lualine")
    end,
  },

  -- Barbar
  -- Bufferline plugin
  -- Repo: https://github.com/romgrk/barbar.nvim
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("artisan.plugins.barbar")
    end,
  },

  -- WhichKey
  -- Key helper
  -- Repo: https://github.com/folke/which-key.nvim
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('artisan.plugins.which-key')
    end,
  },

  -- Alpha
  -- Greeter and/or dashboard plugin
  -- Repo: https://github.com/goolord/alpha-nvim
  {
    'goolord/alpha-nvim',
    lazy = false,
    config = function()
      require('artisan.plugins.alpha')
    end,
  },

  -- Floaterm
  -- Floating terminal manager
  -- Repo: https://github.com/voldikss/vim-floaterm
  {
    'voldikss/vim-floaterm',
    event = 'VeryLazy',
  },

  -- }}}

  -- Code {{{

  -- TreeSitter
  -- Nvim Treesitter configurations and abstraction layer (+advanced highlighting)
  -- Repo: https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('artisan.plugins.nvim-treesitter')
    end,
  },

  -- IndentBlankline
  -- Indentation guides to lines
  -- Repo: https://github.com/lukas-reineke/indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufEnter',
    main = 'ibl',
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
  },

  -- Twilight
  -- Dims inactive portions of the code
  -- Repo: https://github.com/folke/twilight.nvim
  {
    'folke/twilight.nvim',
    event = 'BufEnter',
  },

  -- Fugitive
  -- Git wrapper
  -- Repo: https://github.com/tpope/vim-fugitive
  {
    'tpope/vim-fugitive',
    cmd = 'Git'
  },

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

  -- Todo Comments
  -- Highlight and search todo comments
  -- Repo: https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("artisan.plugins.todo-comments")
    end,
  },

  -- Autopairs
  -- Autapair plugin with multiple character support
  -- Repo: https://github.com/windwp/nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
  },

  -- Laravel
  -- Laravel helper
  -- Repo: https://github.com/adalessa/laravel.nvim
  {
    'adalessa/laravel.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    event = 'VeryLazy',
    config = function()
      require('laravel').setup()

      require('telescope').load_extension('laravel')
    end,
  },

  -- }}}

  -- Finders, Filters, Previewers, Pickers {{{

  -- Telescope Fzf Native Extension
  -- C port of the fzf
  -- Repo: https://github.com/nvim-telescope/telescope-fzf-native.nvim
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    lazy = true,
  },

  -- Telescope
  -- Fuzzy finder
  -- Repo: https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'telescope-fzf-native.nvim', 'nvim-lua/plenary.nvim' },
    branch = '0.1.x',
    lazy = true,
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
    enabled = vim.loop.os_uname().sysname == "Linux",
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
  -- Preconfigured snippets
  -- Repo: https://github.com/rafamadriz/friendly-snippets
  {
    'rafamadriz/friendly-snippets',
    lazy = true
  },

  -- Nvim-Cmp
  -- Completion engine plugin
  -- Repo: https://github.com/hrsh7th/nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    event = {
      'InsertEnter',
      'CmdlineEnter',
    },
    dependencies = {
      'cmp-nvim-lsp',
      'cmp_luasnip',
      'cmp-buffer',
      'cmp-path',
    },
    config = function()
      require("artisan.plugins.nvim-cmp")
    end,
  },

  -- Luasnip
  -- Snippet engine
  -- Repo:
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    dependencies = {
      'friendly-snippets'
    },
    config = function()
      require("luasnip/loaders/from_vscode").load()
    end,
  },

  -- Cmp_Luasnip
  -- LuaSnip completion source for nvim-cmp
  -- Repo: https://github.com/saadparwaiz1/cmp_luasnip
  {
    'saadparwaiz1/cmp_luasnip',
    lazy = true
  },

  -- Cmp-Nvim-Lsp
  -- LSP source for nvim-cmp
  -- Repo: https://github.com/hrsh7th/cmp-nvim-lsp
  {
    'hrsh7th/cmp-nvim-lsp',
    lazy = true
  },

  -- Cmp-Buffer
  -- Completion source for buffer words.
  -- Repo: https://github.com/hrsh7th/cmp-buffer
  {
    'hrsh7th/cmp-buffer',
    lazy = true
  },

  -- Cmp-Path
  -- Completion source for filesystem paths.
  {
    'hrsh7th/cmp-path',
    lazy = true
  },

  -- }}}

  -- Language Server Protocol {{{

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

  -- mason-lspconfig.nvim
  -- Integration of lspconfig and mason.nvim
  -- Repo: https://github.com/williamboman/mason-lspconfig.nvim
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'b0o/schemastore.nvim',
    },
    config = function()
      require('artisan.plugins.mason-lspconfig')
    end,
  },

  -- LSPConfig
  -- Configs for LSP
  -- Repo: https://github.com/neovim/nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-lspconfig.nvim',
    },
  },

  -- Toggle LSP Diagnostics
  -- Repo: https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
  {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function()
      require('toggle_lsp_diagnostics').init()
    end,
  },

  -- Metals Scala Language Server
  -- Language server for scala language
  -- Repo: https://github.com/scalameta/nvim-metals
  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require("artisan.plugins.nvim-metals")
    end,
  },

  -- None LS
  -- Language server for linters, formatters etc.
  -- Repo: https://github.com/nvimtools/none-ls.nvim
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require("artisan.plugins.none-ls")
    end,
  },

  -- LSP Progress
  -- UI for Neovim notifications and LSP progress
  -- Repo: https://github.com/j-hui/fidget.nvim
  {
    'j-hui/fidget.nvim',
    tag = 'v1.4.0',
  },

  -- Trouble
  -- Diagnostics, references, qf and list
  -- Repo: https://github.com/folke/trouble.nvim
  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("artisan.plugins.trouble")
    end,
  },

  -- }}}

  -- Debug Adapter Protocol {{{

  -- Debug Adapter Protocol Client
  -- Client implementation for nvim
  -- Repo: https://github.com/mfussenegger/nvim-dap
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('artisan.plugins.nvim-dap')
    end,
  },

  -- Mason Nvim Dap
  -- Automatically register debug adapters
  -- Repo: https://github.com/jay-babu/mason-nvim-dap.nvim
  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
      require('artisan.plugins.mason-nvim-dap')
    end,
  },

  -- Dap UI
  -- UI for debug adapter
  -- Repo: https://github.com/rcarriga/nvim-dap-ui
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require('artisan.plugins.nvim-dap-ui')
    end,
  },

  -- }}}

  -- Testing, Linting {{{

  -- Neotest
  -- Interact with tests
  -- Repo: https://github.com/nvim-neotest/neotest
  {
    'nvim-neotest/neotest',
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "stevanmilic/neotest-scala",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-phpunit",
      "theutz/neotest-pest",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("artisan.plugins.neotest")
    end,
  },

  -- }}}

  -- Database {{{

  -- Dadbod
  -- Interact with databases
  -- Repo: https://github.com/tpope/vim-dadbod
  {
    'tpope/vim-dadbod'
  },

  -- Dadbod UI
  -- UI for vim-dadbod
  -- Repo: https://github.com/kristijanhusak/vim-dadbod-ui
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      {
        'tpope/vim-dadbod',
        lazy = true
      },
      {
        'kristijanhusak/vim-dadbod-completion',
        ft = { 'sql', 'mysql', 'plsql' },
        lazy = true
      },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_env_variable_url = 'DATABASE_URL'
      vim.g.db_ui_env_variable_name = 'DATABASE_NAME'
    end,
  },

  -- }}}

  -- Tools {{{

  -- Rest
  -- HTTP client
  -- Repo: https://github.com/rest-nvim/rest.nvim
  {
    'rest-nvim/rest.nvim',
    ft = "http",
    dependencies = { 'luarocks.nvim' },
    config = function()
      require("artisan.plugins.rest")
    end,
  },

  -- }}}

  -- Style {{{

  -- Tokyonight Theme
  -- Repo: https://github.com/folke/tokyonight.nvim
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

  -- Noice
  -- Replaces ui for messages, cmdline and the popupmenu.
  -- Repo: https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("artisan.plugins.noice")
    end,
  },

  -- }}}

}
