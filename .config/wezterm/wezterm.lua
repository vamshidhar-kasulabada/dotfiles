--pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.leader = { key = "l", mods = "CTRL", timeout_milliseconds = 1000 }

config.font_size = 18

config.colors = {
	foreground = "white",
	split = "white",
}

-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- 0.0 to 1.0
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 100
-- 0.0 to 1.0
-- config.text_background_opacity = 0.7

-- only absolute path works
-- config.window_background_image = "/Users/vamshidhar/.config/wezterm/backdrops/japanese-temple.jpg"
config.window_background_image = require("lib.random_backdrop")


config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.01,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1,

	-- You can adjust the saturation also.
	saturation = 1,
}

config.keys = {
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.CopyTo("Clipboard"),
	},
}

return config
