---
---Plays "assets/audio/bgm/`mp3`.mp3" if it exists.
---
---When finished, or if it doesn't exist, loop "assets/audio/bgm/`mp3`-loop.mp3" if it exists.
---
---@param mp3 string The audio file to play.
function music(mp3)
	if not mp3 then return end
	if song ~= mp3 then
		if bgm then bgm:stop() end
		if bgmloop then bgmloop:stop() end
		
		bgm, bgmloop = nil
		local bgmfile = "assets/audio/bgm/"..mp3..".mp3"
		local loopfile = "assets/audio/bgm/"..mp3.."-loop.mp3"
		local function lanewSrc(filename)
			return love.audio.newSource(filename, "stream")
		end
		if mp3 and mp3 ~= '' then
			if love.filesystem.getInfo(bgmfile) then
				bgm = lanewSrc(bgmfile)
				bgm:play()
			end
			if love.filesystem.getInfo(loopfile) then
				bgmloop = lanewSrc(loopfile)
				bgmloop:setLooping(true)
				if not bgm then bgmloop:play() end
			end
		end
	end
	song = mp3
end

---
---Plays "assets/audio/sfx/`mp3`.mp3 if it exists."
---
---@param mp3 string The audio file to play.
function sfx(mp3)
	sound = nil
	if mp3 ~= '' then sound = love.audio.newSource("assets/audio/sfx/"..mp3..".mp3","static") end
	sound:play()
end