local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font('IosevkaTerm NF')
config.font_size = 16.0
config.warn_about_missing_glyphs = true
config.allow_square_glyphs_to_overflow_width = "Always"

config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
config.font_shaper = "Harfbuzz"
config.cell_width = 1.0
config.line_height = 1.0
config.underline_thickness = 1
config.underline_position = -2

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'
config.native_macos_fullscreen_mode = true

config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.scrollback_lines = 5000
config.term = 'wezterm'

config.max_fps = 240
config.front_end = "WebGpu"
config.webgpu_power_preference = 'HighPerformance'
config.animation_fps = 120

config.automatically_reload_config = true
config.check_for_updates = true
config.audible_bell = 'SystemBeep'
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.color_scheme = 'Black Metal (Venom) (base16)'

config.keys = {
  { key = 'v',     mods = 'CMD',       action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'c',     mods = 'CMD',       action = wezterm.action.CopyTo 'Clipboard' },
  { key = '=',     mods = 'CMD',       action = wezterm.action.IncreaseFontSize },
  { key = '-',     mods = 'CMD',       action = wezterm.action.DecreaseFontSize },
  { key = '0',     mods = 'CMD',       action = wezterm.action.ResetFontSize },
  { key = 'n',     mods = 'CMD',       action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'Enter', mods = 'CMD',       action = wezterm.action.ToggleFullScreen },
  { key = 'w',     mods = 'CMD',       action = wezterm.action.CloseCurrentTab { confirm = false } },
  { key = 'n',     mods = 'CMD|SHIFT', action = wezterm.action.SpawnWindow },
  { key = '[',     mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = ']',     mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'r',     mods = 'CMD',       action = wezterm.action.ReloadConfiguration },
  { key = "Enter", mods = "SHIFT",     action = wezterm.action { SendString = "\x1b\r" } },
}

return config
