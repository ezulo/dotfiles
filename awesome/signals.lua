local awful = require("awful")
local beautiful = require("beautiful")

-- Setup for each screen (theme handles tags, wallpaper, and wibar)
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- Redraw wallpaper when a screen is resized/moved (xrandr, autorandr, monitor hotplug)
screen.connect_signal("property::geometry", beautiful.set_wallpaper)

-- Remember the last client that lost focus. awful.rules focuses new clients
-- before our "manage" handler runs, so client.focus is already the new one.
local last_unfocused
client.connect_signal("unfocus", function(c) last_unfocused = c end)

local function index_of(list, x)
  for i, v in ipairs(list) do if v == x then return i end end
end

-- Tiled clients in their current order. screen.tiled_clients is cached until
-- the next refresh and won't reflect swaps, so take the order from client.get.
local function tiled_order(s)
  local is_tiled = {}
  for _, t in ipairs(s.tiled_clients) do is_tiled[t] = true end
  local order = {}
  for _, t in ipairs(client.get(s)) do
    if is_tiled[t] then order[#order + 1] = t end
  end
  return order
end

-- Place a new tiled client directly below the previously focused one.
-- Falls back to the bottom of the stack if that client isn't tiled here.
local function place_below_focused(c)
  local prev = client.focus
  if prev == c then prev = last_unfocused end

  local tiled = tiled_order(c.screen)
  local i = index_of(tiled, c)
  if not i then return end

  local p = prev and index_of(tiled, prev)
  local target = p and (p < i and p + 1 or p) or #tiled

  -- Step c towards target one swap at a time, mirroring each swap in our list
  local step = target > i and 1 or -1
  for j = i, target - step, step do
    c:swap(tiled[j + step])
    tiled[j], tiled[j + step] = tiled[j + step], c
  end
end

-- Signal function to execute when a new client appears
client.connect_signal("manage", function(c)
  if not awesome.startup then place_below_focused(c) end

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
