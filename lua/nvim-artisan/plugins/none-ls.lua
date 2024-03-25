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

null_ls.setup({
  sources = {
    -- Code Actions
    null_ls.builtins.code_actions.gitrebase,
    gitsigns,
  },
})
