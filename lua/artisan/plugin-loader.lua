local fn = vim.fn

local install = function(path)
    vim.notify("Installing packer...")
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", path }

    vim.cmd "packadd packer.nvim"
    require("artisan.plugins")
    vim.cmd "PackerSync"
end

local path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(path)) ~= 0 then
    install(path)
end

vim.cmd "packadd packer.nvim"
require("artisan.plugins")
