local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font & Display (keeping your preferences)
config.font = wezterm.font('0xProto Nerd Font')
config.font_size = 16.0

-- Valid font rendering improvements
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.bold_brightens_ansi_colors = true
config.font_shaper = 'Harfbuzz' -- Explicitly use HarfBuzz (usually default)
config.cell_width = 1.0         -- Adjust character cell width if needed
config.line_height = 1.0        -- Adjust line spacing
config.underline_thickness = 1  -- Control underline thickness
config.underline_position = -2  -- Control underline position

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

-- Terminal Behavior improvements
config.scrollback_lines = 50000
config.enable_scroll_bar = false
config.term = 'wezterm'

-- Performance & Features
config.max_fps = 120
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'
config.enable_kitty_graphics = true
config.animation_fps = 1
config.cursor_blink_rate = 0

-- System
config.automatically_reload_config = true
config.check_for_updates = false
config.audible_bell = 'Disabled'

-- Enhanced hyperlink rules
config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
  regex = [[\b\w+://[\w.-]+\S*\b]],
  format = '$0',
})

-- -- Keta theme
-- config.colors = {
--   background = '#000000',
--   foreground = '#FFFFFF',
--   cursor_bg = '#B56F88',
--   cursor_fg = '#000000',
--   cursor_border = '#B56F88',
--   selection_fg = '#FFFFFF',
--   selection_bg = '#808080',
--
--   ansi = {
--     '#000000',
--     '#C55A5A',
--     '#7F6D9E',
--     '#B56F88',
--     '#5E8C7A',
--     '#9C6D9A',
--     '#78997C',
--     '#F5F5F5',
--   },
--   brights = {
--     '#606060',
--     '#D77272',
--     '#9989B8',
--     '#C7869E',
--     '#7AAA98',
--     '#B784B4',
--     '#93AF8A',
--     '#EBEBEB',
--   },
--
--   tab_bar = {
--     background = '#000000',
--     active_tab = {
--       bg_color = '#B56F88',
--       fg_color = '#000000',
--       intensity = 'Bold',
--     },
--     inactive_tab = {
--       bg_color = '#141414',
--       fg_color = '#FFFFFF',
--     },
--     inactive_tab_hover = {
--       bg_color = '#7F6D9E',
--       fg_color = '#FFFFFF',
--     },
--     new_tab = {
--       bg_color = '#141414',
--       fg_color = '#FFFFFF',
--     },
--     new_tab_hover = {
--       bg_color = '#7F6D9E',
--       fg_color = '#FFFFFF',
--     },
--   },
--
--   -- Visual bell color
--   visual_bell = '#B56F88',
-- }

-- -- Psychosis theme
-- config.colors = {
--   background = '#000000',
--   foreground = '#F4F4F4',
--   cursor_bg = '#AB3FB1',
--   cursor_fg = '#000000',
--   cursor_border = '#AB3FB1',
--   selection_fg = '#F4F4F4',
--   selection_bg = '#606060',
--
--   ansi = {
--     '#000000',
--     '#CB2F2D',
--     '#9000EE',
--     '#AB3FB1',
--     '#B7306E',
--     '#52D283',
--     '#7DD275',
--     '#F4F4F4',
--   },
--   brights = {
--     '#606060',
--     '#F3BDB9',
--     '#CAA7EA',
--     '#DE99E3',
--     '#F0A1C7',
--     '#C6EED9',
--     '#CDFFC9',
--     '#F4F4F4',
--   },
--
--   tab_bar = {
--     background = '#000000',
--     active_tab = {
--       bg_color = '#AB3FB1',
--       fg_color = '#000000',
--       intensity = 'Bold',
--     },
--     inactive_tab = {
--       bg_color = '#000000',
--       fg_color = '#606060',
--     },
--     inactive_tab_hover = {
--       bg_color = '#9000EE',
--       fg_color = '#F4F4F4',
--     },
--     new_tab = {
--       bg_color = '#000000',
--       fg_color = '#606060',
--     },
--     new_tab_hover = {
--       bg_color = '#9000EE',
--       fg_color = '#F4F4F4',
--     },
--   },
--
--   -- Visual bell color
--   visual_bell = '#AB3FB1',
-- }

-- Black Metal (Burzum) - https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/wezterm/Black%20Metal%20(Burzum).toml
-- Swapped ansi slot 1 and 5 only
config.colors = {
  foreground = "#c1c1c1",
  background = "#000000",
  cursor_bg = "#c1c1c1",
  cursor_border = "#c1c1c1",
  cursor_fg = "#000000",
  selection_bg = "#c1c1c1",
  selection_fg = "#000000",
  ansi = { "#000000", "#999999", "#ddeecc", "#99bbaa", "#888888", "#5f8787", "#aaaaaa", "#c1c1c1" },
  brights = { "#333333", "#999999", "#ddeecc", "#99bbaa", "#888888", "#5f8787", "#aaaaaa", "#c1c1c1" },
}

config.window_background_gradient = {
  orientation = {
    Radial = {
      cx = 0,
      cy = 0,
      radius = 1.5,
    },
  },
  colors = {
    '#000000',
    '#131B1B',
    '#000000',
  },
}

-- Enhanced key bindings (your existing ones plus useful additions)
config.keys = {
  -- Your existing clipboard and font controls
  { key = 'v',     mods = 'CMD',       action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'c',     mods = 'CMD',       action = wezterm.action.CopyTo 'Clipboard' },
  { key = '=',     mods = 'CMD',       action = wezterm.action.IncreaseFontSize },
  { key = '-',     mods = 'CMD',       action = wezterm.action.DecreaseFontSize },
  { key = '0',     mods = 'CMD',       action = wezterm.action.ResetFontSize },

  -- Tab management
  { key = 'n',     mods = 'CMD',       action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w',     mods = 'CMD',       action = wezterm.action.CloseCurrentTab { confirm = false } },

  -- Window management
  { key = 'n',     mods = 'CMD|SHIFT', action = wezterm.action.SpawnWindow },
  { key = 'Enter', mods = 'CMD',       action = wezterm.action.ToggleFullScreen },

  -- Tab navigation
  { key = '1',     mods = 'CMD',       action = wezterm.action.ActivateTab(0) },
  { key = '2',     mods = 'CMD',       action = wezterm.action.ActivateTab(1) },
  { key = '3',     mods = 'CMD',       action = wezterm.action.ActivateTab(2) },
  { key = '4',     mods = 'CMD',       action = wezterm.action.ActivateTab(3) },
  { key = '5',     mods = 'CMD',       action = wezterm.action.ActivateTab(4) },
  { key = '6',     mods = 'CMD',       action = wezterm.action.ActivateTab(5) },
  { key = '7',     mods = 'CMD',       action = wezterm.action.ActivateTab(6) },
  { key = '8',     mods = 'CMD',       action = wezterm.action.ActivateTab(7) },
  { key = '9',     mods = 'CMD',       action = wezterm.action.ActivateTab(8) },

  -- Tab navigation with brackets
  { key = '[',     mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = ']',     mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(1) },

  -- Useful additions
  { key = 'k',     mods = 'CMD|SHIFT', action = wezterm.action.ClearScrollback 'ScrollbackAndViewport' },
  { key = 'r',     mods = 'CMD',       action = wezterm.action.ReloadConfiguration },
}

return config
