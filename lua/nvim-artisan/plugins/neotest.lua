local installed, neotest = pcall(require, "neotest")

if not installed then
  return
end

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-scala"),
    require("neotest-phpunit"),
    require("neotest-pest"),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
