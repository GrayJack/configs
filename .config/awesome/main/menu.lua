local awesome       = awesome
local awful         = require("awful")
                      require("awful.autofocus")
local beautiful     = require("beautiful")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local freedesktop   = require("freedesktop")

-- {{{ Menu
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end }
}

local myexitmenu = {
    { "log out", function() awesome.quit() end, "/usr/share/icons/Arc-Maia/actions/24@2x/system-log-out.png" },
    { "suspend", "systemctl suspend", "/usr/share/icons/Arc-Maia/actions/24@2x/gnome-session-suspend.png" },
    { "hibernate", "systemctl hibernate", "/usr/share/icons/Arc-Maia/actions/24@2x/gnome-session-hibernate.png" },
    { "reboot", "systemctl reboot", "/usr/share/icons/Arc-Maia/actions/24@2x/view-refresh.png" },
    { "shutdown", "poweroff", "/usr/share/icons/Arc-Maia/actions/24@2x/system-shutdown.png" }
}

awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or 16,
    before = {
        { "Terminal", terminal                     },
        { "Browser", browser                       },
        { "File Manager", filemanager              },
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        { "Exit", myexitmenu        },
        -- other triads can be put here
    }
})

--Menubar configurations
menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it
-- }}}
