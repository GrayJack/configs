local awful         = require("awful")
                      require("awful.autofocus")
local beautiful     = require("beautiful")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = my_table.join(globalkeys,
    -- Screen locker
    awful.key({ altkey, "Control" }, "l", function () os.execute(scrlocker) end,
              {description = "Lock screen", group = "Awesome: hotkeys"}),

    --[[ Function keys ]]
    -- Brightness
    awful.key({                   }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 5") end),
    awful.key({                   }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 5") end),

    -- Volume
    awful.key({                   }, "XF86AudioRaiseVolume",
        function ()
            os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
            beautiful.volume.update()
        end),
    awful.key({                   }, "XF86AudioLowerVolume",
        function ()
            os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
            beautiful.volume.update()
        end),
    awful.key({                   }, "XF86AudioMute",
        function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end),

    -- Search
    awful.key({                   }, "XF86Search", function () awful.util.spawn(rofi) end),

    -- ALSA volume control
    awful.key({ altkey,           }, "Up",
        function ()
            os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "Volume up", group = "Awesome: hotkeys"}),
    awful.key({ altkey,           }, "Down",
        function ()
            os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
            beautiful.volume.update()
        end,
      {description = "Volume down", group = "Awesome: hotkeys"}),
    awful.key({ altkey,           }, "m",
        function ()
            os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end,
      {description = "Toggle mute", group = "Awesome: hotkeys"}),
    awful.key({ altkey, "Control" }, "m",
        function ()
            os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "Volume 100%", group = "Awesome: hotkeys"}),
    awful.key({ altkey, "Control" }, "0",
        function ()
            os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "Volume 0%", group = "Awesome: hotkeys"}),

    -- Screenshot
    awful.key({ altkey,           }, "p", function() awful.util.spawn(screenshot) end,
        {description = "Lake a screenshot", group = "Awesome: hotkeys"})

    -- I don't use, but I'll let it here if someone uses it
    -- Copy primary to clipboard (terminals to gtk) TODO: I don't really use it, remove it(?)
    --[[ awful.key({ modkey }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
              {description = "Copy terminal to gtk", group = "Awesome: hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    awful.key({ modkey }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "Copy gtk to terminal", group = "Awesome: hotkeys"}),
    --]]
)
