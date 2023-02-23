local installed, notify = pcall(require, "notify")

if not installed then
    return
end

vim.notify = notify
vim.notify_once = notify

local telescope_installed, telescope = pcall(require, "telescope")

if telescope_installed then
    telescope.load_extension("notify")
end
