require("artisan.settings")
require("artisan.maps")
require("artisan.plugins")
require("artisan.theme")

local dblist = {}
dblist["local"] = "postgres://postgres:secret@localhost:5432"
vim.g.dbs = dblist

