local s_timer = 0
local splashbox = text.new("center", {
	font = p8sciiFont,
	color = {0, 0, 0, 1},
	shadow_color = {0, 0, 0, 1}
})
splashx = 975

local basedirs={
    -- ["3DS"] ="3ds/data/lovepotion/InaHeartbeat",
    -- Android ="Android/data/org.love2d.android",
    ["OS X"]="Library/Application Support/pico-8",
    Windows ="%appdata%\\pico-8"
}
-- local horizon_splash = (g_system == "3DS" and "3DS > Switch" or "Who the fuck would even play this on a 3DS?")
local splashes = {
    "Winner of the fastest release award!",
    "Don't make me tell your mom about her.",
    "Who needs sex when you can flirt with pixels?",
    -- horizon_splash,
    "This game contains mild sex.",

    'It\'s "PICO-8," not "Pico 8," dummkopf!',
    "PICO-8 > Ren'Py",
    '?"HELLO, WORLD!"',
    basedirs[g_system],

    "DDLC is quivering in its shoes right now.",
    "I gently open the door.",
    "PPLC died for this."
}
local random_msg = love.math.random(1, #splashes)

function splash_draw()
	bgImg:draw()
	if state == "splash" then -- splash1 (imaiden_B Splash Screen)
        local testsuffix = test and " Dev" or ''
		lg.oprint("In a Heartbeat "..ver..testsuffix, 0, 121, 0)
	elseif state == "splash2" then -- splash2 (Splash Text)
		splashbox:draw(64 - splashbox.get.width/2, 64 - splashbox.get.height/2)
	end
end

function splash_update()
	--splash screen s_timer
	s_timer = s_timer+dt
	print("s_timer: "..s_timer)
	
	if state == "splash" then
		--imaiden_B splash
		if s_timer >= 1.5 and s_timer < 2.5 then tag '4'
		elseif s_timer >= 4 then
			tag '3'
			splashbox:send("{b}"..splashes[random_msg], 112, true)
			state = "splash2"
		end
	--splash screen
	elseif state == "splash2" and s_timer >= 7 then changeState "game"
	end
end