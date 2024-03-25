-- Start impatient ASAP
pcall(require, "impatient")

-- Check nvim version
if vim.fn.has('nvim-0.9') ~= 1 then
    error('Need NeoVim v0.9+')
end

-- Check NVimArtisan installation
local ok, artisan = pcall(require, 'artisan')
if not ok then
    error(('Error loading NVimArtisan...\n\n%s'):format(artisan))
end

-- Start NVimArtisan
artisan:run()
