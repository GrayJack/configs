local awful         = require("awful")
                      require("awful.autofocus")
local lain          = require("lain")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility


clientkeys = my_table.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
            {description = "Magnify client", group = "Client: client"}),
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
            {description = "Toggle fullscreen", group = "Client: client"}),
    awful.key({ modkey,           }, "x",      function (c) c:kill()                         end,
            {description = "Close", group = "Client: client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
            {description = "Toggle floating", group = "Client: client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
            {description = "Move to master", group = "Client: client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
            {description = "Move to screen", group = "Client: client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
            {description = "Toggle keep on top", group = "Client: client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
            {description = "Minimize", group = "Client: client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
            {description = "Maximize", group = "Client: client"})
)
