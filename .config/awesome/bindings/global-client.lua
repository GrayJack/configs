local awful         = require("awful")
                      require("awful.autofocus")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = my_table.join(globalkeys,
    -- Default client focus
    awful.key({ altkey,           }, "j",
       function ()
           awful.client.focus.byidx( 1)
       end,
       {description = "Focus next by index", group = "Client: global"}),
    awful.key({ altkey,           }, "k",
       function ()
           awful.client.focus.byidx(-1)
       end,
       {description = "Focus previous by index", group = "Client: global"}),

    -- By direction client focus
    awful.key({ modkey }, "k",
       function()
           awful.client.focus.global_bydirection("down")
           if client.focus then client.focus:raise() end
       end,
       {description = "Focus down", group = "Client: global"}),
    awful.key({ modkey }, "i",
       function()
           awful.client.focus.global_bydirection("up")
           if client.focus then client.focus:raise() end
       end,
       {description = "Focus up", group = "Client: global"}),
    awful.key({ modkey }, "l",
       function()
           awful.client.focus.global_bydirection("left")
           if client.focus then client.focus:raise() end
       end,
       {description = "Focus left", group = "Client: global"}),
    awful.key({ modkey }, "j",
       function()
           awful.client.focus.global_bydirection("right")
           if client.focus then client.focus:raise() end
       end,
       {description = "Focus right", group = "Client: global"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
             {description = "Swap with next client by index", group = "Client: global"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
             {description = "Swap with previous client by index", group = "Client: global"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
             {description = "Jump to urgent client", group = "Client: global"}),
    awful.key({ modkey,           }, "Tab",
       function ()
           awful.client.focus.history.previous()
           if client.focus then
               client.focus:raise()
           end
       end,
       {description = "Go back", group = "Client: global"}),

    awful.key({ modkey, "Control" }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        {description = "Restore minimized", group = "Client: global"}),

    awful.key({modkey,      }, "c", collision.split,
        {description = "Split into other layouts", group = "Client: global"})
)
