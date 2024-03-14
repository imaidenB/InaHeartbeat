---Change the displayed background.
---@param img string The new background, images/bg/`img`.png.
---@param tag string|integer? The animation tag to use, if changing to a CG.
---@param force boolean? Whether to set the background even if it's already set to img.
function bg(img, tag, force)
	if background ~= img or force then
		print("Setting background to", img)
		if img == '' then bgImg = blankImg
		elseif img:sub(1, 3) == "cg/" then
			tag = tostring(tag)
			bgImg = peachy.new("bg/"..img, tag)
			bgTag = tag
		else bgImg = lg.newImg("bg/"..img)
		end
	end
	background = img
end

---Change the current animation tag of bgImg.
---Fails if the current background is not a CG.
---@param tag string|integer The animation tag to set bgImg to.
function tag(tag)
	if background:sub(1, 3) ~= "cg/" then return end
	tag = tostring(tag)
	if bgImg.tag and bgImg.tagName ~= tag and bgImg.frameTags[tag] then
		bgImg:setTag(tag)
		bgTag = tag
	end
end

--[[
	If you want to make your own BGs or CGs, I suggest grabbing LibreSprite at https://github.com/LibreSprite/LibreSprite/.
	If you already own Aseprite, use that. It's much better, but I'm broke so~
	---- BGs ----
	Backgrounds are simple. They just need to be placed in assets/images/bg/ and switched to with bg(img:string).
	For example, calling
		bg "sarah_ext"
	would switch the background to the image assets/images/bg/sarah_ext.png.
	---- CGs ----
	CGs are a bit trickier. They are Aseprite files exported as spritesheets and consist of a .png and a .json.
	As said in the Peachy documentation, they need to be exported as *array* spritesheets, and with relative paths.
	Meaning that, for example, you would change the "image" field at the bottom of the JSON from
		"image": "C:\Users\User\Desktop\GitHub\InaHeartbeat\src\assets\images\bg\cg\a_cg1.png"
	to
		"image": "bg/cg/a_cg1"
	if you wanted to use a_cg1.
	You'd place the image in assets/images/bg/cg/ and the JSON in assets/images/json/bg/cg/.
	If the CG had animation tags in Aseprite, use bg(img:string, tag:string) or tag(tag:string) to switch to that tag.
	If not, use bg(img:string, tag:integer) or tag(tag:integer) to switch to individual frames.
]]