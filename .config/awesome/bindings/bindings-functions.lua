local awful         = require("awful")
                      require("awful.autofocus")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility

globalkeys = {}
clientkeys = {}
function globalkey(mod, key, func, desc)
   my_table.join(globalkeys, awful.key(mod, key, func, desc))
end
function clientkey(mod, key, func, desc)
   my_table.join(clientkeys, awful.key(mod, key, func, desc))
end
