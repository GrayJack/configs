local gears     = require("gears")
local awful     = require("awful")
                  require("awful.autofocus")
local beautiful = require("beautiful")

local themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex",          -- 10
}

local chosen_theme = themes[6]

beautiful.init(string.format(gears.filesystem.get_configuration_dir() .. "themes/%s/theme.lua", chosen_theme))
