local installed, cmp = pcall(require, "cmp")

if not installed then
    return
end

local mapping = cmp.mapping

local icons = {
    Text = " ",
    Method = " ",
    Function = " ",
    Constructor = "略 ",
    Field = "ﰠ",
    Variable = " ",
    Class = " ",
    Interface = " ",
    Module = " ",
    Property = " ",
    Unit = "塞 ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
}

local sources = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    luasnip = "[LuaSnip]",
    nvim_lua = "[Lua]",
    path = "[Path]",
}

cmp.setup({
    snippet = {
        expand = function(args)
            local luasnip = require("luasnip")
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
            item.kind = string.format("%s %s", item.kind, icons[item.kind])
            item.menu = (sources)[entry.source.name]

            return item
        end
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
    mapping = mapping.preset.insert({
        ["<C-d>"] = mapping.scroll_docs(-4),
        ["<C-f>"] = mapping.scroll_docs(4),
        ["<C-Space>"] = mapping.complete({}),
        ["<CR>"] = mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = mapping(function(fallback)
            local luasnip = require("luasnip")
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ["<S-Tab>"] = mapping(function(fallback)
            local luasnip = require("luasnip")
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
})
