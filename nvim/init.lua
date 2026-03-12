local config_path = vim.fn.stdpath("config")
package.path = package.path .. ";" .. config_path .. "/?.lua"
package.path = package.path .. ";" .. config_path .. "/?/init.lua"

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("config.lua.vim")
require("config.lua.plugins")
require("config.lua.general")
require("config.lua.lsp")
