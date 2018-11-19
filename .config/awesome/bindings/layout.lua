local awful         = require("awful")
                      require("awful.autofocus")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local treetile      = require "treetile"

globalkeys = my_table.join(globalkeys,
    -- Layout
    awful.key({ modkey, altkey}, "j",
        function ()
            local c = client.focus
            if awful.layout.get(c.screen).name == "floating" then
                awful.client.moveresize(-20,0,0,0)
            elseif awful.layout.get(c.screen).name == "treetile" then
                treetile.resize_client(-0.1)
            else
                awful.tag.incmwfact(-0.05)
            end
        end,
            {description = "Decrease master width factor (Tiling) / Move window left (Floating)", group = "Awesome: layout"}),
    awful.key({ modkey, altkey}, "k",
        function ()
            local c = client.focus
            if awful.layout.get(c.screen).name == "floating" then
                awful.client.moveresize( 20,0,0,0)
            elseif awful.layout.get(c.screen).name == "treetile" then
                treetile.resize_client(0.1)
            else
                awful.tag.incmwfact( 0.05)
            end
        end,
            {description = "Increase master width factor (Tiling) / Move window right (Floating)", group = "Awesome: layout"}),
    awful.key({ modkey, "Control"   }, "Down",     function () awful.tag.incnmaster( 1, nil, true) end,
            {description = "Increase the number of master clients", group = "Awesome: layout"}),
    awful.key({ modkey, "Control"   }, "Up",     function () awful.tag.incnmaster(-1, nil, true) end,
            {description = "Decrease the number of master clients", group = "Awesome: layout"}),
    awful.key({ modkey, "Control"   }, "Left", function () awful.client.swap.byidx(  1)    end,
            {description = "Swap with next client by index", group = "Awesome: layout"}),
    awful.key({ modkey, "Control"   }, "Right", function () awful.client.swap.byidx( -1)    end,
            {description = "Swap with previous client by index", group = "Awesome: layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
            {description = "Increase the number of columns", group = "Awesome: layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
            {description = "Decrease the number of columns", group = "Awesome: layout"}),
    awful.key({ altkey,           }, "l", function () awful.layout.inc( 1)                end,
            {description = "Select next", group = "Awesome: layout"})
)
