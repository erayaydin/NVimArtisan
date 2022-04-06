-- vim:foldmethod=marker

-- Helper function for mapping
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader key to space
vim.g.mapleader = " "

-- Do not copy the replaced text after pasting
map("v", "p", "\"_dP")

-- Unlimited indent when you visual selected text.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- NeoVim Configuration {{{
-- Edit configuration file
map("n", "<leader>ce", ":e $MYVIMRC<CR>")
-- Reload configuration file
map("n", "<leader>cr", ":source $MYVIMRC<CR>")
-- }}}

-- Splits {{{
-- Vertical split with new buffer
map("n", "sv", ":vnew<CR>")
-- Horizontal split with new buffer
map("n", "sh", ":new<CR>")
-- }}}

-- Buffers {{{
-- Bir önceki buffer'a geç
map("n", "<A-Tab>", ":BufferLineCyclePrev<CR>")
-- Bir sonraki buffer'a geç
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
-- }}}

-- Resize {{{
map("n", "<C-h>", ":call ResizeLeft(3)<CR><Esc>")
map("n", "<C-l>", ":call ResizeRight(3)<CR><Esc>")
map("n", "<C-k>", ":call ResizeUp(1)<CR><Esc>")
map("n", "<C-j>", ":call ResizeDown(1)<CR><Esc>")
-- }}}

-- Dashboard {{{

-- Session
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")

-- }}}

-- ToggleTerm {{{
function _G.set_terminal_keymaps()
  map("t", "<esc>", "<C-\\><C-n>")
  map("t", "<A-h>", "<c-\\><c-n><c-w>h")
  map("t", "<A-j>", "<c-\\><c-n><c-w>j")
  map("t", "<A-k>", "<c-\\><c-n><c-w>k")
  map("t", "<A-l>", "<c-\\><c-n><c-w>l")

  map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
  map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
  map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
  map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- }}}

-- Kommentary {{{
vim.g.kommentary_create_default_mappings = false
-- }}}

-- LSP {{{

-- Diagnostic penceresini açar
map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- Bir önceki diagnostic noktasına atar
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
-- Bir sonraki diagnostic noktasına atar
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
-- Diagnostic noktalarını gösteren quickfix ekranını açar
map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
-- Tüm workspace içerisindeki diagnosticleri gösterir
map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]])
-- Tüm workspace içerisindeki hataları gösterir
map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]])
-- Tüm workspace içerisindeki uyarıları gösterir
map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]])

-- İlgili tanımlamaya gider
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- Üzerinde durduğu sembolün açıklamasını gösteren pencereyi açar
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- Üzerinde durduğu sembolün imzası hakkında bilgi veren pencereyi açar
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
-- İlgili sembolün tüm implementasyonlarını listeleyen quickfix ekranını açar
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- İlgili sembolün tüm referanslarını döndürür
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- Buffer'daki tüm sembolleri listeleyen quickfix ekranını açar
map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
-- Workspace içerisindeki tüm sembolleri listeleyen quickfix ekranını açar
map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
-- İlgili sembolün ismini değiştirir
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
-- Buffer'ı formatlar
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
-- Cursor'un bulunduğu noktada uygun olan code actionları gösterir
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- Bulunduğu satırdaki codelens'i çalıştırır
map("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>")
-- Worksheet'deki decoration mesajını tam ekran yapar
-- map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')

-- }}}

-- DAP {{{
map("n", "<leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
map("n", "<leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
map("n", "<leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
map("n", "<leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])
-- }}}

-- NVim Tree {{{
map("n", "<C-n>", ":NvimTreeToggle<CR>")
map("n", "<leader>rf", ":NvimTreeRefresh<CR>")
-- }}}
