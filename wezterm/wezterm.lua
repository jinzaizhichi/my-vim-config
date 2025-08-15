local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font configuration
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 14.0

-- DARK SOPHISTICATED COLOR SCHEME
config.colors = {
  -- Pure black background
  background = '#000000',
  foreground = '#FFFFFF',

  -- Cursor
  cursor_bg = '#B56F88',
  cursor_fg = '#000000',
  cursor_border = '#B56F88',

  -- Selection
  selection_fg = '#FFFFFF',
  selection_bg = '#808080',

  -- ANSI colors (Normal)
  ansi = {
    '#0A0A0A', -- black
    '#C55A5A', -- red
    '#7F6D9E', -- green (purple-ish)
    '#B56F88', -- yellow (mauve)
    '#5E8C7A', -- blue (teal)
    '#9C6D9A', -- magenta (purple)
    '#78997C', -- cyan (sage)
    '#F5F5F5', -- white
  },

  -- Bright ANSI colors
  brights = {
    '#141414', -- bright black
    '#D77272', -- bright red
    '#9989B8', -- bright green (light purple)
    '#C7869E', -- bright yellow (light mauve)
    '#7AAA98', -- bright blue (light teal)
    '#B784B4', -- bright magenta (light purple)
    '#93AF8A', -- bright cyan (light sage)
    '#EBEBEB', -- bright white
  },
}

-- MINIMAL WINDOW SETUP
-- Keep topbar for fullscreen toggle, remove side borders
-- config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Disable tabs since you're using tmux
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Window behavior
config.window_close_confirmation = 'NeverPrompt'
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- Disable all the GUI stuff
config.enable_scroll_bar = false
config.scrollback_lines = 10000

-- Performance
config.max_fps = 120
config.animation_fps = 1
config.cursor_blink_rate = 0

-- Minimal key bindings (disable most default ones)
config.keys = {
  -- Keep only essential ones, let tmux handle everything else
  {
    key = 'v',
    mods = 'CMD',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = 'c',
    mods = 'CMD',
    action = wezterm.action.CopyTo 'Clipboard',
  },
}

-- Auto reload config
config.automatically_reload_config = true

return config
