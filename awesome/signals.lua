local awful = require("awful")
local beautiful = require("beautiful")

-- Setup for each screen (theme handles tags, wallpaper, and wibar)
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- Signal function to execute when a new client appears
client.connect_signal("manage", function(c)
  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end
end)

-- Enable sloppy focus, so that focus follows mouse
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus or "#6F6F6F" end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal or "#3F3F3F" end)
