function changeState(cstate, x)
	print("loading state: "..cstate)
	if cstate ~= "error" then  require("states/"..cstate) end
	
	if cstate == "game" then hideAll() end
	
	if cstate == "splash" then bg("cg/splash", 4, true)
	elseif cstate == "pause" then
		autotimer = 0
		pause()
	elseif cstate == "game" and not x then loadgame()
	elseif cstate == "credits" then credits_init()
	end

	--load game state and scripts
	if cstate == "game" then
		if x then
			loadAll()
			bg(background, '', true)
			music(song)
			tag(bgTag)
			if x == -1 then
				chapter = 0
				ptr = -11
			elseif x == 4 then ptr = 803
			else chapter = x
			end
		else
			bg ''
			b ''
			music ''
		end
		paused = false
		xaload = -1
		require("scripts/script-ch"..math.min(chapter, 3))
	elseif cstate == "error" then
		love.window.setTitle "InaHeartbeat"
		bootAnim:setTag "error"
	end

	state = cstate
	print("loaded state: "..cstate)
end
