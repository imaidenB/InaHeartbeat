lg = love.graphics

unitimer = 0
uniduration = 0.25

local lgnewImg = lg.newImage
function lg.newImg(png) -- Creates an image from file `png`.png.
    if png == '' then return blankImg end
    if love.filesystem.getInfo("assets/images/"..png..".png") then return lgnewImg("assets/images/"..png..".png")
    else return blankImg
    end
end

local lgdraw=lg.draw
function lg.draw(d, ...)
    if d and d ~= blankImg then lgdraw(d, ...) end
end

local lgsetCol = lg.setColor
function lg.setCol(red, green, blue)
    if red and green and blue then lgsetCol(red, green, blue, 1) end
end
local lmcolFB = love.math.colorFromBytes
function lg.setRgb(rb, gb, bb)
    if rb and gb and bb then lgsetCol(lmcolFB(rb, gb, bb, 255)) end
end

local lgsetBg = lg.setBackgroundColor
function lg.setBgCol(red, green, blue)
    if red and green and blue then lgsetBg(red, green, blue, 1) end
end

function lg.setBgRgb(rb, gb, bb)
    if rb and gb and bb then lgsetBg(lmcolFB(rb, gb, bb, 255)) end
end

function lg.p8FB(idx)
    local col = clr[idx]
    return col[1]/255, col[2]/255, col[3]/255
end

local lgrect = lg.rectangle
---
---Draws a rectangle.
---
---
---[Open in Browser](https://love2d.org/wiki/love.graphics.rectangle)
---
---@param mode love.DrawMode # How to draw the rectangle.
---@param x number # The position of top-left corner along the x-axis.
---@param y number # The position of top-left corner along the y-axis.
---@param width number # Width of the rectangle.
---@param height number # Height of the rectangle.
---@param col integer # Color of the rectangle, as a PICO-8 palette index.
function lg.rect(mode, x, y, width, height, col)
    local cr, cg, cb = lg.getColor()
    lg.setCol(lg.p8FB(col))
    lgrect(mode, x, y, width, height)
    lg.setCol(cr, cg, cb)
end

local lgprint = lg.print
---@param text string # The text to draw.
---@param x number # The position to draw the object (x-axis).
---@param y number # The position to draw the object (y-axis).
---@param f integer # The color to draw the object in, as a PICO-8 palette index.
---@param b integer? # The color to draw the outlines in, as a PICO-8 palette index.
function lg.oprint(text, x, y, f, b)
    local cr, cg, cb = lg.getColor()
    if b then
        lg.setCol(lg.p8FB(b))
        lgprint(text, x-1, y-1)
        lgprint(text, x, y-1)
        lgprint(text, x+1, y-1)
        lgprint(text, x-1, y)
        lgprint(text, x+1, y)
        lgprint(text, x-1, y+1)
        lgprint(text, x, y+1)
        lgprint(text, x+1, y+1)
    end
    lgsetCol(lg.p8FB(f))
    lgprint(text, x, y)
    lgsetCol(cr, cg, cb)
end

function mc_draw()
    if lastDlg == '' then return end
    lg.rect("fill", 0, 125-minecrafttext.get.height, minecrafttext.get.width, minecrafttext.get.height+2, 0)
    minecrafttext:draw(1, 126-minecrafttext.get.height)
end

function dlg_draw()
    if lastDlg == '' then return end
    lg.setCol(1,1,1)
    dlgbox:draw(0, dlgTop and 0 or 99)
    if tagtimer > 0 and autotimer == 0 then return end
    if ct ~= '' then namebox:draw(0, dlgTop and 31 or 87, 4*ct:len() + 5, 11) end
    lg.oprint(ct, 3, dlgTop and 34 or 90, 7)
    dlgtext:draw(2, dlgTop and 2 or 101)
end