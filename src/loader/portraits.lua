---A portrait.
---@class set
---@field h string The name of the portrait's head.
---@field b string|integer The name of the portrait's body.
---@field x integer The x position of the portrait, -1, 0, or 1.
---@field visible boolean Whether the portrait is visible.

---Loads a set out of a portrait's components.
---@param set set
local function loadPt(set)
    local lr, pt, l, r, h = {'', ''}

    if set == a_Set then pt = "aiden"
    elseif set == s_Set then pt = "sarah"
    elseif set == l_Set then pt = "liam"
    end
    print('Loading portrait "', pt)
    
    local b = set.b

    if type(b) == "string" and not tonumber(b) then
        if b:len() == 2 then lr = {b..'l', b..'r'}
        else lr = {b:sub(1, 1)..b:sub(3)..'l', b:sub(2)..'r'}
        end
    else
        local sb = tostring(b)
        local len = sb:len()
        if b == 4 or b == 5 then lr = {sb, ''}
        elseif len == 1 then lr = {sb..'l', sb..'r'}
        elseif len == 2 then lr = {sb:sub(1, 1)..'l', sb:sub(2)..'r'}
        end
    end
    
    print("creating portrait ", pt, ' with lr {"', lr[1], '", "', lr[2], '"}')
    l = lg.newImg(pt..'/'..lr[1])
    print("Loaded l ", lr[1])
    if lr[2] ~= '' then
        print("Loaded r ", lr[2])
        r = lg.newImg(pt..'/'..lr[2])
    end
    if set.h ~= '' then
        print("Loaded h ", set.h)
        h = lg.newImg(pt..'/'..set.h)
    end
    print("Finished loading portrait ", pt)
    return l, r, h
end

function loadA()
    unloadA()
    al, ar, ah = loadPt(a_Set)
end
function unloadA()
    al, ar, ah = nil
end
function loadS()
    unloadS()
    sl, sr, sh = loadPt(s_Set)
end
function unloadS()
    sl, sr, sh = nil
end
function loadL()
    unloadL()
    ll, lr, lh = loadPt(l_Set)
end
function unloadL()
    ll, lr, lh = nil
end
function loadAll() loadA() loadS() loadL() end
function unloadAll() unloadA() unloadS() unloadL() end

---**Internal** - use updA(), updS(), and updL().
---
---Updates a portrait and makes it visible.
---@param set set The portrait to update.
---@param b string|integer The body to use.
---@param h string? The head or action pose to use.
---@param x integer? The X position to place the portrait. -1 = left, 0 = middle, 1 = right. Defaults to 0.
local function updPt(set, b, h, x)
    set.visible = true
    set.b = b
    set.h = h or ''
    set.x = x or set.x
end
---Update Aiden's portrait.
---
---@param h string The head or action pose to use.
---@param b string|integer The body to use. If nil, uses Aiden's previous body.
---@param x integer? The X position to place Sarah. 0 = left, 1 = middle, 2 = right. Defaults to 1.
function updA(h, b, x)
    updPt(a_Set, b, h, x)
    if xaload == 0 then loadA() end
end
---Update Sarah's portrait.
---
---@param h string|integer? The head or action pose to use.
---@param b string|integer The body to use. If nil, uses Sarah's previous body.
---@param x integer? The X position to place Sarah. 0 = left, 1 = middle, 2 = right. Defaults to 1.
function updS(h, b, x)
    updPt(s_Set, b, h, x)
    if xaload == 0 then loadS() end
end
---Update Liam's portrait.
---
---@param h string|integer? The head or action pose to use.
---@param b string|integer The body to use. If nil, uses Liam's previous body.
---@param x integer? The X position to place Sarah. 0 = left, 1 = middle, 2 = right. Defaults to 1.
function updL(h, b, x)
    updPt(l_Set, b, h, x)
    if xaload == 0 then loadL() end
end

---**Internal** - use hideA(), hideS(), and hideL().
--
---Hides a portrait.
---@param set set The portrait to hide.
local function hidePt(set)
    if xaload == 0 then set.visible = false end
end
function hideA() -- Hide Aiden
    hidePt(a_Set)
end
function hideS() -- Hide Sarah
    hidePt(s_Set)
end
function hideL() -- Hide Liam
    hidePt(l_Set)
end
function hideAll() -- Hide all portraits
    hideA()
    hideS()
    hideL()
end
---**Internal** - use drawA(), drawS(), drawL(), and drawAll().
---
---Draws a portrait.
---@param l love.Image The left half to draw.
---@param r love.Image The right half to draw.
---@param h love.Image The head to draw.
---@param set set The set to draw.
---@param xoff integer The x offset of this portrait.
---@param yoff integer The y offset of this portrait.
local function drawPt(l, r, h, set, xoff, yoff)
    if not set.visible then return end
    lg.draw(l, xoff + set.x*24, yoff+20)
    lg.draw(r, xoff + set.x*24, yoff+20)
    lg.draw(h, xoff + set.x*24, yoff+20)
end
function drawA() drawPt(al, ar, ah, a_Set, 43, 2) end
function drawS() drawPt(sl, sr, sh, s_Set, 37, 0) end
function drawL() drawPt(ll, lr, lh, l_Set, 39, -1) end
function drawAll() drawA() drawS() drawL() end