--default persistent values
ptr = 0 -- How many instructions the player has gone through in their save file
chapter = 0 -- Which script file to call
bgTag = '' -- Which tag of `background`.ase to use
background = "black" -- Which .ase file to use for the background
song = '0' -- Which .mp3 file to use for BGM
ct = '' -- The current speaker
a_Set = {h = '', b = '', x = 0, visible = false} -- Aiden's portrait settings
s_Set = {h = '', b = '', x = 0, visible = false} -- Sarah's portrait settings
l_Set = {h = '', b = '', x = 0, visible = false} -- Liam's portrait settings
items = {''} -- The current onscreen choices
choice = '' -- The last choice

function savegame()
	local itemset = ''

	for i = 1, #items do
		if items[i] and items[i+1] then
			itemset = itemset..items[i]..'","'
		elseif items[i] then
			itemset = itemset..items[i]
		end
	end
	
	local savedata = "ptr="..ptr..'\
background="'..background..'"\
song="'..song..'"\
bgTag="'..bgTag..'"\
ct="'..ct..'"\
a_Set={h="'..a_Set.h..'",b="'..a_Set.b..'",x='..a_Set.x..',visible='..tostring(a_Set.visible)..'}\
s_Set={h="'..s_Set.h..'",b="'..s_Set.b..'",x='..s_Set.x..',visible='..tostring(s_Set.visible)..'}\
l_Set={h="'..l_Set.h..'",b="'..l_Set.b..'",x='..l_Set.x..',visible='..tostring(l_Set.visible)..'}\
chapter='..chapter..'\
items={"'..itemset..'"}\
choice="'..choice..'"'
	
	createDirectory "cdata"
	write("cdata/imaidenb_heartbeat_1.p8d.txt", savedata)
end

function loadgame()
	pcall(fileload "cdata/imaidenb_heartbeat_1.p8d.txt")
	if chapter == 4 then changeState "credits"
	elseif chapter == 5 then changeState "error"
	else changeState("game", chapter)
	end
end