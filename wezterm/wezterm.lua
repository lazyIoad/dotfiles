local wezterm = require("wezterm")
local act = wezterm.action
local rose_pine = {
	dark = {
		colors = require("lua/rose-pine").colors(),
		window_frame = require("lua/rose-pine").window_frame(),
	},
	moon = {
		colors = require("lua/rose-pine-moon").colors(),
		window_frame = require("lua/rose-pine-moon").window_frame(),
	},
	light = {
		colors = require("lua/rose-pine-dawn").colors(),
		window_frame = require("lua/rose-pine-dawn").window_frame(),
	},
}

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("BlexMono Nerd Font Mono")
config.font_size = 13
config.line_height = 1

function color_data(appearance)
	if appearance:find("Dark") then
		return rose_pine.moon
	else
		return rose_pine.light
	end
end

local color_scheme = color_data(wezterm.gui.get_appearance())
config.colors = color_scheme.colors
config.window_frame = color_scheme.window_frame
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.window_decorations = "RESIZE"

config.keys = {
	{
		key = "P",
		mods = "SUPER|SHIFT",
		action = act.ActivateCommandPalette,
	},
	{
		key = '"',
		mods = "SUPER|SHIFT",
		action = act.SplitVertical,
	},
	{
		key = "Enter",
		mods = "SUPER|SHIFT",
		action = act.SplitHorizontal,
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
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
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({ key = "b", mods = "ALT" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "ALT" }),
	},
}

return config
