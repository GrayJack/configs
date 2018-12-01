local awful         = require("awful")
                      require("awful.autofocus")
local menubar       = require("menubar")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = my_table.join(globalkeys,
    -- Terminal
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
            {description = "Open a terminal", group = "Awesome: launcher"}),
    awful.key({ modkey, "Shift"   }, "Return", function () awful.spawn(python) end,
            {description = "Open a Python interpreter", group = "Awesome: launcher"}),
    awful.key({ modkey, "Control"   }, "Return", function () awful.spawn(julia) end,
                    {description = "Open a Julia interpreter", group = "Awesome: launcher"}),

    -- User programs
    awful.key({ modkey,           }, "q",     function () awful.util.spawn(filemanager)     end,
            {description = "Launch Dolphin filemanager", group = "Awesome: launcher"}),
    awful.key({ modkey,           }, "e", function () awful.spawn(filemanager2) end,
            {description = "Launch Ranger filemanager", group = "Awesome: launcher"}),
    awful.key({ modkey, Shift     }, "b",     function () awful.util.spawn(browser)   end,
            {description = "Launch Browser", group = "Awesome: launcher"}),
    awful.key({ modkey,           }, "z", function () awful.spawn(editor) end,
            {description = "Launch $EDITOR", group = "Awesome: launcher"}),
    awful.key({ modkey,           }, "a", function () awful.spawn(gui_editor) end,
            {description = "Launch Atom", group = "Awesome: launcher"}),
    awful.key({ modkey,           }, "v", function () awful.spawn(gui_editor2) end,
            {description = "Launch VSCode", group = "Awesome: launcher"}),
    awful.key({ modkey,          }, "space", function () awful.util.spawn(rofi) end,
            {description = "Launch rofi", group = "Awesome: launcher"}),
    --[[awful.key({ modkey,          }, "space", function () awful.util.spawn("/usr/bin/dmenu_recency")          end,
            {description = "Launch dmenu", group = "Awesome: launcher"}),]]--

    -- Menubar
    awful.key({ modkey,          }, "p", function() menubar.show() end,
            {description = "Show the menubar", group = "Awesome: launcher"}),

    -- Prompt
    awful.key({ modkey,          }, "r", function () awful.screen.focused().mypromptbox:run() end,
            {description = "Run prompt", group = "Awesome: launcher"})
)
