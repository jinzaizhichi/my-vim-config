local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font & Display
config.font = wezterm.font('0xProto Nerd Font Mono')
config.font_size = 14.0

-- Window Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.enable_scroll_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.native_macos_fullscreen_mode = true

-- Terminal Behavior
config.scrollback_lines = 10000
config.cursor_blink_rate = 10
config.term = 'xterm-256color'

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

  tab_bar = {
    background = '#000000',
    active_tab = {
      bg_color = '#B56F88',
      fg_color = '#000000',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#141414',
      fg_color = '#FFFFFF',
    },
    inactive_tab_hover = {
      bg_color = '#7F6D9E',
      fg_color = '#FFFFFF',
    },
    new_tab = {
      bg_color = '#141414',
      fg_color = '#FFFFFF',
    },
    new_tab_hover = {
      bg_color = '#7F6D9E',
      fg_color = '#FFFFFF',
    },
  },
}

-- Key Bindings
config.keys = {
  -- Standard clipboard and font controls
  { key = 'v', mods = 'CMD', action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'c', mods = 'CMD', action = wezterm.action.CopyTo 'Clipboard' },
  { key = '=', mods = 'CMD', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CMD', action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'CMD', action = wezterm.action.ResetFontSize },

  -- Tab management (avoiding conflicts with vim Leader+t)
  { key = 'n', mods = 'CMD', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentTab { confirm = true } },

  -- Window management
  { key = 'n', mods = 'CMD|SHIFT', action = wezterm.action.SpawnWindow },

  -- Tab navigation (using CMD+number, avoiding vim conflicts)
  { key = '1', mods = 'CMD', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'CMD', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'CMD', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'CMD', action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'CMD', action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'CMD', action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'CMD', action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'CMD', action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'CMD', action = wezterm.action.ActivateTab(8) },

  -- Tab navigation with brackets (common terminal shortcut)
  { key = '[', mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = ']', mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(1) },
}

return config
