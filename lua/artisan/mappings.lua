local merge_tb = vim.tbl_deep_extend

local mappings = {
    General = {
        n = {
            -- Turn off highlight
            ["<ESC>"] = { "<cmd>noh<CR>", " no highlight" },

            -- Switch windows
            ["<C-h>"] = { "<C-w>h", "window left" },
            ["<C-l>"] = { "<C-w>l", "window right" },
            ["<C-k>"] = { "<C-w>k", "window up" },
            ["<C-j>"] = { "<C-w>j", "window down" },

            -- Save file
            ["<C-s>"] = { "<cmd>w<CR>", "save file" },
            ["<C-c>"] = { "<cmd>%y+<CR>", "copy file content" },

            -- Line Number
            ["<leader>nn"] = { "<cmd>set nu!<CR>", "toggle line numbers" },
            ["<leader>nr"] = { "<cmd>set rnu!<CR>", "toggle relative number" },
        },
        v = {
            -- Do not copy the replaced text after pasting
            ["p"] = { "\"_dP", "paste" },

            -- Unlimited indent when you visual selected text.
            ["<"] = { "<gv", "indent" },
            [">"] = { ">gv", "indent" },
        },
        i = {},
        t = {},
    },
    Config = {
        n = {
            ["<leader>ce"] = { ":e $MYVIMRC<CR>", "edit configuration file" },
            ["<leader>cr"] = { ":source $MYVIMRC<CR>", "reload configuration file" },
        },
    },
    Buffers = {
        n = {
            ["sv"] = { ":vnew<CR>", "New buffer with split vertical" },
            ["sh"] = { ":new<CR>", "New buffer with split horizontal" },

            ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer in the bufferline" },
            ["<A-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer in the bufferline" },

            ["<leader>q"] = { "<cmd>Bdelete<CR>", "Safe buffer delete" },
        },
    },
    NvimTree = {
        n = {
            ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "toggle nvimtree" },
            ["<leader>tr"] = { "<cmd>NvimTreeRefresh<CR>", "refresh nvimtree" },
            ["<leader>tf"] = { "<cmd>NvimTreeFocus<CR>", "focus nvimtree" },
        },
    },
    LSP = {
        n = {
            ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open diagnostic float" },
            ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "goto previous diagnostic" },
            ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "goto next diagnostic" },
            ["<leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "show diagnostic locations" },
            ["<leader>aa"] = { "<cmd>lua vim.diagnostic.setqflist()<CR>", "show all diagnostics in workspace" },
            ["<leader>ae"] = { "<cmd>lua vim.diagnostic.setqflist({severity = \"E\"})<CR>",
                "show error diagnostics in workspace" },
            ["<leader>aw"] = { "<cmd>lua vim.diagnostic.setqflist({severity = \"W\"})<CR>",
                "show warn diagnostics in workspace" },

            ["gD"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "go to definition" },
            ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "show signature help" },
            ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "show all implementations" },
            ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "show all references" },
            ["gds"] = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "show all symbols in the buffer" },
            ["gws"] = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "show all symbols in the workspace" },
            ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "show description of symbol" },

            ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename symbol" },
            ["<leader>f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "format buffer" },
            ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "show code actions" },
            ["<leader>cl"] = { "<cmd>lua vim.lsp.codelens.run()<CR>", "run code lens" },
        },
    },
    DAP = {
        n = {
            ["<leader>dc"] = { "<cmd>lua require(\"dap\").continue()<CR>", "Start/continue to debug" },
            ["<leader>dr"] = { "<cmd>lua require(\"dap\").repl.toggle()<CR>", "Toggle REPL" },
            ["<leader>dh"] = { "<cmd>lua require(\"dap.ui.widgets\").hover()<CR>", "" },
            ["<leader>dt"] = { "<cmd>lua require(\"dap\").toggle_breakpoint()<CR>", "Toggle breakpoint" },
            ["<leader>dso"] = { "<cmd>lua require(\"dap\").step_over()<CR>", "Step over to point" },
            ["<leader>dsi"] = { "<cmd>lua require(\"dap\").step_into()<CR>", "Step into the point" },
            ["<leader>dl"] = { "<cmd>lua require(\"dap\").run_last()<CR>", "Run last" },
            ["<leader>du"] = { "<cmd>lua require(\"dapui\").toggle()<CR>", "Toggle Dap UI" },
        },
    },
    Telescope = {
        n = {
            ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find Files" },
            ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
            ["<leader>fb"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
            ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
            ["<leader>fn"] = {
                function()
                    require("telescope").extensions.notify.notify()
                end, "Notifications"
            },
            ["<leader>fe"] = { "<cmd>Telescope env<CR>", "Environment Variables" },
            ["<leader>fr"] = { "<cmd>Telescope frecency<CR>", "Frecency" },
            ["<leader>fo"] = { "<cmd>Telescope oldfiles<CR>", "Recently Files" },
            ["<leader>fp"] = { "<cmd>Telescope project<CR>", "Projects" },
        },
    },
    Terminal = {
        t = {
            ["<esc>"] = { [[<C-\><C-n>]], "Escape terminal" },

            ["<C-h>"] = { "<C-\\><C-n><C-w>h", "Jump to left" },
            ["<C-j>"] = { "<C-\\><C-n><C-w>j", "Jump to down" },
            ["<C-k>"] = { "<C-\\><C-n><C-w>k", "Jump to up" },
            ["<C-l>"] = { "<C-\\><C-n><C-w>l", "Jump to right" },
        },
    }
}

local installed, which_key = pcall(require, "which-key")
local bind

if installed then
    bind = function(keybind, info, opts)
        which_key.register({ [keybind] = info }, opts)
    end
else
    bind = function(keybind, info, opts)
        local mode = opts.mode
        opts.mode = nil
        vim.keymap.set(mode, keybind, info[1], opts)
    end
end

local terminal_mappings = {}

for _, section in pairs(vim.deepcopy(mappings)) do
    for mode, mode_mappings in pairs(section) do
        for keybind, info in pairs(mode_mappings) do
            if mode == 't' then
                terminal_mappings[keybind] = info
            else
                local default = merge_tb("force", { mode = mode }, {})
                local opts = merge_tb("force", default, info.opts or {})
                info.opts = nil
                bind(keybind, info, opts)
            end
        end
    end
end

function _G.set_terminal_keymaps()
    for keybind, info in pairs(terminal_mappings) do
        vim.api.nvim_buf_set_keymap(0, 't', keybind, info[1], { noremap = true })
    end
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
