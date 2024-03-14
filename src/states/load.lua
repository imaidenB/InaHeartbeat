require "loader/assets_load"
local l_timer = 0
local b_timer = 0
if g_system == "3DS" then
	savedir = "sdmc:/3ds/data/\nLovePotion/InaHeartbeat"
elseif g_system == "Android" then
	savedir = "Android/data/com.\nlove2d.android/\nfiles/saves/InaHeartbeat"
elseif g_system == "OS X" then
	savedir = "Library/Application Support/pico-8"
elseif g_system == "Windows" then
    savedir = "%appdata%\\pico-8"
else
    error "Game opened on unsupported device!"
end


function load_update()
	lg.setBackgroundColor(0, 0, 0)
	print("l_timer: "..l_timer)
	if l_timer < 4 then
		l_timer = l_timer+1
		loader_assets(l_timer)
	end
	b_timer = b_timer+dt
	bootAnim:update(dt)
	local sav = getInfo "cdata/imaidenb_heartbeat_1.txt"

	if b_timer >= 3.256 then
		love.window.setTitle "In a Heartbeat"
		if sav then checkLoad()
		-- else changeState("game", 0)
		else changeState "credits"
		end
	end
end

function checkLoad()
	loadgame()
	
    if chapter == 4 then changeState "credits"
    elseif chapter == 5 then changeState "error"
	elseif chapter >= 0 then changeState "splash"
	end
end
