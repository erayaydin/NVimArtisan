local installed, comment = pcall(require, "Comment")

if not installed then
    return
end

comment.setup()
