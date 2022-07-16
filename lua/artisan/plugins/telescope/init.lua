local installed, telescope = pcall(require, "telescope")

if not installed then
    return
end

telescope.setup({
    defaults = {
        -- Add hidden and `.git` filtering (last 2 args)
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
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
        },
    },
})

-- Load FZF native extension
telescope.load_extension("fzf")
