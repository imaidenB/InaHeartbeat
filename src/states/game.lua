local skipspeed = 10 -- How fast autoskip dismisses text
local dlg_visible = true -- Whether or not the dialogue box hasn't been hidden with B or backspace
local sel = 1 -- The currently selected choice from choose()
local ix, iy = 0, 0 -- The location of the cursor in the "immediate mode" at the end of the game.
local indicator = lg.newImg "gui/a" -- The A button shown next to the disclaimer agreement button.

function game_draw()
	lg.setBackgroundColor(0,0,0)
	
	lg.setCol(1, 1, 1)
	-- If there's currently a background, draw it with peachy:draw if we're in a CG, or lg.draw if not.
	if background:sub(1, 3) == "cg/" then
		if bgImg ~= blankPeachy and bgImg.draw then bgImg:draw() end
	elseif bgImg ~= blankImg and not bgImg.draw then lg.draw(bgImg, 0, immediate_y or 0)
	end
	drawAll() -- Draw all portraits.
	
	-- If the Minecraft chat is enabled, draw it.
	-- Otherwise, draw the normal dialogue box.
	if mc_enabled and dlg_enabled and dlg_visible then mc_draw()
	elseif dlg_enabled and dlg_visible then dlg_draw()
	end
	
	lg.setFont(p8sciiFont) -- Make certain we're using the correct font.
	lg.setCol(1, 1, 1) -- (1, 1, 1) is pure white, which makes sure drawing operations don't have a tint.
	if autotimer > 0 then -- If we're auto-forwarding, let the player know with a box with text.
		lg.rect("fill", 0, 0, 50, 7, 6)
		lg.oprint("Auto-Forward", 1, 1, 0)
	elseif autoskip > 0 then -- Else, if we're skipping, let the player know with a box with text.
		lg.rect("fill", 0, 0, 34, 7, 6)
		lg.oprint("Skipping", 1, 1, 0)
	end
	if choosing  and dlg_visible then
		local y = 54 - #items*5 -- Y of first button
		for i, v in ipairs(items) do
			local useIndicator = false
			if v == '' then
				v = "I agree."
				useIndicator = true
			end
			local x = 62 - v:len()*2 -- X of current button
			local w = 4 + v:len()*4 -- Width of current button
			-- If this is the currently selected button, draw the hovered button.
			-- Otherwise, draw the normal button.
			if sel == i then gui.button_hover:draw(x, y, w, 10)
			else gui.button:draw(x, y, w, 10)
			end
			if useIndicator then lg.draw(indicator, x+w, y+1) end
			lg.oprint(v, x+2, y+2, 7)
			y = y+10 -- Increase y for the next button
		end
	end
	-- If the cartswap animation is playing, draw it.
	if not gui.cartSpin.paused then gui.cartSpin:draw(4, 4) end
	if ptr < 800 or ptr == 804 then return end
	-- Draw the immediate mode history and store the location of the cursor.
	if ptr == 803 then credits_draw() end
	ix, iy = immediatetext:draw(0, immediate_y or 0)
	if ix and iy then immediateCursor:draw(ix-4, immediate_y == 0 and iy-5 or 114) end
end

function game_update()
	scriptCheck() -- Call the current instruction.
	
	-- If we've just incremented ptr, store the time it started and log ptr.
	if xaload == 0 then
		startTime = getTime
		print("ptr: "..ptr)
	end
	-- Update the dialogue box text.
	dlgtext:update(dt)
	-- If the dialogue can be dismissed, animate the click-to-continue cursor on the dialogue box.
	if dlgbox and dlgtext:is_finished() and not choosing then dlgbox:setTag(useAltCtc and "ctcAlt" or "ctc") end
	-- Update the dialogue box ctc animation.
	dlgbox:update(dt)
	-- Increment xaload so that we know how many times the current instruction has been called.
	xaload = xaload+1
	-- IDK what unitimer and uniduration do but DDLC-LOVE uses them so I'm keeping them to make sure nothing breaks.
	if unitimer < uniduration then unitimer = unitimer+dt end
	
	-- Update the auto-forward timer.
	if autotimer > 0 then autotimer = autotimer+dt end
	
	if not choosing then -- If there isn't an on-screen choice:
		if autoskip > 0 and autoskip < skipspeed then -- If we're skipping and it's not time to skip:
			autoskip = autoskip+1 -- Update the skip timer.
			dlgtext:finish() -- Instantly show the entire dialogue box's text.
		elseif autoskip >= skipspeed then -- Else, if it's time or past time to skip:
			autotimer = 0 -- Stop auto-forwarding. (Why would you skip and auto-forward at the same time, anyway?)
			ptr = ptr+1 -- Increment ptr.
			xaload = 0 -- Reset xaload so we know the next scriptCheck call is the first.
			collectgarbage() -- I guess garbage collection is important in LÖVE?
			collectgarbage() -- idk, neither PICO-8 nor Luau use it, but DDLC-LOVE does so~
			autoskip = 1 -- Reset the skip timer.
		end
	end
	if ptr == 803 then credits_update() end
end

function game_keypressed(key)
	if choosing then
		if key == "up" then sel = sel-1
		elseif key == "down" then sel = sel+1
		elseif key == "left" then sel = 1
		elseif key == "right" then sel = #items
		elseif key == 'a' and dlg_enabled then
			choice = items[sel]
			choosing = false
			autotimer = 0
			ptr = ptr+1 -- next instruction
			xaload = 0
			unitimer = 0
		end
		sel = math.max(1, math.min(sel, #items))
	elseif ptr == 804 then love.event.quit()
	end
	if key == "start" then --quick menu
		autotimer = 0
		autoskip = 0
		changeState "pause"
	elseif key == 'a' and unitimer >= uniduration and not choosing and bgTag ~= "glitch" then
		if autoskip*autotimer ~= 0 then
			autoskip = -1
			autotimer = 0
		elseif dlg_visible and dlgtext:is_finished() then
			autotimer = 0
			ptr = ptr+1 -- next instruction
			xaload = 0
			unitimer = 0
		else
			dlgtext:finish()
			dlg_visible = true
		end
		collectgarbage()
		collectgarbage()
	elseif key == 'b' then dlg_visible = not dlg_visible
	elseif test and not choosing then
		if key == "left" then
			ptr = ptr-1
			table.remove(history)
		elseif key == "right" then
			ptr = ptr+1
		end
	end
end