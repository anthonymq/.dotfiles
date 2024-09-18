local wezterm = require 'wezterm'
return {
    color_scheme = 'Catppuccin Mocha',
    enable_tab_bar = false,
    font = wezterm.font 'JetBrains Mono',
    font_size = 14.0,
    macos_window_background_blur = 30,
    window_background_opacity = 1.0,
    window_decorations = 'RESIZE',
    keys = {
        {
            key = 'f',
            mods = 'CTRL',
            action = wezterm.action.ToggleFullScreen,
        },
        -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
        { key = "LeftArrow",  mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
        -- Make Option-Right equivalent to Alt-f; forward-word
        { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
    },
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
}
