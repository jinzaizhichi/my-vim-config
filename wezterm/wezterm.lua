local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font & Display
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 16.0

-- Window Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_close_confirmation = 'NeverPrompt'

-- Terminal Behavior
config.scrollback_lines = 10000
config.cursor_blink_rate = 10

-- Performance & Features
config.max_fps = 120
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'
config.enable_kitty_graphics = true
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- System
config.automatically_reload_config = true
config.check_for_updates = true

-- Keta Theme Colors
config.colors = {
  background = '#000000',
  foreground = '#FFFFFF',
  cursor_bg = '#B56F88',
  cursor_fg = '#000000',
  cursor_border = '#B56F88',
  selection_fg = '#FFFFFF',
  selection_bg = '#808080',

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

-- Key Bindings
config.keys = {
  { key = 'v', mods = 'CMD', action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'c', mods = 'CMD', action = wezterm.action.CopyTo 'Clipboard' },
  { key = '=', mods = 'CMD', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CMD', action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'CMD', action = wezterm.action.ResetFontSize },
}

return config
