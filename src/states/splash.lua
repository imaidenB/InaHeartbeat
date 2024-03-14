local random_msg = love.math.random(1, 12)
local s_timer = 0
splashx = 975

local basedirs={
    ["3DS"] ="3ds/data/lovepotion/\nInaHeartbeat",
    Android ="Android/data/\norg.love2d.android",
    ["OS X"]="Library/Application Support/\npico-8",
    Windows ="AppData\\Roaming\\pico-8"
}
local horizon_splash = (g_system == "3DS" and "3DS > Switch" or "Who the fuck would even play\nthis on a 3DS?")
local splashes = {
    "Winner of the fastest\nrelease award!",
    "Don't make me tell your mom\nabout her.",
    "Who needs sex when you can\nflirt with pixels?",
    horizon_splash,
    "This game contains\nmild sex.",

    'It\'s "PICO-8," not "Pico 8,"\ndumbass!',
    "PICO-8 > Ren'Py",
    '?"Hello, world!"',
    basedirs[g_system],

    "DDLC is quivering in its\nshoes right now.",
    "I gently open the door.",
    "PPLC died for this."
}

function splash_draw()
	lg.setCol(1,1,1)
	bgImg:draw()
	print(bgImg)
	if state == "splash" then -- splash1 (imaiden_B Splash Screen)
		lg.setCol(0,0,0)
        local testsuffix = test and " Dev" or ''
		lg.print("In a Heartbeat "..dversion..testsuffix, 0, 121)
	elseif state == "splash2" then -- splash2 (Splash Text)
		lg.setCol(0,0,0)
		lg.printf(splashes[random_msg], 440, 55, 100, "center")
	elseif state == "title" then --title (Title Screen)
		menu_draw()
	end
	lg.setCol(0,0,0)
end

function splash_update()
	--splash screen s_timer
	s_timer = s_timer+dt
	print("s_timer: "..s_timer)
	splash:update(dt)
	
	if state == "splash" then
	--imaiden_B splash
	if s_timer >= 1.5 and s_timer < 2.5 then tag '4'
	elseif s_timer >= 4 then
		tag '3'
		state = "splash2"
	end
	--splash screen
	elseif state == "splash2" and s_timer >= 7 then changeState "title" end
end