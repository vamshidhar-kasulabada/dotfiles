-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

-- config.default_prog = { 'C:\\Users\\6131202\\AppData\\Local\\Programs\\Git\\bin\\bash.exe', '--login','-i' }
-- config.default_prog = {'C:\\Program Files\\Git\\bin\\bash.exe' ,'--login', '-i'}
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }
--config.default_prog = { '%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe'};
-- config.default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe'};

config.window_decorations = "RESIZE"

--[[
    * Auto - Same as Disable
    * Disable
    * Acrylic
    * Mica
    * Tabbed
--]]
config.win32_system_backdrop = "Acrylic"

-- 0.0 to 1.0
config.window_background_opacity = 0.7

config.leader = { key = "l", mods = "CTRL", timeout_milliseconds = 1000 }

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
	{ key = "v", mods = "LEADER", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "LEADER", action = wezterm.action.CopyTo("Clipboard") },
}

-- and finally, return the configuration to wezterm
return config
