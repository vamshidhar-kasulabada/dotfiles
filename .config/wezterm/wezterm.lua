--pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 18

config.colors = {
	foreground = "white",
    split = "white"
}

-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- 0.0 to 1.0
config.window_background_opacity = 0.8
config.macos_window_background_blur = 100
-- 0.0 to 1.0
config.text_background_opacity = 0.7



-- only absolute path works
-- config.window_background_image = "/Users/vamshidhar/.config/wezterm/back_image.jpg"

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.05,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1,

  -- You can adjust the saturation also.
  saturation = 1,
}


config.keys = {
	{
		key = "n",
		mods = "CTRL|CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })
	},
	{
		key = "m",
		mods = "CTRL|CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })
	},
	{
		key = "w",
		mods = "CTRL|CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true })
	},
    {
		key = "h",
		mods = "CTRL|CMD",
        action = wezterm.action.ActivatePaneDirection("Left")
    },
    {
		key = "j",
		mods = "CTRL|CMD",
        action = wezterm.action.ActivatePaneDirection("Down")
    },
    {
		key = "k",
		mods = "CTRL|CMD",
        action = wezterm.action.ActivatePaneDirection("Up")
    },
    {
		key = "l",
		mods = "CTRL|CMD",
        action = wezterm.action.ActivatePaneDirection("Right")
    },
}


return config
