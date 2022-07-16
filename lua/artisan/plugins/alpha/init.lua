local installed, alpha = pcall(require, "alpha")

if not installed then
    return
end

local header = {
    type = "text",
    val = {
        [[ █████╗ ██████╗ ████████╗██╗███████╗ █████╗ ███╗   ██╗]],
        [[██╔══██╗██╔══██╗╚══██╔══╝██║██╔════╝██╔══██╗████╗  ██║]],
        [[███████║██████╔╝   ██║   ██║███████╗███████║██╔██╗ ██║]],
        [[██╔══██║██╔══██╗   ██║   ██║╚════██║██╔══██║██║╚██╗██║]],
        [[██║  ██║██║  ██║   ██║   ██║███████║██║  ██║██║ ╚████║]],
        [[╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝]],
    },
    opts = {
        position = "center",
        hl = "Type",
    },
}

local function button(key, text, keybind)

    local opts = {
        position = "center",
        shortcut = key,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }

    local safe = key:gsub("%s", ""):gsub("SPC", "<leader>")

    if keybind then
        opts.keymap = {
            "n",
            safe,
            keybind,
            { noremap = true, silent = true, nowait = true },
        }
    end

    local function on_press()
        local action = vim.api.nvim_replace_termcodes(safe .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(action, "t", false)
    end

    return {
        type = "button",
        val = text,
        on_press = on_press,
        opts = opts,
    }
end

local content = {
    type = "group",
    val = {
        button("e", "  New file", "<cmd>ene <CR>"),
        button("SPC f f", "  Find file"),
        button("SPC f o", "  Recently opened files"),
        button("SPC f r", "  Frecency/MRU"),
        button("SPC f g", "  Find word"),
        button("SPC f p", "  Projects"),
    },
    opts = {
        spacing = 1,
    },
}

local footer = {
    type = "text",
    val = "v0.3.0",
    opts = {
        position = "center",
        hl = "Number",
    },
}

alpha.setup({
    layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        content,
        footer,
    },
    opts = {
        margin = 5,
    },
})

