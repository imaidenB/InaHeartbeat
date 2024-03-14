hist_scroll, max_hist_scroll = nil
local history_bg = lg.newImg "gui/history_bg"
local up_rep, down_rep = 0, 0
history_enabled = false

function history_init()
    history_enabled = true
    hist_box:send(table.concat(history, "\n\n"), 112, true)
    max_hist_scroll = math.max(0, (hist_box.get.lines*6)-113)
    hist_scroll = max_hist_scroll
end

function history_update(dt)
    if love.keyboard.isDown "up" then
        up_rep = up_rep+dt
        if up_rep >= .5 then
            hist_scroll = math.max(0, hist_scroll-6)
        end
    elseif love.keyboard.isDown "down" then
        down_rep = down_rep+dt
        if down_rep >= .5 then
            hist_scroll = math.min(hist_scroll+6, max_hist_scroll)
        end
    end
end

function history_draw()
    lg.draw(history_bg)
    lg.setScissor(7, 7, 114, 114)
    hist_box:draw(8, 8-hist_scroll)
    lg.setScissor()
end

function history_keypressed(key)
    if key == "up" then
        hist_scroll = math.max(0, hist_scroll-6)
    elseif key == "down" then
        hist_scroll = math.min(hist_scroll+6, max_hist_scroll)
    elseif key == 'a' then
        hist_scroll = max_hist_scroll
    elseif key == 'b' or key == "start" then
        history_enabled = false
        lg.setFont(menuFont)
    end
end

function history_keyreleased(key)
    if key == "up" then up_rep = 0
    elseif key == "down" then down_rep = 0
    end
end