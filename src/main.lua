-- In a Heartbeat
-- by imaiden_B

-- Engine adapted from https://www.github.com/LukeZGD/DDLC-LOVE
-- Palette, P8SCII font, music composure, and boot & cartswap animations from https://lexaloffle.com/pico-8.php
-- Mojangles font from https://www.minecraft.net

-- Third-party music used:
--- C418 - Sweden
--- Junichi Masuda - Lavender Town
--- Jonathan Coulton - Still Alive

-- Still Alive cover and visuals by https://www.lexaloffle.com/bbs/?uid=13822
-- All other music made/covered by imaiden_B

--[[
	Please don't rely on my code being good. I know how to code, but I don't know how to explain it well. >_<
	I've tried my best to comment a lot of the scripts in this game, but some of them I've failed at.
	So, please forgive me if parts of it aren't easy to understand. I'm only human, after all.

	I intend on supporting 3DS and Android at some point, once I figure out how to add buttons to the screen.
	Theoretically, IaH should support 3DS out of the box, but I just want to get this game done, so I'm putting it off lol.
	Same with controller, afaIk. Maybe I'll come back later and do it proper. But I've got plans, so we'll see.
]]


-- Enables printing to lovebird at http://127.0.0.1:8000/ and incrementing/decrementing ptr with right and left.
test = false

---The operating system running the game.
---Used for file saving and platform-specific features.
---@type "Windows"|"OS X"|"Android"|"3DS"
g_system = love._console_name or love.system.getOS()

-- Make sure that random is random.
love.math.setRandomSeed(os.time())
math.randomseed(os.time())
love.math.random()
love.math.random()
love.math.random()

-- log require()s
local _require = require
function require(modname)
	print("require: "..modname)
	return _require(modname)
end

function log(cond, ...)
	if cond then return false end
	local str = ''
	for _, s in pairs {...} do
		str = str..tostring(s)
	end
	print("Error: "..str)
	return true
end

---Returns the sign of `n`, -1, 0, or 1.
---@param n number The number to check.
---@return integer s The sign of `n`.
function sign(n) return n > 0 and 1 or n < 0 and -1 or 0 end

if test then
	lovebird = require "lib/lovebird"
	lovebird.wrapprint = true
	lovebird.init()
end
peachy = require "lib/peachy" -- Exported Aseprite animation parsing
gscreen = require "lib/pixel" -- Used for 128x128 resolution
slicy = require "lib/slicy" -- 9-slicing
text = require "lib/text" -- Text boxes
-- Allow running Lua code inside of text boxes.
-- Used for incrementing ptr during the ending and changing the credits GFX.
text.configure.function_command_enable(true)
text.configure.image_table { -- Allow inline images inside of text boxes. Used to display chibis in credits.
	p = love.graphics.newImage "assets/images/credits/p.png",
	a = love.graphics.newImage "assets/images/credits/a.png",
	s = love.graphics.newImage "assets/images/credits/s.png",
	l = love.graphics.newImage "assets/images/credits/l.png"
}

-- Use either love.filesystem or nativefs for reading and writing files, depending on the operating system.
-- 3DS uses sdmc:/3ds/data/LovePotion/InaHeartbeat.
-- Android uses Android/data/org.love2d.android/files/save/InaHeartbeat.
-- MacOS/OS X uses Application Support/pico-8.
-- Windows uses %appdata%\pico-8.
if g_system == "3DS" or g_system == "Android" then
	write = love.filesystem.write
	read = love.filesystem.read
	createDirectory = love.filesystem.createDirectory
	fileload = love.filesystem.load
	getInfo = love.filesystem.getInfo
	getWorkingDirectory = love.filesystem.getWorkingDirectory
	p8Dir = ''
else
	nativefs = require "lib/nativefs"
	nativefs.setWorkingDirectory(love.filesystem.getAppdataDirectory().."/pico-8")
	write = nativefs.write
	read = nativefs.read
	createDirectory = nativefs.createDirectory
	fileload = nativefs.load
	getInfo = nativefs.getInfo
	getWorkingDirectory = nativefs.getWorkingDirectory
	p8Dir = "appdata/InaHeartbeat"
end
require "loader/portraits" -- Portrait updating and drawing
require "loader/audio" -- BGM and SFX
require "loader/images" -- Backgrounds and CGs
require "loader/states" -- Game states
require "draw" -- Drawing functions
require "states/pause" -- PICO-8 menu
require "saveload" -- Data saving and loading
require "history" -- Dialogue history
require "scripts/script" -- Visual novel engine

