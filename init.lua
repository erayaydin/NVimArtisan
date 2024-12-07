-- Enable experimental lua module loader to speed up
vim.loader.enable()

-- Check nvim version
if vim.fn.has("nvim-0.10") ~= 1 then
  error("Need NeoVim v0.10+")
end

-- Check NVimArtisan installation
local ok, artisan = pcall(require, "nvim-artisan")
if not ok then
  error(("Error loading NVimArtisan...\n\n%s"):format(artisan))
end

-- Start NVimArtisan
artisan:run()
