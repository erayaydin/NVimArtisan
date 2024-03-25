local installed, null_ls = pcall(require, "null-ls")

if not installed then
  return
end

null_ls.setup({
  sources = {
    -- Code Actions
    null_ls.builtins.code_actions.gitrebase,
    null_ls.builtins.code_actions.gitsigns,
  },
})
