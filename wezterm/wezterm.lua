local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font('Iosevka NF')
config.font_size = 18.0
config.warn_about_missing_glyphs = true
config.allow_square_glyphs_to_overflow_width = "Always"

config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
config.font_shaper = "Harfbuzz"
config.cell_width = 1.0
config.line_height = 1.0
config.underline_thickness = 1
config.underline_position = -2

config.window_padding = { left = 12, right = 12, top = 12, bottom = 0 }
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.enable_scroll_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.native_macos_fullscreen_mode = true

config.scrollback_lines = 5000
config.enable_scroll_bar = false
config.term = 'wezterm'

config.max_fps = 120
config.front_end = "WebGpu"
config.webgpu_power_preference = 'HighPerformance'
config.enable_kitty_graphics = true
config.animation_fps = 60
config.cursor_blink_rate = 0

config.automatically_reload_config = true
config.check_for_updates = true
config.audible_bell = 'Disabled'

config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
  regex = [[\b\w+://[\w.-]+\S*\b]],
  format = '$0',
})

config.display_pixel_geometry = "BGR"

config.color_scheme = 'Solarized Light (Gogh)'

config.keys = {
  { key = 'v',     mods = 'CMD',       action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'c',     mods = 'CMD',       action = wezterm.action.CopyTo 'Clipboard' },
  { key = '=',     mods = 'CMD',       action = wezterm.action.IncreaseFontSize },
  { key = '-',     mods = 'CMD',       action = wezterm.action.DecreaseFontSize },
  { key = '0',     mods = 'CMD',       action = wezterm.action.ResetFontSize },
  { key = 'n',     mods = 'CMD',       action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w',     mods = 'CMD',       action = wezterm.action.CloseCurrentTab { confirm = false } },
  { key = 'n',     mods = 'CMD|SHIFT', action = wezterm.action.SpawnWindow },
  { key = 'Enter', mods = 'CMD',       action = wezterm.action.ToggleFullScreen },
  { key = '1',     mods = 'CMD',       action = wezterm.action.ActivateTab(0) },
  { key = '2',     mods = 'CMD',       action = wezterm.action.ActivateTab(1) },
  { key = '3',     mods = 'CMD',       action = wezterm.action.ActivateTab(2) },
  { key = '4',     mods = 'CMD',       action = wezterm.action.ActivateTab(3) },
  { key = '5',     mods = 'CMD',       action = wezterm.action.ActivateTab(4) },
  { key = '6',     mods = 'CMD',       action = wezterm.action.ActivateTab(5) },
  { key = '7',     mods = 'CMD',       action = wezterm.action.ActivateTab(6) },
  { key = '8',     mods = 'CMD',       action = wezterm.action.ActivateTab(7) },
  { key = '9',     mods = 'CMD',       action = wezterm.action.ActivateTab(8) },
  { key = '[',     mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = ']',     mods = 'CMD|SHIFT', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'k',     mods = 'CMD|SHIFT', action = wezterm.action.ClearScrollback 'ScrollbackAndViewport' },
  { key = 'r',     mods = 'CMD',       action = wezterm.action.ReloadConfiguration },
  { key = "Enter", mods = "SHIFT",     action = wezterm.action { SendString = "\x1b\r" } },
}

return config