function love.load()
	-- Initialize gscreen and disable the mouse cursor
	gscreen.load()
	gscreen.force_cursor(false)
	lg.setBackgroundColor(0,0,0) -- Start off with a black screen
	love.window.setIcon(love.image.newImageData "assets/images/icon.png") -- Set the window icon
	-- PICO-8 color palette
	clr = {
		[0]={0,0,0},
		{29,43,83},
		{126,37,83},
		{0,135,81},
		{171,82,54},
		{95,87,79},
		{194,195,199},
		{255,241,232},
		{255,0,77},
		{255,163,0},
		{255,236,39},
		{0,228,54},
		{41,173,255},
		{131,118,156},
		{255,119,168},
		{255,204,170}
	}
	getTime = 0
	startTime = getTime
	print_full = false
	autotimer = 0 -- Auto-forward timer
	autoskip = 0 -- Skip timer
	sectimer = 0
	xaload = 0 -- Used for ensuring some commands only happen on the first instruction call
	lastDlg = '' -- Used for making sure we don't call the same dialogue twice in a row
	paused = false
	dlg_enabled = true -- Whether or not the dialogue box can be drawn.
	history = {} -- The dialogue history
	ver = 0.2 -- Development version

	love.window.setTitle "InaHeartbeat" -- PICO-8 exported binaries use the cart title during boot

	changeState "load" -- Start booting PICO-8
end

function love.draw()
	gscreen.start()
	if state == "load" or state == "error" then bootAnim:draw()
	elseif state == "splash" or state == "splash2" or state == "title" then splash_draw()
	elseif state == "game" then game_draw()
	elseif state == "pause" then pause_draw()
	elseif state == "cartswap" then gui.cartSpin:draw()
	elseif state == "credits" then credits_draw()
	end
	-- If we're in test mode, print the current ptr at the top of the screen.
	if test then lg.oprint(ptr, 64 - string.len(ptr)*2, dlgTop and 122 or 1, 7, 0) end
	gscreen.stop()
end

function love.update(delta)
	if test then lovebird.update() end

	dt = delta
	sectimer = sectimer+dt
	if sectimer >= 1 then sectimer = 0 end
	getTime = getTime+dt

	gscreen.update()

	-- BGM looping logic
	if state ~= "pause" and bgmloop and (
		not bgm or not bgm:isPlaying() and not bgmloop:isPlaying()
	) then
		bgmloop:play()
	end
	
	if state == "pause" then return
	elseif history_enabled then history_update(dt)
	elseif state == "load" then load_update()
	elseif state == "splash" or state == "splash2" or state == "title" then splash_update()
	elseif state == "game" then game_update()
	elseif state == "cartswap" then gui.cartSpin:update(dt)
	elseif state == "credits" then credits_update()
	end
end

function love.keypressed(key)
	if key == "return" and love.keyboard.isDown("lalt", "ralt") then
		gscreen.toggle_fullscreen()
		return
	end
	if state == "pause" or state == "error" then
		if key == 'z' or key == 'c' or key == 'n' then key = 'b'
		elseif key == 'x' or key == 'v' or key == 'm' then key = 'a'
		elseif key == 'p' or key == "return" then key = "start"
		elseif key ~= "up" and key ~= "down" and key ~= "left" and key ~= "right" then return
		end
		if state == "error" then love.event.quit()
		else pause_keypressed(key)
		end
	else
		if key == "space" or key == 'x' or key == 'v' or key == 'm' then key = 'a'
		elseif key == "backspace" or key == 'z' or key == 'c' or key == 'n' then key = 'b'
		elseif key == 'p' or key == "return" or key == "escape" then key = "start"
		elseif key ~= "up" and key ~= "down" and key ~= "left" and key ~= "right" then return
		end
		if state == "game" then game_keypressed(key)
		elseif state == "credits" then credits_keypressed(key)
		end
	end
end
function love.gamepadpressed(_,button)
	if button == "dpup" then button = "up"
	elseif button == "dpdown" then button = "down"
	elseif button == "dpleft" then button = "left"
	elseif button == "dpright" then button = "right"
	elseif g_system == "3DS" then
		if button == 'a' or button == 'x' then button = 'z'
		elseif button == 'b' or button == 'y' then button = 'x'
		end
	end
	love.keypressed(button)
end

function love.keyreleased(key)
	if state ~= "pause" then return end
	if key == 'z' or key == 'c' or key == 'n' then key = 'b'
	elseif key == 'x' or key == 'v' or key == 'm' then key = 'a'
	elseif key == 'p' or key == "return" then key = "start"
	elseif key ~= "up" and key ~= "down" and key ~= "left" and key ~= "right" then return
	end
	pause_keyreleased(key)
end
function love.gamepadreleased(_,button)
	if state ~= "pause" then return end
	if button == "dpup" then button = "up"
	elseif button == "dpdown" then button = "down"
	elseif button == "dpleft" then button = "left"
	elseif button == "dpright" then button = "right"
	elseif g_system == "3DS" then
		if button == 'a' or button == 'x' then button = 'z'
		elseif button == 'b' or button == 'y' then button = 'x'
		end
	end
	love.keyreleased(button)
end