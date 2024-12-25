-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.window_background_opacity = 0.999

-- config.color_scheme = 'Batman'
config.color_scheme = 'Dracula (Official)'

-- config.window_decorations = "NONE"

-- and finally, return the configuration to wezterm
return config
