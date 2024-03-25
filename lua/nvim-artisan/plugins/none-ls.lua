local installed, null_ls = pcall(require, "null-ls")

if not installed then
  return
end

local gitsigns = null_ls.builtins.code_actions.gitsigns.with({
  config = {
    filter_actions = function(title)
      return title:lower():match("blame") == nil
    end,
  },
})

local alex = null_ls.builtins.diagnostics.alex.with({
  command = "alexjs",
})

local sqlfluff = null_ls.builtins.diagnostics.sqlfluff.with({
  extra_args = { "--dialect", "postgres" },
})

null_ls.setup({
  sources = {
    -- Code Actions
    null_ls.builtins.code_actions.gitrebase,
    gitsigns,
    -- Diagnostics
    null_ls.builtins.diagnostics.actionlint,
    alex,
    null_ls.builtins.diagnostics.ansiblelint,
    null_ls.builtins.diagnostics.cmake_lint,
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.dotenv_linter,
    null_ls.builtins.diagnostics.editorconfig_checker,
    null_ls.builtins.diagnostics.phpcs,
    null_ls.builtins.diagnostics.phpmd,
    null_ls.builtins.diagnostics.phpstan,
    null_ls.builtins.diagnostics.protolint,
    sqlfluff,
  },
})
