---------------------------------------------------------------------------
--- Split the focused* client area in two.
--
-- The split will be either vertical or horizontal to maximize the space.
--
-- * Or, when there is none, the largest client
--
-- Based on https://github.com/RobSis/treesome
--
-- @author Emmanuel Lepage Vallee &lt;elv1313@gmail.com&gt;
-- @copyright 2016 Emmanuel Lepage Vallee
-- @module dynamite
---------------------------------------------------------------------------
local dynamic     = require( "dynamite.base"         )
local wibox       = require( "wibox"                 )
local l_ratio     = require( "dynamite.layout.ratio" )
local stack       = require( "dynamite.layout.stack" )
local capi = {client = client}

local function focus_changed(self, placeholder, c)
    self._private.previous = self._private.latest
    self._private.latest = c
end

-- Remove containers when they are empty or have only 1 client
local function garbage_empty(self, idx)
    local ret = self._private._remove(self, idx)

    local children = self.children
    if #children == 0 or (#children == 1 and children[1].auto_gc) then
        self._private.tree:remove_widgets(self, true)
    elseif #children == 1 then
        self._private.tree:replace_widget(self, children[1], true)
    end

    return ret
end

local function create_container(direction, parent)
    local ret = l_ratio[direction]()

    ret._private.tree = parent
    ret._private._remove = ret.remove
    ret._private.auto_gc = true
    rawset(ret, "remove", garbage_empty)

    return ret
end

-- Select the client to split in half
local function find_current(self)
    local everything = self:get_all_children()
    local biggest, ret = 0

    -- Because the newly added client probably already has focus, keeping
    -- a short history of the last 2 focused clients is required
    local preferred, preferred2 = self._private.latest, self._private.previous

    -- Find the biggest client
    for _, w in ipairs(everything) do
        if w._client and w._client.valid then
            -- BUG this uses the **current** client size, but it can be already
            -- invalid.
            local geo = w._client:geometry()

            if preferred == w._client or w._client == capi.client.focus then
                return w
            end

            if preferred2 == w._client then
                biggest = math.huge
                ret = w
            end

            if geo.width*geo.height > biggest then
                assert(w._client.valid)
                biggest, ret = geo.width*geo.height, w
            end
        end
    end

    return ret
end

local function add(self, w1, ...)
    if not w1 then return end

    -- Add the first element
    if #self:get_children() == 0 then
        self._private._add(self, w1)

        self:add(...)
        return true
    end

    if w1._client and w1._client == capi.client.focus then
        focus_changed(self, w1, w1._client)
    end

    local target = find_current(self)

    if target then
        local geo = target._client:geometry()
        local l = wibox.layout {
            target,
            w1,
            layout = create_container(
                geo.width > geo.height and "horizontal" or "vertical", self
            )
        }
        self:replace_widget(target, l, true)
    else
        -- Someone messed with the layout
        assert(false)
    end

    self:add(...)
end

local function ctr()
    local main = stack()

    main._private._add = main.add
    rawset(main, "add", add)
    main:connect_signal("focused", focus_changed)

    return main
end

local module                     = dynamic("treetile"       , ctr)
module.fullscreen                = dynamic("fullscreen", ctr)
module.fullscreen.honor_workarea = false
module.fullscreen.honor_gap      = false

return module
-- kate: space-indent on; indent-width 4; replace-tabs on;
