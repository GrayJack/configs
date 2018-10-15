-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local treetile      = require("treetile")
treetile.focusnew = true
-- }}}

-- Configs
local config_path = awful.util.getdir("config") .. "/"
-- {{{ Main
-- Error handling
dofile(config_path .. "main/error-handling.lua")
-- Autostart windowless processes
dofile(config_path .. "main/autostart-windowless-processes.lua")
-- Variable Definitions
dofile(config_path .. "main/user-variables.lua")
-- Layout configuration
dofile(config_path .. "main/layout.lua")
-- Tags configs
dofile(config_path .. "main/tags.lua")
-- Theme config
dofile(config_path .. "main/theme.lua") -- It must be after tags configs in this setup
-- Menu
dofile(config_path .. "main/menu.lua")
-- Screen
dofile(config_path .. "main/screen.lua")
-- }}}

-- {{{ Bindings
-- Mouse
dofile(config_path .. "bindings/mouse.lua")
-- GLOBAL --
-- Awesome Bindings
dofile(config_path .. "bindings/awesome.lua")
-- Hotkeys bindings
dofile(config_path .. "bindings/hotkeys.lua")
-- Launcher bindings
dofile(config_path .. "bindings/launcher.lua")
-- Screen Bindings
dofile(config_path .. "bindings/screen.lua")
-- Layout bindings
dofile(config_path .. "bindings/layout.lua")
-- Global client Bindings
dofile(config_path .. "bindings/global-client.lua")
-- Tags bindings
dofile(config_path .. "bindings/tags.lua")
dofile(config_path .. "bindings/tags2.lua")
-- Widgets bindings
dofile(config_path .. "bindings/widgets.lua")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- CLIENT --
dofile(config_path .. "bindings/client.lua")
dofile(config_path .. "bindings/client-buttons.lua")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules }}}
dofile(config_path .. "main/rules.lua")

-- {{ Signals }}
dofile(config_path .. "main/signals.lua")

-- {{ Start with AwesomeWM }}
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
awful.spawn.with_shell("~/.config/awesome/locker.sh")
