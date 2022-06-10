local installed, telescope = pcall(require, "telescope")
if not installed then
    return
end

local previewers = require("telescope.previewers")
local job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end
    }):sync()
end

-- Find the name of the fd binary file in the operating system.
local finder = "fd"
if vim.fn.filereadable("/bin/fdfind") == 1 then
    finder = "fdfind"
end

telescope.setup {
    defaults = {
        buffer_previewer_maker = new_maker,
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
        },
        prompt_prefix = " 🔍  ",
        selection_caret = " ",
    },
    pickers = {
        find_files = {
            find_command = { finder, "--type=file", "--hidden", "--follow", "--exclude=.git"}
        },
    },
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg"
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
}

-- Load FZF native extension
telescope.load_extension("fzf")
-- Load Project extension
telescope.load_extension("project")
