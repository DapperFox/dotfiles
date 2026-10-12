local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular' })

-- Attach to the 'main' tmux session, creating it if needed
config.default_prog = { '/opt/homebrew/bin/tmux', 'new-session', '-A', '-s', 'main' }

-- Shared palette selected by `terminal-theme nord|mocha|onedark`.
local theme_path = wezterm.home_dir .. '/.config/terminal-theme/wezterm.lua'
wezterm.add_to_config_reload_watch_list(theme_path)
local theme_ok, theme = pcall(dofile, theme_path)
if not theme_ok or type(theme) ~= 'table' or type(theme.scheme) ~= 'string' then
  wezterm.log_warn('Unable to load terminal-theme; using Nord. ' .. tostring(theme))
  theme = {
    scheme = 'nord',
    titlebar = '#4c566a',
    inactive_titlebar = '#2e3440',
  }
end

config.color_scheme = theme.scheme
config.colors = theme.colors

-- Text and cursor
config.default_cursor_style = 'SteadyUnderline'
config.font = font
config.font_size = 18.0
config.line_height = 1.1
config.scrollback_lines = 10000

-- Window and tabs
config.window_frame = {
  active_titlebar_bg = theme.titlebar,
  inactive_titlebar_bg = theme.inactive_titlebar,
  font_size = 15.0,
  font = font,
}

config.window_padding = {
  left = 8,
  right = 8,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true

return config
