local a_tag = require("awful.tag") --DOC_HIDE --DOC_NO_USAGE --DOC_GEN_IMAGE
local a_layout = require("awful.layout") --DOC_HIDE
local dynamite = require("dynamite") --DOC_HIDE

    local mycustomtilelayout = dynamite {
        {
            reflow   = true,
            when     = function(self, t, count) -- luacheck: no unused args
                return count < 3 end,
            priority = 1,
            layout   = dynamite.layout.ratio.vertical
        },
        {
            reflow   = true,
            when     = function(self, t, count) return count >= 3 end, -- luacheck: no unused args
            priority = 1,
            layout   = dynamite.layout.ratio.horizontal
        },
        layout     = dynamite.layout.conditional
    }

screen._setup_grid(64, 48, {5}, {workarea_sides=3}) --DOC_HIDE

local tags = {} --DOC_HIDE

local function add_clients(s, count) --DOC_HIDE
    local x, y = s.geometry.x, s.geometry.y --DOC_HIDE
    for _=1, count do --DOC_HIDE
        local c1 = client.gen_fake {x = x+45, y = y+35, width=40, height=30, screen=s} --DOC_HIDE
        c1:_hide() --DOC_HIDE
    end --DOC_HIDE
end --DOC_HIDE

local function show_layout(f, s) --DOC_HIDE
    local t = tags[s] --DOC_HIDE
    assert(s and t) --DOC_HIDE

    t.layout = f --DOC_HIDE

    local l = a_tag.getproperty(t, "layout") --DOC_HIDE

    -- Test if the tag is the right one --DOC_HIDE
    assert(l._tag == t) --DOC_HIDE

    -- Test if the stateful layout track the right number of clients --DOC_HIDE
    assert(#t:clients() == #l.wrappers) --DOC_HIDE

    local params = a_layout.parameters(t, s) --DOC_HIDE

    -- Test if the number of clients wrapper is right and if they are there --DOC_HIDE
    -- only once --DOC_HIDE
    local all_widget = l.widget:get_all_children() --DOC_HIDE
    local cls, inv = {},{} --DOC_HIDE
    for _, w in ipairs(all_widget) do --DOC_HIDE
        if w._client then --DOC_HIDE
            assert(not inv[w._client]) --DOC_HIDE
            inv[w._client] = w --DOC_HIDE
            table.insert(cls, w._client) --DOC_HIDE
        end --DOC_HIDE
    end --DOC_HIDE

    l.arrange(params) --DOC_HIDE

    -- Finally, test if the clients total size match the workarea --DOC_HIDE
    local total = 0 --DOC_HIDE
    for _, c in ipairs(t:clients()) do --DOC_HIDE
        local geo = c:geometry() --DOC_HIDE
        geo.height, geo.width = geo.height+2*c.border_width, geo.width+2*c.border_width --DOC_HIDE
        total = total + geo.height*geo.width --DOC_HIDE
    end --DOC_HIDE

end --DOC_HIDE

for j=1, 5 do --DOC_HIDE
    tags[screen[j]] = a_tag.add("Test"..j, {screen=screen[j]}) --DOC_HIDE
    add_clients(screen[j],j) --DOC_HIDE
    show_layout(mycustomtilelayout, screen[j]) --DOC_HIDE
end --DOC_HIDE

return {hide_lines=true, radius=2} --DOC_HIDE
