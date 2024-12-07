local installed, trouble = pcall(require, "trouble")

if not installed then
  return
end

trouble.setup(
  {
    auto_close = true,
    signs = {
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "﫠"
    },
  }
)
