local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local terminal = require("config").terminal
local editor_cmd = require("config").editor_cmd

local M = {}

local myawesomemenu = {
  { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart",     awesome.restart },
  { "quit",        function() awesome.quit() end },
}

M.mainmenu = awful.menu({
  items = {
    { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal }
  }
})

M.launcher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = M.mainmenu
})

return M
