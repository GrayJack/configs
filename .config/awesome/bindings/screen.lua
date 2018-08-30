local awful         = require("awful")
                      require("awful.autofocus")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = my_table.join(globalkeys,
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
            {description = "Focus the next screen", group = "Awesome: screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
            {description = "Focus the previous screen", group = "Awesome: screen"})
)
