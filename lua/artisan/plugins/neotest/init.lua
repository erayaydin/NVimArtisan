local installed, neotest = pcall(require, "neotest")

if not installed then
    return
end

neotest.setup({
    adapters = {
        require("neotest-phpunit"),
        require("neotest-pest"),
    },
})
