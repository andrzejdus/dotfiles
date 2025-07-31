-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'wsl' }

  table.insert(launch_menu, {
    label = 'Ubuntu',
    args = { 'wsl.exe' },
  })

  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe' },
  })

  table.insert(launch_menu, {
    label = 'Command Prompt',
    args = { 'cmd.exe' },
  })
end

config.launch_menu = launch_menu

-- This is where you actually apply your config choices.
config.use_fancy_tab_bar = false

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.window_background_opacity = 0.95

-- Finally, return the configuration to wezterm:
return config
