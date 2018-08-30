local awful         = require("awful")
                      require("awful.autofocus")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = my_table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description = "Show help", group="Awesome: awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "Reload awesome", group = "Awesome: awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "Quit awesome", group = "Awesome: awesome"}),
    awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end,
              {description = "Show main menu", group = "Awesome: awesome"}),
    awful.key({ modkey,           }, "d",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "Lua execute prompt", group = "Awesome: awesome"})
    -- Show/Hide Wibox
    --[[ awful.key({ modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "Toggle wibox", group = "Awesome: awesome"})
    ]]--
)
