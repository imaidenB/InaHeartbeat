local lg = love.graphics
local menu_page = "main"
local sel = 1
local volStr, vol = '', 1
local muted = false
local main, options = {}, {}
local sources = {}
local function refreshLabels()
	volStr = muted and string.rep('□', 8) or string.rep('▮', 8*vol)..string.rep('-', 8 - 8*vol)
	main = {
		"continue",
		"see history",
		"save game",
		"load game",
		"skip:"..(autoskip > 0 and "on" or "off"),
		"auto:"..(autotimer > 0 and "on" or "off"),
		"options",
		"reset cart"
	}
	if g_system ~= "3DS" and g_system ~= "Android" then table.insert(main, "quit") end
	options = {
		"sound:"..(muted and "off" or "on"),
		"volume: "..volStr,
		"fullscreen:"..(love.window.getFullscreen() and "on" or "off"),
		"controls",
		"back"
	}
end
local controlsBg
local btnQuad = lg.newQuad(0, 0, 7, 7, 42, 14)
local btnImg = lg.newImage "assets/images/menu/buttons.png"
local buttons = {false, false, false, false, false, false}
local prevFont, prevState = p8sciiFont, "game"

if g_system == "3DS" or g_system == "Android" then
	controlsBg = lg.newImage "assets/images/menu/controls-gamepad.png"
else
	controlsBg = lg.newImage "assets/images/menu/controls.png"
end
local menu_items = 0

function pause()
	prevFont = lg.getFont()
	prevState = state
	lg.setFont(menuFont)
	sources = love.audio.pause()
	refreshLabels()
	state = "pause"
	menu_page = "main"
	menu_items = #main
	sel = 1
end

function pause_draw()
	if history_enabled then history_draw() return end
	if menu_page ~= "controls" then
		if menu_page == "main" then
			bx, by = 24, 96 - menu_items*8
			bw, bh = 80, 8 + menu_items*8
		else
			bx, by = 24, 40
			bw, bh = 80, 48
		end
		lg.setCol(lg.p8FB(7))
		lg.rectangle("line", bx, by, bw, bh)
		local page = main
		if menu_page == "options" then page = options end
		for i = 1, #page do
			local str = '_'
			if sel == i then str = '▶' end
			lg.print(str..page[i], 27, (57 - #page*4) + i*8)
		end
	else
		lg.setColor(1, 1, 1, 1)
		lg.draw(controlsBg, 18, 18)
		for i = 1, 4 do
			btnQuad:setViewport(i*7 - 7, buttons[i] and 7 or 0, 7, 7, 42, 14)
			lg.draw(btnImg, btnQuad, 27 + i*8, 32)
		end
		for i = 1, 2 do
			btnQuad:setViewport((i+4)*7 - 7, buttons[i+4] and 7 or 0, 7, 7, 42, 14)
			lg.draw(btnImg, btnQuad, 27 + i*8, 43)
		end
	end
end

local function unpause()
	state = prevState
	lg.setFont(prevFont)
	love.audio.play(sources)
	gscreen.set_cursor(0)
	paused = false
end

local function select(key)
	if key ~= 'a' and key ~= 'b' then return end
	if menu_page == "main" then
		if key == 'b' and sel < 7 then unpause()
		elseif sel == 1 then unpause()
		elseif sel == 2 then history_init()
		elseif sel == 3 then savegame()
		elseif sel == 4 or sel == 8 then loadgame()
		elseif sel == 5 then autoskip = (autoskip < 1 and 1 or 0)
		elseif sel == 6 then autotimer = (autotimer < 1 and .01 or 0)
		elseif sel == 7 then
			menu_page = "options"
			menu_items = #options
			sel = 1
		elseif sel == 9 then love.event.quit()
		end
	elseif sel == 1 then
		muted = not muted
		if muted then love.audio.setVolume(0)
		else love.audio.setVolume(vol)
		end
	elseif sel == 3 then love.window.setFullscreen(not love.window.getFullscreen())
	elseif sel == 4 then
		menu_page = "controls"
		gscreen.set_cursor(1)
	elseif sel == 5 then
		menu_page = "main"
		menu_items = #main
		sel = 1
	end
	refreshLabels()
end
local btns = {left = 1, right= 2, up = 3, down = 4, b = 5, a = 6}

function pause_keypressed(key)
	if key == '' then return end
	if history_enabled then history_keypressed(key) return end
	if menu_page == "controls" then
		if key == "start" then unpause()
		else buttons[btns[key]] = true
		end
		return
	end
	if key == "up" then
		sel = sel-1
		if sel < 1 then sel = menu_items end
	elseif key == "down" then
		sel = sel+1
		if sel > menu_items then sel = 1 end
	elseif key == "left" and menu_page == "options" and sel == 2 then
		muted = false
		vol = vol-.125
		vol = math.max(0, vol)
		love.audio.setVolume(vol)
	elseif key == 'right' and menu_page == "options" and sel == 2 then
		muted = false
		vol = vol+.125
		vol = math.min(vol, 1)
		love.audio.setVolume(vol)
	else select(key)
	end
	refreshLabels()
end
function pause_keyreleased(key)
	if history_enabled then history_keyreleased(key) return end
	if key ~= '' and menu_page == "controls" then buttons[btns[key]] = false end
end