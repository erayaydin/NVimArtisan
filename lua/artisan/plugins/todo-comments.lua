local installed, todo_comments = pcall(require, "todo-comments")

if not installed then
    return
end

todo_comments.setup({
    keywords = {
        FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = {
            icon = " ",
            color = "info",
        },
        HACK = {
            icon = " ",
            color = "warning",
        },
        WARN = {
            icon = " ",
            color = "warning",
            alt = { "WARNING", "XXX" },
        },
        PERF = {
            icon = " ",
            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
        },
        NOTE = {
            icon = " ",
            color = "hint",
            alt = { "INFO" },
        },
    },
})
