-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.tab_bar_at_bottom = true
config.window_background_opacity = 0.999
config.window_decorations = "RESIZE"
config.window_close_confirmation = 'AlwaysPrompt'

-- config.color_scheme = 'Batman'
config.color_scheme = 'Dracula (Official)'

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title

  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end

  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    if tab.is_active then
      return {
        { Background = { Color = '#7c4d9c' } },
        { Text = ' ' .. title .. ' ' },
      }
    end
    return title
  end
)

-- and finally, return the configuration to wezterm
return config
