local awful         = require("awful")
                      require("awful.autofocus")
local beautiful     = require("beautiful")
local lain          = require("lain")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = my_table.join(globalkeys,
    -- Widgets popups
    awful.key({ altkey, }, "c", function () lain.widget.calendar.show(7) end,
              {description = "Show calendar", group = "Awesome: widgets"}),
    awful.key({ altkey, }, "h", function () if beautiful.fs then beautiful.fs.show(7) end end,
              {description = "Show filesystem", group = "Awesome: widgets"}),
    awful.key({ altkey, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
              {description = "Show weather", group = "Awesome: widgets"}),

    -- Redshift
    awful.key({ modkey, "Shift" }, "t", function () lain.widget.contrib.redshift:toggle() end,
              {description = "Toggle redshift", group = "Awesome: widgets"}),

    -- MPD control
    awful.key({ altkey, "Control" }, "Up",
        function ()
            os.execute("mpc toggle")
            beautiful.mpd.update()
        end,
        {description = "Mpc toggle", group = "Awesome: widgets"}),
    awful.key({ altkey, "Control" }, "Down",
        function ()
            os.execute("mpc stop")
            beautiful.mpd.update()
        end,
        {description = "Mpc stop", group = "Awesome: widgets"}),
    awful.key({ altkey, "Control" }, "Left",
        function ()
            os.execute("mpc prev")
            beautiful.mpd.update()
        end,
        {description = "Mpc prev", group = "Awesome: widgets"}),
    awful.key({ altkey, "Control" }, "Right",
        function ()
            os.execute("mpc next")
            beautiful.mpd.update()
        end,
        {description = "Mpc next", group = "Awesome: widgets"}),
    awful.key({ altkey }, "0",
        function ()
            local common = { text = "MPD widget ", position = "top_middle", timeout = 2 }
            if beautiful.mpd.timer.started then
                beautiful.mpd.timer:stop()
                common.text = common.text .. lain.util.markup.bold("OFF")
            else
                beautiful.mpd.timer:start()
                common.text = common.text .. lain.util.markup.bold("ON")
            end
            naughty.notify(common)
        end,
        {description = "Mpc on/off", group = "Awesome: widgets"})
)
