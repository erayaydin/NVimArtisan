local merge_tb = vim.tbl_deep_extend

local mappings = {
    General = {
        n = {
            -- Turn off highlight
            ["<ESC>"] = { "<CMD>noh<CR>", " no highlight" },

            -- Switch splits
            ["<C-H>"] = { "<C-W>h", "switch to left" },
            ["<C-L>"] = { "<C-W>l", "switch to right" },
            ["<C-K>"] = { "<C-W>k", "switch to up" },
            ["<C-J>"] = { "<C-W>j", "switch to down" },

            -- Resize
            ["<A-H>"] = { "<CMD>vertical resize +2<CR>", "increase vertical size" },
            ["<A-L>"] = { "<CMD>vertical resize -2<CR>", "decrease vertical size" },
            ["<A-K>"] = { "<CMD>:resize -2<CR>", "decrease size"},
            ["<A-J>"] = { "<CMD>:resize +2<CR>", "increase size" },

            -- Save file
            ["<C-S>"] = { "<CMD>w<CR>", "save file" },
            ["<C-C>"] = { "<CMD>%y+<CR>", "copy file content" },

            -- Line Number
            ["<leader>ln"] = { "<CMD>set nu!<CR>", "toggle line numbers" },
            ["<leader>lr"] = { "<CMD>set rnu!<CR>", "toggle relative number" },
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

            ["<Tab>"] = { "<CMD>BufferNext<CR>", "Next buffer in the bufferline" },
            ["<A-Tab>"] = { "<CMD>BufferPrev<CR>", "Previous buffer in the bufferline" },

            ["<leader><Tab>"] = { "<CMD>BufferMoveNext<CR>", "Move buffer to next" },
            ["<leader><A-Tab>"] = { "<CMD>BufferMovePrevious<CR>", "Move buffer to prev" },

            ["<leader>b*"] = { "<CMD>BufferPin<CR>", "Pin buffer" },

            ["<leader>bp"] = { "<CMD>BufferPick<CR>", "Pick buffer by keyword" },
            ["<leader>bd"] = { "<CMD>BufferPickDelete<CR>", "Delete buffer by keyword" },

            ["<leader>bon"] = { "<CMD>BufferOrderByBufferNumber<CR>", "Sort buffers by buffer number" },
            ["<leader>bod"] = { "<CMD>BufferOrderByDirectory<CR>", "Sort buffers by directory" },
            ["<leader>bol"] = { "<CMD>BufferOrderByLanguage<CR>", "Sort buffers by language" },
            ["<leader>bow"] = { "<CMD>BufferOrderByWindowNumber<CR>", "Sort buffers by window number" },

            ["<leader>bw"] = { "<CMD>BufferWipeout<CR>", "Wipeout all buffers" },

            ["<leader>bcc"] = { "<CMD>BufferCloseAllButCurrent<CR>", "Close all buffers but current" },
            ["<leader>bcv"] = { "<CMD>BufferCloseAllButVisible<CR>", "Close all buffers but visible" },
            ["<leader>bcp"] = { "<CMD>BufferCloseAllButPinned<CR>", "Close all buffers but pinned" },
            ["<leader>bc*"] = { "<CMD>BufferCloseAllButCurrentOrPinned<CR>", "Close all buffers but current or pinned" },
            ["<leader>bch"] = { "<CMD>BufferCloseBuffersLeft<CR>", "Close all left buffers" },
            ["<leader>bcl"] = { "<CMD>BufferCloseBuffersRight<CR>", "Close all right buffers" },

            ["<leader>b1"] = { "<CMD>BufferGoto 1<CR>", "Go to buffer 1" },
            ["<leader>b2"] = { "<CMD>BufferGoto 2<CR>", "Go to buffer 2" },
            ["<leader>b3"] = { "<CMD>BufferGoto 3<CR>", "Go to buffer 3" },
            ["<leader>b4"] = { "<CMD>BufferGoto 4<CR>", "Go to buffer 4" },
            ["<leader>b5"] = { "<CMD>BufferGoto 5<CR>", "Go to buffer 5" },
            ["<leader>b6"] = { "<CMD>BufferGoto 6<CR>", "Go to buffer 6" },
            ["<leader>b7"] = { "<CMD>BufferGoto 7<CR>", "Go to buffer 7" },
            ["<leader>b8"] = { "<CMD>BufferGoto 8<CR>", "Go to buffer 8" },
            ["<leader>b9"] = { "<CMD>BufferGoto 9<CR>", "Go to buffer 9" },
            ["<leader>b0"] = { "<CMD>BufferLast<CR>", "Go to last buffer" },

            ["<leader>q"] = { "<cmd>BufferClose<CR>", "Buffer delete" },
        },
    },
    NvimTree = {
        n = {
            ["<C-n>"] = { "<CMD>NvimTreeToggle<CR>", "toggle nvimtree" },
            ["<leader>nr"] = { "<CMD>NvimTreeRefresh<CR>", "refresh nvimtree" },
            ["<leader>nf"] = { "<CMD>NvimTreeFocus<CR>", "focus nvimtree" },
        },
    },
    LSP = {
        n = {
            ["<leader>e"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Open diagnostic float" },
            ["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "goto previous diagnostic" },
            ["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "goto next diagnostic" },
            ["<leader>q"] = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "show diagnostic locations" },
            ["<leader>aa"] = { "<CMD>lua vim.diagnostic.setqflist()<CR>", "show all diagnostics in workspace" },
            ["<leader>ae"] = { "<CMD>lua vim.diagnostic.setqflist({severity = \"E\"})<CR>",
                "show error diagnostics in workspace" },
            ["<leader>aw"] = { "<CMD>lua vim.diagnostic.setqflist({severity = \"W\"})<CR>",
                "show warn diagnostics in workspace" },

            ["gD"] = { "<CMD>lua vim.lsp.buf.definition()<CR>", "go to definition" },
            ["gs"] = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "show signature help" },
            ["gI"] = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "show all implementations" },
            ["gr"] = { "<CMD>lua vim.lsp.buf.references()<CR>", "show all references" },
            ["gds"] = { "<CMD>lua vim.lsp.buf.document_symbol()<CR>", "show all symbols in the buffer" },
            ["gws"] = { "<CMD>lua vim.lsp.buf.workspace_symbol()<CR>", "show all symbols in the workspace" },
            ["K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "show description of symbol" },

            ["<leader>rn"] = { "<CMD>lua vim.lsp.buf.rename()<CR>", "rename symbol" },
            ["<leader>cf"] = { "<CMD>lua vim.lsp.buf.format { async = true }<CR>", "format buffer" },
            ["<leader>ca"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "show code actions" },
            ["<leader>cl"] = { "<CMD>lua vim.lsp.codelens.run()<CR>", "run code lens" },
        },
    },
    Trouble = {
        n = {
            ["<leader>tt"] = { "<CMD>TroubleToggle<CR>", "Toggle Trouble window" },
            ["<leader>tw"] = { "<CMD>TroubleToggle workspace_diagnostic<CR>", "Toggle Trouble window with workspace diagnostics" },
            ["<leader>td"] = { "<CMD>TroubleToggle document_diagnostic<CR>", "Toggle Trouble window with document only diagnostics" },
            ["<leader>tq"] = { "<CMD>TroubleToggle quickfix<CR>", "Toggle Trouble window for quickfix items" },
            ["<leader>tl"] = { "<CMD>TroubleToggle loclist<CR>", "Toggle Trouble window for location list" },
        }
    },
    DAP = {
        n = {
            ["<leader>dc"] = { "<CMD>lua require(\"dap\").continue()<CR>", "Start/continue to debug" },
            ["<leader>dr"] = { "<CMD>lua require(\"dap\").repl.toggle({height = 10})<CR>", "Toggle REPL" },
            ["<leader>dh"] = { "<CMD>lua require(\"dap.ui.widgets\").hover()<CR>", "" },
            ["<leader>dt"] = { "<CMD>lua require(\"dap\").toggle_breakpoint()<CR>", "Toggle breakpoint" },
            ["<leader>dso"] = { "<CMD>lua require(\"dap\").step_over()<CR>", "Step over to the point" },
            ["<leader>dsi"] = { "<CMD>lua require(\"dap\").step_into()<CR>", "Step into the point" },
            ["<leader>dl"] = { "<CMD>lua require(\"dap\").run_last()<CR>", "Run last" },
            ["<leader>du"] = { "<CMD>lua require(\"dapui\").toggle()<CR>", "Toggle Dap UI" },
        },
    },
    Telescope = {
        n = {
            ["<leader>ff"] = { "<CMD>Telescope find_files<CR>", "Find Files" },
            ["<leader>fg"] = { "<CMD>Telescope live_grep<CR>", "Live Grep" },
            ["<leader>fb"] = { "<CMD>Telescope buffers<CR>", "Buffers" },
            ["<leader>fh"] = { "<CMD>Telescope help_tags<CR>", "Help Tags" },
            ["<leader>fn"] = {
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require("telescope").extensions.notify.notify()
                end, "Notifications"
            },
            ["<leader>fe"] = { "<CMD>Telescope env<CR>", "Environment Variables" },
            ["<leader>fr"] = { "<CMD>Telescope frecency<CR>", "Frecency" },
            ["<leader>fo"] = { "<CMD>Telescope oldfiles<CR>", "Recently Files" },
            ["<leader>fp"] = { "<CMD>Telescope project<CR>", "Projects" },
        },
    },
    Terminal = {
        t = {
            ["<leader><esc>"] = { [[<C-\><C-N>]], "Escape terminal" },

            ["<C-H>"] = { "<C-\\><C-N><C-W>h", "Jump to left" },
            ["<C-J>"] = { "<C-\\><C-N><C-W>j", "Jump to down" },
            ["<C-K>"] = { "<C-\\><C-n><C-w>k", "Jump to up" },
            ["<C-L>"] = { "<C-\\><C-n><C-w>l", "Jump to right" },
        },
    },
    Rest = {
        n = {
            ["<leader>hr"] = { "<Plug>RestNvim", "Run REST Http Request" },
            ["<leader>hc"] = { "<Plug>RestNvimPreview", "Show Http Request Preview (curl)" },
            ["<leader>hl"] = { "<Plug>RestNvimLast", "Re-run last REST HTTP Request" },
        },
    },
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
