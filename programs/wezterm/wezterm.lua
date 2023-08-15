local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 13
config.line_height = 1.1

config.colors = {
  foreground = '#FFFFFF',
  background = '#000000',
  selection_fg = '#FFFFFF',
  selection_bg = '#777777',
  cursor_fg = '#000000',
  cursor_bg = '#FFFFFF',

  ansi = {
    '#000000',
    '#EE0100',
    '#78C1B4',
    '#FFB545',
    '#9494F3',
    '#DAB5F9',
    '#72DEC2',
    '#DDDDDD',
  },

  brights = {
    '#777777',
    '#EE0100',
    '#78C1B4',
    '#FFB545',
    '#9494F3',
    '#DAB5F9',
    '#72DEC2',
    '#FFFFFF',
  },

  tab_bar = {
    background = '#000000',
  },
}

config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'

config.keys = {
  {
    key = "p",
    mods = "SUPER|SHIFT",
    action = act.ActivateCommandPalette,
  },
  {
    key = "Enter",
    mods = "SUPER",
    action = act.SplitVertical,
  },
  {
    key = "Enter",
    mods = "SUPER|SHIFT",
    action = act.SplitHorizontal,
  },
  {
    key = "k",
    mods = "SUPER",
    action = act.ClearScrollback "ScrollbackAndViewport",
  },
  {
    key = "1",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(0),
  },
  {
    key = "2",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(1),
  },
  {
    key = "3",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(2),
  },
  {
    key = "4",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(3),
  },
  {
    key = "5",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(4),
  },

  {
    key = "6",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(5),
  },

  {
    key = "7",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(6),
  },

  {
    key = "8",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(7),
  },
  {
    key = "9",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(8),
  },
  {
    key = "0",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(9),
  },
}

return config
