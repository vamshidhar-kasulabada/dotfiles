-- Pull in the wezterm API
local wezterm = require("wezterm")


-- Select and return backdrop path
-- return select_random_backdrop(folder)


-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
config.colors = {
    foreground = "white",
    split = "white"
}

config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe'};

config.window_decorations = "RESIZE"
config.window_background_image_hsb = {
    brightness = 0.01,
    hue = 1,
    saturation = 1,
}

--[[
    * Auto - Same as Disable
    * Disable
    * Acrylic
    * Mica
    * Tabbed
--]]
-- config.win32_system_backdrop = "Acrylic"

-- 0.0 to 1.0
-- config.window_background_opacity = 0.7

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

