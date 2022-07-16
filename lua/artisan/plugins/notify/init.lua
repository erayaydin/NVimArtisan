local installed, notify = pcall(require, "notify")

if not installed then
    return
end

vim.notify = notify
vim.notify_once = notify
require("telescope").load_extension("notify")
