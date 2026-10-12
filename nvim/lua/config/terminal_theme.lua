local M = {}
local applied

local function selected()
  local file = io.open(vim.fn.expand("~/.config/terminal-theme/current"), "r")
  if not file then return "nord" end
  local name = file:read("*l")
  file:close()
  return name
end

function M.apply(force)
  local name = selected()
  if name == applied and not force then return end
  if name == "mocha" then
    require("catppuccin").setup({ flavour = "mocha" })
    vim.cmd.colorscheme("catppuccin-mocha")
  elseif name == "nord" then
    vim.cmd.colorscheme("nord")
  else
    require("onedark").setup({ style = "dark" })
    require("onedark").load()
  end
  applied = name
  if package.loaded["lualine"] then
    local lualine = require("lualine")
    local config = lualine.get_config()
    config.options.theme = "auto"
    lualine.setup(config)
  end
end

function M.setup()
  M.apply()
  vim.api.nvim_create_user_command("TerminalTheme", function() M.apply(true) end, {})
  local group = vim.api.nvim_create_augroup("TerminalTheme", { clear = true })
  vim.api.nvim_create_autocmd("FocusGained", {
    group = group,
    callback = function() M.apply() end,
  })
end

return M
