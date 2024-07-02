local wezterm = require("wezterm")

wezterm.on("format-window-title", function()
  return "(程序未响应)"
end)

local cached_color_scheme = require("wezterm_color_scheme")

return {
  --{ weight = "Bold", italic = true }
  -- font = wezterm.font("JetBrainsMono NF", { italic = true }),
  -- font = wezterm.font("Hasklug Nerd Font", { italic = true }),
  -- font = wezterm.font("Hack Nerd Font", { italic = true }),
  -- font = wezterm.font("SauceCodePro NF", { italic = true, weight = "Bold" }),
  -- font = wezterm.font("CaskaydiaCove NF"),
  font = wezterm.font("CodeNewRoman Nerd Font", { italic = true }),
  font_size = 15,
  line_height = 1.1,
  window_background_opacity = 0.96,
  -- enable_scroll_bar = true,

  color_scheme = cached_color_scheme,

  -- 初始窗口宽度
  initial_cols = 150,
  -- 初始窗口高度
  initial_rows = 40,

  window_decorations = "RESIZE",

  hide_tab_bar_if_only_one_tab = true,
  -- debug_key_events = true,

  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },
  keys = {
    { key = "phys:F16", mods = "NONE", action = "ActivateCopyMode" },
    -- { key = "phys:F11", mods = "NONE", action = "ToggleFullScreen" },
    { key = "PageUp", mods = "SHIFT", action = wezterm.action.ScrollByPage(-0.5) },
    { key = "PageDown", mods = "SHIFT", action = wezterm.action.ScrollByPage(0.5) },
    { key = "UpArrow", mods = "SHIFT", action = wezterm.action.ScrollByLine(-1) },
    { key = "DownArrow", mods = "SHIFT", action = wezterm.action.ScrollByLine(1) },

    {
      key = "%",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
  },
}
