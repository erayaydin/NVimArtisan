local installed, mason_nvim_dap = pcall(require, 'mason-nvim-dap')

if not installed then
  return
end

mason_nvim_dap.setup({
  ensure_installed = { "python", "php" },
  handlers = {
    function(config)
      mason_nvim_dap.default_setup(config)
    end,
    php = function(config)
      -- Use XDebug v3 port
      config.configurations[1].port = "9003"

      mason_nvim_dap.default_setup(config)
    end,
    -- Work in progress for scala
    -- @See https://github.com/jay-babu/mason-nvim-dap.nvim/issues/124
  },
})
