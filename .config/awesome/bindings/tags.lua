local awful         = require("awful")
                      require("awful.autofocus")
local lain          = require("lain")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = my_table.join(globalkeys,
    -- Tag browsing
    -- awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    --         {description = "View previous", group = "Awesome: tag"}),
    -- awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    --         {description = "View next", group = "Awesome: tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
            {description = "Go back", group = "Awesome: tag"}),

    -- Non-empty tag browsing
    awful.key({ altkey,           }, "Left", function () lain.util.tag_view_nonempty(-1) end,
            {description = "View  previous nonempty", group = "Awesome: tag"}),
    awful.key({ altkey,           }, "Right", function () lain.util.tag_view_nonempty(1) end,
            {description = "View  previous nonempty", group = "Awesome: tag"}),

    -- On the fly useless gaps change
    awful.key({ altkey, "Control" }, "j", function () lain.util.useless_gaps_resize( 1) end,
            {description = "Increment useless gaps", group = "Awesome: tag"}),
    awful.key({ altkey, "Control" }, "k", function () lain.util.useless_gaps_resize(-1) end,
            {description = "Decrement useless gaps", group = "Awesome: tag"}),

    -- Dynamic tagging
    awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag() end,
            {description = "Add new tag", group = "Awesome: tag"}),
    awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag() end,
            {description = "Rename tag", group = "Awesome: tag"}),
    awful.key({ modkey, "Shift" }, "j", function () lain.util.move_tag(-1) end,
            {description = "Move tag to the left", group = "Awesome: tag"}),
    awful.key({ modkey, "Shift" }, "k", function () lain.util.move_tag(1) end,
            {description = "Move tag to the right", group = "Awesome: tag"}),
    awful.key({ modkey, "Shift" }, "d", function () lain.util.delete_tag() end,
            {description = "Delete tag", group = "Awesome: tag"})
)
