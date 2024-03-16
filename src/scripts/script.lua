tagtimer = 0

---Creates dialogue.
---
---@param name string Who the dialogue is from. Providing "" results in no name box being drawn.
---@param text? string The text to display. If blank, hides the box.
function dlg(name, text)
	if autotimer > 0 and dlgtext:is_finished() then
		tagtimer = tagtimer+2
		if tagtimer >= 250 then
			scriptJump(ptr+1)
			tagtimer = 0
			autotimer = .01
		end
	else tagtimer = 0
	end
	if text == lastDlg and name == ct then return end
	mc_enabled = false
	
	lastDlg = text
	ct = name
	
	if not text then dlg_enabled = false return
	else dlg_enabled = true
	end
	
	--auto-add quotation marks
    if name ~= '' then text = '"'..text..'"' end
	
	local printtext = ct..': '..text
	local histtext = "{b}"..ct.."{/b}: "..text
	if ct == '' then
		printtext = text
		histtext = text
	end
	table.insert(history, #history+1, histtext)
	
	print(printtext)
	dlgbox:setTag "blank"
	dlgtext:send(text, 124)
end

---Progress the script.
function scriptCheck()
	loadstring("ch"..math.min(chapter, 3).."script()")()
end

function b(text) dlg('', text) end -- Create narration.
function a(text) dlg("Aiden", text) end -- Create dialogue from Aiden.
function p(text) dlg("Spencer", text) end -- Create dialogue from Spencer.
function s(text) dlg("Sarah", text) end -- Create dialogue from Sarah.
function l(text) dlg("Liam", text) end -- Create dialogue from Liam.

function mcdlg(name, text)
	if text == lastDlg then return end
	
	lastDlg = text
	ct = name
	
	if not text then mc_enabled = false return
	else mc_enabled = true
	end
	
	local histtext = ct..': '..text
	if ct == '' then histtext = text end
	table.insert(history, #history+1, histtext)
	
	-- DDLC-LOVE moment
	if history[5] == text or history[5] == histtext then error("Script issue detected at: "..ptr..'\n'..history[3]) end
    
	if name ~= '' then text = '<'..name.."> "..text end
	print(text)

	minecrafttext:send(text, 126, true)
end

function mb(text) mcdlg('', text) end -- Create narration in Minecraft.
function ma(text) mcdlg("imaiden_B", text) end -- Create dialogue from imaiden_B.
function mp(text) mcdlg("engineer723", text) end -- Create dialogue from engineer723.

---Wait some time, then increment ptr.
---@param t integer How many seconds to wait.
---@param d boolean? Whether to hide the dialogue box during the wait.
function wait(t, d)
	if d then dlg_enabled = false end
	dlgbox:setTag "blank"
	autotimer = 0
	tagtimer = tagtimer+dt
	ct = ''
	if tagtimer >= t then
		scriptJump(ptr+1)
		tagtimer = 0
		if d then dlg_enabled = true end
	end
end

function scriptJump(nu, fu, au) -- Jumps ahead in the script to ptr `nu` and calls function `[fu]`.
	xaload = -1
	unitimer = 0
	if nu then ptr = nu end
	if au then
		autotimer = au
		autoskip = au
	end
	if fu and fu ~= '' then loadstring(fu.."()")() end
end
---Prompt the player to make a choice.
---
---The chosen string is stored in `choice`.
---@param t string[]|string The choice(s) to offer.
function choose(t)
	if state ~= "pause" then
        items = type(t) == "string" and {t} or t
		choosing = true
		autotimer = 0
		autoskip = -1
	end
end

---Play the cart spin animation.
function cartSpin()
	if gui.cartSpin.paused then
		gui.cartSpin:play()
		hideAll()
		music ''
		b ''
		if ptr == 803 then immediatetext:send "{warp=2}> " end
	end
	gui.cartSpin:update(dt)
end