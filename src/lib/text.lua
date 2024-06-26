local m = {
  debug = true,
  _NAME = 'SYSL-Text',
  _VERSION = '2.1',
  _DESCRIPTION = 'Fancy Text System',
  _URL = 'https://github.com/SystemLogoff',
  _LICENSE = [[
      MIT LICENSE
  
      Copyright (c) 2021 Chris / Systemlogoff (modified by imaiden_B)
  
      Permission is hereby granted, free of charge, to any person obtaining a
      copy of this software and associated documentation files (the
      "Software"), to deal in the Software without restriction, including
      without limitation the rights to use, copy, modify, merge, publish,
      distribute, sublicense, and/or sell copies of the Software, and to
      permit persons to whom the Software is furnished to do so, subject to
      the following conditions:
  
      The above copyright notice and this permission notice shall be included
      in all copies or substantial portions of the Software.
  
      THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
      OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
      MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
      IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
      CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
      TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
      SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    ]],
}

--[[----------------------------------------------------------------------------------------------------
        Convert Global Commands to Local
        Read more: http://lua-users.org/wiki/OptimisingUsingLocalVariables
----------------------------------------------------------------------------------------------------]] --
local unpack = unpack
local love = love
local utf8 = require("utf8")

--[[----------------------------------------------------------------------------------------------------
        Debug Print - Confirms Loaded when m.debug is true.
----------------------------------------------------------------------------------------------------]] --
local function dprint(...)
  if m.debug then
    print(m._NAME .. ": ", unpack({
      ...,
    }))
  end
end
dprint("Loaded")

--[[----------------------------------------------------------------------------------------------------
        Defaults
----------------------------------------------------------------------------------------------------]] --
--[[ Default Picture ]] ---------------------------------------------------------------------------------
-- Creates a picture to draw in case someone passes a non-existent picture.
local _undefined_image = love.image.newImageData(16, 16)
for i = 0, 15 do
  _undefined_image:setPixel(i, 0, 1, .2, .2, 1)
  _undefined_image:setPixel(0, i, .2, .2, 1, 1)
  _undefined_image:setPixel(9, i, .2, 1, .2, 1)
  _undefined_image:setPixel(i, 9, 1, 1, .2, 1)
  _undefined_image:setPixel(i, i, 1, .2, 1, 1)
end
local undefined_image = love.graphics.newImage(_undefined_image)

--[[ Default Audio ]] -----------------------------------------------------------------------------------
-- Table of voices to use for speaking.
-- You will need to update this path.
local text_sounds = {}

--[[ Magic Characters ]] ---------------------------------------------------------------------------------
-- 1. Starts a drawing command, the default is "["
-- 2. Ends a drawing command, the default is "]"
-- 3. One time commands are tagged with this value after running so they do not run more than once. The default is "#"
-- 4. Commands that pass values use this to split it from the command. The default is "="
-- 5. Tag that is used before Unicode text as a dirty hack to get it to work with this library. The default is "|"
-- 5a. Use it as follows (assumes defaults) [|è]
-- I do not want to update the documentation, so please make the changes
local special_character = {
  "{",
  "}",
  "#",
  "=",
  "|",
}

--[[ Data Shortcuts ]] ----------------------------------------------------------------------------------
-- Text assumes that you are storing your assets in a table for access.
-- You may have to hack some text commands if this is incorrect for your project.
-- Note: All commands that pass values convert them to lowercase.
local audio_table = nil
local font_table = nil
local icon_table = nil
local image_table = nil
local palette_table = clr
local shader_table = nil
local function_command = nil

--[[----------------------------------------------------------------------------------------------------
       Local Functions
----------------------------------------------------------------------------------------------------]] --
--[[ Special Character Conversion ]] --------------------------------------------------------------------
-- Convert newline and tab characters into their commands.
local function convert_special_character(char)
  if char == "\n" then
    return special_character[1] .. "newline" .. special_character[2]
  elseif char == "\t" then
    return special_character[1] .. "tab" .. special_character[2]
  else
    return char
  end
end

--[[ Get character Width ]] -----------------------------------------------------------------------------
-- Get the width of the current character width the current font.
local function get_character_width(character) return love.graphics.getFont():getWidth(character) end

--[[ Get character Height ]] ----------------------------------------------------------------------------
-- Get the width of the current character height the current font.
local function get_character_height() return love.graphics.getFont():getHeight() end

--[[ Tag Command ]] ---------------------------------------------------------------------------------------
-- Tag the start of the command once run with special_character[3] so it only runs once.
local function one_time_command(self, check)
  if check then
    if self.table_string[self.current_character - 1]:match(check) then
      self.table_string[self.current_character - 1] = self.table_string[self.current_character - 1]:sub(2,
        #self.table_string[self.current_character - 1] - 1)
      self.table_string[self.current_character - 1] = special_character[1] .. special_character[3] ..
                                                        self.table_string[self.current_character - 1] ..
                                                        special_character[2]
    end
  else
    self.table_string[self.current_character - 1] = self.table_string[self.current_character - 1]:sub(2,
      #self.table_string[self.current_character - 1] - 1)
    self.table_string[self.current_character - 1] = special_character[1] .. special_character[3] ..
                                                      self.table_string[self.current_character - 1] ..
                                                      special_character[2]
  end
  -- print(table.concat(self.table_string))
end

--[[ Split String ]] --------------------------------------------------------------------------------------
-- Split a string into a table with a separator character.
local function split_string_by(str, sep)
  local return_string = {}
  local n = 1
  for w in str:gmatch("([^" .. sep .. "]*)") do
    return_string[n] = return_string[n] or w -- only set once (so the blank after a string is ignored)
    if w == "" then n = n + 1 end -- step forwards on a blank but not a string
  end
  return return_string
end

--[[ Table Copy ]] ----------------------------------------------------------------------------------------
-- Shallow copy a table
local function table_shallow_copy(table_string)
  local table_copy
  if type(table_string) == 'table' then
    table_copy = {}
    for orig_key, orig_value in pairs(table_string) do table_copy[orig_key] = orig_value end
  else -- number, string, boolean, etc.
    table_copy = table_string
  end
  return table_copy
end

--[[ String to Table ]] -------------------------------------------------------------------------------
-- "Change.a.string" to a table: Change[a][string]
local function string_to_table(string)
  -- This will allow you to return a table if you don't use global holders for assets.
  if type(string) == "table" then
    return string
  end
  -- Otherwise, do the deed.
  local table_find = _G -- Select the global table
  for w in string.gmatch(string, "[%w_]+") do -- matches both alphanumeric characters and underscores, more than once
    assert(table_find[w], "This table does not exist: " .. string)
    table_find = table_find[w] -- for each one start gluing the table back together
  end
  return table_find -- Return the table reference
end

--[[----------------------------------------------------------------------------------------------------
       Configuration Functions
----------------------------------------------------------------------------------------------------]] --
m.configure = {}

function m.configure.audio_table(table_string) audio_table = table_string end

function m.configure.font_table(table_string) font_table = table_string end

function m.configure.image_table(table_string) image_table = table_string end

function m.configure.icon_table(table_string) icon_table = table_string end

function m.configure.palette_table(table_string) palette_table = table_string end

function m.configure.shader_table(table_string) shader_table = table_string end

function m.configure.function_command_enable(enable_bool) function_command = enable_bool end

function m.configure.add_text_sound(sound, volume)
  -- sound should be a short love2d sound object
  -- volume is adjusting the sound level for the voice.
  text_sounds[#text_sounds + 1] = sound
  if volume then text_sounds[#text_sounds]:setVolume(volume) end
end

--[[----------------------------------------------------------------------------------------------------
       Class Functions
----------------------------------------------------------------------------------------------------]] --
local M = {}

--[[----------------------------------------------------------------------------------------------------
       IS_FINISHED - Returns if the textbox has finished printing all the text or is waiting for input.
----------------------------------------------------------------------------------------------------]] --
function M:is_finished() return self.current_character == #self.table_string or self.waitforinput end

--[[----------------------------------------------------------------------------------------------------
       CONTINUE - Continues printing if stopped by [waitforinput]
----------------------------------------------------------------------------------------------------]] --
function M:continue() self.waitforinput = false end

--[[----------------------------------------------------------------------------------------------------
       FINISH - Instantly finishes the dialogue
----------------------------------------------------------------------------------------------------]] --
function M:finish() self.current_character = #self.table_string end

--[[----------------------------------------------------------------------------------------------------
       SEND - Sends a string to be drawn by the current textbox.
----------------------------------------------------------------------------------------------------]] --
function M:send(text, wrap_num, show_all)
  ------------------------------------------------------------------------------
  -- UTF8 -> WRAP so the library understands.
  ------------------------------------------------------------------------------
  local words = {}
  for _, c in utf8.codes(text) do
    if #utf8.char(c) > 1 then
      table.insert(words, special_character[1] .. special_character[5] .. utf8.char(c) .. special_character[2])
    else
      table.insert(words, utf8.char(c))
    end
  end
  -- Updated Text String comes out, all nice and wrapped.
  text = table.concat(words)
  -- /UTF8 -----------------------------------------------------------------------

  self.current_character = #self.table_string
  self.current_print_speed = self.default_print_speed
  self.waitforinput = false
  love.graphics.setFont(self.default_font)
  if text_sounds[self.sound_number] then text_sounds[self.sound_number]:stop() end

  text = text or "ERROR_NO_SENT_TEXT" -- Set a default message if nothing was sent.
  text = text .. special_character[1] .. "end" .. special_character[2] -- Append an 'end' tag to the end of the string
  text = self.prefix .. text -- add any formatting prefixes required.
  wrap_num = wrap_num or nil -- Wrap text at this many pixels
  self.table_string = {}
  self.timer_pause = 0
  self.timer_print = 0
  self.scroll = 0
  self.command_modifer = ""
  self.current_character = 0
  self.sound_every_counter = 1
  ------------------------------------------------------------------------------
  -- String -> Table, with the commands being split by special characters
  ------------------------------------------------------------------------------
  local command_word = false -- Special Character is always off at the start of any new string processing
  for i = 1, #text do -- For each character in the string, do the following
    local character = text:sub(i, i) -- Separate the character -- TODO UTF8Fix, for now use the insert commands [|ò]
    local next_character = text:sub(i+1, i+1) -- Separate the character -- TODO UTF8Fix, for now use the insert commands [|ò]
    character = convert_special_character(character) -- Convert any special characters
    if character == special_character[1] and next_character ~= special_character[1]  then -- If it's the first special character, confirm that
      command_word = true -- all should be combined until the second special character
      self.table_string[#self.table_string + 1] = "" -- Create the next table entry as an empty string
    end
    if command_word then
      self.table_string[#self.table_string] = self.table_string[#self.table_string] .. character -- Combine while command word is on / Commands are always LOWERCASE
    else
      self.table_string[#self.table_string + 1] = character -- push a single character otherwise
    end
    if character == special_character[2] then
      command_word = false -- If the second special_character is found, stop combining.
      self.table_string[#self.table_string + 1] = "" -- Insert a blank character after commands to buffer commands that pause or update text.
    end
  end
  -- print(unpack(self.table_string))
  ------------------------------------------------------------------------------
  -- Wraps text by a set number of pixels. Note: Assumes your self.default font! if you did not send one.
  -- This whole thing is very greedy.
  -- I could hack this to allow it to check for tags but it's more than I need
  -- to do.
  -- If you want to hack it,
  ------------------------------------------------------------------------------
  local line_start = {
    1,
  }
  if wrap_num then
    if type(wrap_num) ~= "number" then error("Wrap requires a number") end
    local last_space = 0
    local pixel_count = 0
    local pixel_count_last_space = 0
    local line_length = {}
    line_start = {
      1,
    } -- Exposing for line counting.
    local space_locations = {}
    local spaces_per_line = {}
    local space_count = 0
    local fulljustspace = {}
    for i = 1, #self.table_string do
      if #self.table_string[i] == 1 or self.table_string[i]:sub(1, 2) == special_character[1] .. special_character[5] then
        -- Keep track of the last space.
        if self.table_string[i] == " " then
          last_space = i
          pixel_count_last_space = 0
        end
        -- Count the pixels for the characters
        if self.table_string[i]:sub(1, 2) == special_character[1] .. special_character[5] then -- Have to count wrapped strings
          pixel_count = pixel_count + get_character_width(self.table_string[i]:sub(3, #self.table_string[i] - 1))
          -- print(get_character_width(self.table_string[i]:sub(3, #self.table_string[i]-1)))
        else
          pixel_count = pixel_count + get_character_width(self.table_string[i])
          -- I'm not dealing with kerning for unicode characters, you can't make me. Define your own table for that.
          if self.modify_character_width_table[self.table_string[i]] then 
            pixel_count = pixel_count + self.modify_character_width_table[self.table_string[i]]
          end
        end
        pixel_count_last_space = pixel_count_last_space + get_character_width(self.table_string[i])
        if math.floor(pixel_count) > wrap_num then
          if last_space ~= 0 then
            self.table_string[last_space] = special_character[1] .. "newline" .. special_character[2]
            line_start[#line_start + 1] = last_space + 1
          else
            table.insert(self.table_string, i, special_character[1] .. "newline" .. special_character[2])
            line_start[#line_start + 1] = i + 1
            pixel_count_last_space = 0
          end
          last_space = 0
          if self.keep_space_on_line_break then 
            pixel_count = pixel_count_last_space
            pixel_count_last_space = 0
          else
            pixel_count = 0
            pixel_count_last_space = 0
          end
        end
      else
        if self.table_string[i]:match("newline") then
          line_start[#line_start + 1] = i + 1
          last_space = 0
          pixel_count = 0
          pixel_count_last_space = 0
        end
        if self.table_string[i]:match("icon") then
          pixel_count = pixel_count + self.icon_width
          pixel_count_last_space = pixel_count_last_space + self.icon_width
        end
        if self.table_string[i]:match("font") then
          if true and font_table ~= nil and self.table_string[i] ~= special_character[1] .. "/font" ..
            special_character[2] then
            -- print(self.table_string[i]:sub(7, #self.table_string[i]-1))
            local font_table = string_to_table(font_table)
            if font_table[self.table_string[i]:sub(7, #self.table_string[i] - 1)] then
              love.graphics.setFont(font_table[self.table_string[i]:sub(7, #self.table_string[i] - 1)])
            end
          else
            love.graphics.setFont(self.default_font)
          end
        end
      end
    end
    if self.rendering ~= "left" then
      pixel_count = 0
      for i = 1, #self.table_string do
        if #self.table_string[i] == 1 or self.table_string[i]:sub(1, 2) == special_character[1] .. special_character[5] then -- Have to count wrapped strings
          if self.table_string[i]:sub(1, 2) == special_character[1] .. special_character[5] then
            pixel_count = pixel_count + get_character_width(self.table_string[i]:sub(3, #self.table_string[i] - 1))
          else
            pixel_count = pixel_count + get_character_width(self.table_string[i])
          end
          if self.table_string[i] == " " then
            space_locations[#space_locations + 1] = i
            space_count = space_count + 1
          end
        else
          if self.table_string[i]:match("newline") or self.table_string[i]:match("end") then
            line_length[#line_length + 1] = pixel_count
            pixel_count = 0
            spaces_per_line[#spaces_per_line + 1] = space_count
            space_count = 0
          end
          if self.table_string[i]:match("icon") then
            pixel_count = pixel_count + self.icon_width
            pixel_count_last_space = pixel_count_last_space + self.icon_width
          end
          if self.table_string[i]:match("font") then
            if true and font_table ~= nil and self.table_string[i] ~= special_character[1] .. "/font" ..
              special_character[2] then
              -- print(self.table_string[i]:sub(7, #self.table_string[i]-1))
              local font_table = string_to_table(font_table)
              love.graphics.setFont(font_table[self.table_string[i]:sub(7, #self.table_string[i] - 1)])
            else
              love.graphics.setFont(self.default_font)
            end
          end
        end
      end
      if self.rendering == "right" then
        for i = #line_start, 1, -1 do
          table.insert(self.table_string, line_start[i],
            special_character[1] .. "pad=" .. wrap_num - line_length[i] .. special_character[2])
        end
      end
      if self.rendering == "center" then
        for i = #line_start, 1, -1 do
          table.insert(self.table_string, line_start[i], special_character[1] .. "pad=" ..
            math.floor((wrap_num - line_length[i]) / 2) .. special_character[2])
        end
      end
      if self.rendering == "full" then -- Greedy
        for i = 1, #spaces_per_line do
          for each_space = 1, spaces_per_line[i] do
            fulljustspace[#fulljustspace + 1] = special_character[1] .. "pad=" ..
                                                  ((wrap_num - line_length[i]) / spaces_per_line[i]) +
                                                  get_character_width(" ") .. special_character[2]
            if false then
              print(line_length[i], spaces_per_line[i], (wrap_num - line_length[i]) / spaces_per_line[i] + 0.5)
            end
          end
        end
        if false then print(unpack(fulljustspace)) end
        for i = 1, #space_locations do self.table_string[space_locations[i]] = fulljustspace[i] end
      end
    end
  end

  ------------------------------------------------------------------------------
  -- Forces the string to display without drawing one at a time.
  -- Also removes any banned commands from instant display.
  ------------------------------------------------------------------------------
  if show_all then
    local banned_commands = {
      "backspace",
      "w",
      "skip",
      "audio",
      "waitforinput",
      "s",
      "warp",
    } -- HACK: Some commands are not allowed when showing all the text at once.
    for i = 1, #self.table_string do
      for x = 1, #banned_commands do
        if self.table_string[i] == special_character[1] .. banned_commands[x] .. special_character[2] then
          self.table_string[i] = special_character[1] .. special_character[3] .. banned_commands[x] ..
                                   special_character[2]
        end
      end
    end
    self.current_character = #self.table_string
  end

  ------------------------------------------------------------------------------
  -- Hack using special_character[5] (default |) to draw Unicode.
  ------------------------------------------------------------------------------

  for i = 1, #self.table_string do
    if self.table_string[i]:match("%" .. special_character[1] .. special_character[5] .. "sp1" .. "%" ..
                                    special_character[2]) then self.table_string[i] = special_character[1] end
    if self.table_string[i]:match("%" .. special_character[1] .. special_character[5] .. "sp2" .. "%" ..
                                    special_character[2]) then self.table_string[i] = special_character[2] end
    if self.table_string[i]:match("%" .. special_character[1] .. special_character[5]) then
      self.table_string[i] = self.table_string[i]:sub(3, #self.table_string[i] - 1)
    end
  end

  ------------------------------------------------------------------------------
  -- Calculates width and height, no matter what display mode the text is set to.
  -- Note, some special commands will throw this off, such as cursor drawing
  -- changes and text animation.
  ------------------------------------------------------------------------------
  if wrap_num then
    if type(wrap_num) ~= "number" then error("Wrap requires a number") end
    -- Width / Set by autowrap 
    self.get.width = wrap_num
    -- Lines / Grab from calc above. 
    self.get.lines = #line_start
    -- Height / Grab from calc above.
    self.get.height = self.get.lines * get_character_height() + self.adjust_line_height
  else
    --------------------------------------------------------------------------
    -- Calculation is less robust when an autowrap width is not sent.
    --------------------------------------------------------------------------
    local lines = 1
    local newline_pos = {
      1,
    }
    --------------------------------------------------------------------------
    -- Height
    --------------------------------------------------------------------------
    for i = 1, #self.table_string do
      if self.table_string[i] == special_character[1] .. "newline" .. special_character[2] then
        lines = lines + 1
        newline_pos[#newline_pos + 1] = i
      end
    end
    newline_pos[#newline_pos + 1] = #self.table_string

    self.get.height = lines * get_character_height() + self.adjust_line_height

    --------------------------------------------------------------------------
    -- Lines
    --------------------------------------------------------------------------
    self.get.lines = lines
    --------------------------------------------------------------------------
    -- Width
    --------------------------------------------------------------------------
    local line_table = {}
    local commandless_string = ""
    -- Cut out each line, strip commands
    for i = 1, #newline_pos - 1 do
      commandless_string = ""
      for j = newline_pos[i], newline_pos[i + 1] do
        if self.table_string[j]:sub(1, 1) ~= special_character[1] then
          commandless_string = commandless_string .. self.table_string[j]
        end
      end
      line_table[i] = commandless_string
    end
    -- Find the longest line
    local twidth = 0
    for i = 1, #line_table do
      if twidth < get_character_width(line_table[i]) then twidth = get_character_width(line_table[i]) end
    end
    self.get.width = twidth
  end

end

--[[----------------------------------------------------------------------------------------------------
       SETDEFAULTS - Resets to default values at the start of string rendering.
----------------------------------------------------------------------------------------------------]] --
function M:setDefaults()
  -- Text
  self.current_color = self.default_color
  love.graphics.setFont(self.default_font)
  self.current_print_speed = self.default_print_speed
  self.adjust_line_height = self.default_adjust_line_height
  -- Commands
  for k, v in pairs(self.effect_flags) do self.effect_flags[k] = false end
end

--[[----------------------------------------------------------------------------------------------------
       DRAW - Draw the text.
----------------------------------------------------------------------------------------------------]] --
function M:draw(tx, ty)
  -- love.graphics.rectangle("fill", tx, ty, self.get.width, self.get.height)
  self.tx = tx
  self.ty = ty + self.scroll
  if #self.table_string == 0 then return self.tx, self.ty end -- Don't bother trying to do anything if the string is empty.
  ------------------------------------------------------------------------------
  -- Reset any cursor positions
  ------------------------------------------------------------------------------
  self.cursor = {
    x = 0,
    y = 0,
  }
  self.cursor_storage = {
    x = 0,
    y = 0,
  }
  ------------------------------------------------------------------------------
  -- Define the default drawing values, and set the defaults before
  -- entering the draw loop.
  ------------------------------------------------------------------------------
  local str = {
    x = self.tx + get_character_height() / 2,
    y = self.ty + get_character_height() / 2,
    rot = 0,
    sx = 1,
    sy = 1,
    ox = get_character_height() / 2,
    oy = get_character_height() / 2,
    padding = 0,
  }
  self:setDefaults()
  ------------------------------------------------------------------------------
  -- Step though each character in the table and do the following:
  ------------------------------------------------------------------------------
  for i = 1, self.current_character do
    str = self:changeDraw(self.tx, self.ty, i) -- Apply any changes to the drawing depending on the draw flags.
    if self.table_string[i] then -- If a valid character then:
      if not self.table_string[i]:match("%" .. special_character[1] .. ".") then -- If it's equal to only 1 or 2 character[s] then:
        self:addDraw(str, self.tx, self.ty, i) -- Draw any extra draw commands depending on draw flags
        love.graphics.setColor(self.current_color) -- Set the color to the current color
        love.graphics.print(self.table_string[i], str.x + self.cursor.x, str.y + self.cursor.y, str.rot, str.sx, str.sy,
          str.ox, str.oy) -- Print Text
        self.cursor.x = self.cursor.x + get_character_width(self.table_string[i]) -- Move cursor the length of the character.
        self.cursor.x = self.cursor.x + str.padding -- Move the cursor a bit more for padding reasons.
        love.graphics.setColor(1, 1, 1, 1) -- Reset to pure white
        love.graphics.setShader()
      else
        self:doCommand(self.table_string[i])(self, i) -- If the character is > 1 then it's a command, and we do a command.
      end
    end
  end
  love.graphics.setColor(1, 1, 1, 1) -- Reset to pure white
  love.graphics.setFont(self.default_font)
  -- if self == immediatetext then dprint "drawing immediate" end
  return self.cursor.x + 4, self.cursor.y + 5
end

--[[----------------------------------------------------------------------------------------------------
       UPDATE - Timers tick onwards, play sounds, characters print
----------------------------------------------------------------------------------------------------]] --
function M:update(dt)
  -----------------------------------------------------------------------------
  -- Animation Timer
  -----------------------------------------------------------------------------
  -- If you want hold a button to make something print faster, you can adjust the current print
  -- speed directly. 
  self.timer_animation = self.timer_animation + dt

  -- You know all those youtube videos like "waiting x months breaks this animation?"
  -- Cheap hack to stop it.
  if self.timer_animation >= math.huge then self.timer_animation = 0 end

  -----------------------------------------------------------------------------
  -- Pause Timer
  -- Always counting down, pauses printing when > 0
  -----------------------------------------------------------------------------
  self.timer_pause = self.timer_pause - dt
  if self.timer_pause < -3600 then self.timer_pause = 0 end -- Will allow it to break out of a stuck pause after one hour.
  if self.timer_pause < 0 then
    -----------------------------------------------------------------------------
    -- Printing Characters Timer
    -----------------------------------------------------------------------------
    if not self.waitforinput then
      self.timer_print = self.timer_print + dt -- Timer counts up in seconds.
    end

    if self.timer_print > self.current_print_speed then
      self.timer_print = 0 -- If we hit the print speed, we reset the timer.
      -----------------------------------------------------------------------------
      -- Advance the current max character printed if not paused
      -----------------------------------------------------------------------------
      self.current_character = self.current_character + 1

      -----------------------------------------------------------------------------
      -- Character Noises
      -----------------------------------------------------------------------------

      if self.character_sound then
        if self.table_string[self.current_character] and self.current_character ~= #self.table_string and
          not self.table_string[self.current_character]:match("%" .. special_character[1]) then
          if self.sound_every_counter >= self.sound_every then
            if self.table_string[self.current_character] ~= " " then
              if text_sounds[self.sound_number] then
                text_sounds[self.sound_number]:pause()
                text_sounds[self.sound_number]:seek(0)
                if self.warble == 0 then
                  text_sounds[self.sound_number]:setPitch(1)
                elseif self.warble < 0 then
                  text_sounds[self.sound_number]:setPitch(tonumber("0.9" .. math.random(0, 10 - math.abs(self.warble))))
                  -- print(self.warble, math.abs(self.warble), tonumber("9." .. math.random(0,math.abs(self.warble))))
                else
                  text_sounds[self.sound_number]:setPitch(tonumber("1." .. math.random(0, math.abs(self.warble))))
                end
                text_sounds[self.sound_number]:play()
              end
              -- print(self.table_string[self.current_character])
              self.sound_every_counter = 1
            end
          else
            self.sound_every_counter = self.sound_every_counter + 1
          end
        end
      end

    end

  end
  -----------------------------------------------------------------------------
  -- Skip waiting for rendering when it's a command.
  -----------------------------------------------------------------------------
  if self.table_string[self.current_character] and
    self.table_string[self.current_character]:match("%" .. special_character[1]) then
    self.current_character = self.current_character + 1
  end

  -- Limit the current character to the length of the string.
  if self.current_character > #self.table_string then self.current_character = #self.table_string end

end

--[[----------------------------------------------------------------------------------------------------
       COMMAND TABLE - Special commands used when rending text.
----------------------------------------------------------------------------------------------------]] --
M.command_table = {
  -----------------------------------------------------------------------------
  --  Script Commands
  -----------------------------------------------------------------------------
  --[[ Runs at end of string ]] ------------------------------------------------
  ["end"] = function(self) self:setDefaults() end,

  --[[ Do this function ]] ---------------------------------------------------------
  ["function"] = function(self)
    one_time_command(self, self.command_modifer[1])
    if not function_command then return end
    local full_command = table_shallow_copy(self.command_modifer)
    table.remove(full_command, 1)
    local _mod1 = table.concat(full_command, special_character[4])
    -- print(_mod1)
    local f = loadstring(_mod1)
    if type(f) == "nil" then return end
    f()
  end,

  --[[ Runs at end of string ]] ------------------------------------------------
  ["waitforinput"] = function(self)
    one_time_command(self, self.command_modifer[1])
    self.waitforinput = true
  end,

  --[[ Runs at end of string ]] ------------------------------------------------
  ["s"] = function(self)
    one_time_command(self, self.command_modifer[1])
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then _mod1 = (get_character_height() + self.adjust_line_height) * -1 end
    self.scroll = self.scroll + _mod1
  end,

  --[[ Scrolls and adds newlines ]] --------------------------------------------
  ["sn"] = function(self)
    one_time_command(self, self.command_modifer[1])
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then _mod1 = get_character_height() + self.adjust_line_height end
    self.scroll = self.scroll + _mod1 * -1
    self.cursor.y = self.cursor.y + _mod1
  end,

  -----------------------------------------------------------------------------
  --  Position Commands
  -----------------------------------------------------------------------------
  --[[ Move to next line ]] ----------------------------------------------------
  ["newline"] = function(self)
    self.cursor.x = 0 -- Reset to start of line
    self.cursor.y = self.cursor.y + get_character_height() -- Get the height of the font
    self.cursor.y = self.cursor.y + self.adjust_line_height -- adjust if set.
  end,

  --[[ Save Cursor Position ]] -------------------------------------------------
  ["cursorsave"] = function(self)
    self.cursor_storage.x = self.cursor.x
    self.cursor_storage.y = self.cursor.y
  end,

  --[[ Load Cursor Position ]] -------------------------------------------------
  ["cursorload"] = function(self)
    self.cursor.x = self.cursor_storage.x
    self.cursor.y = self.cursor_storage.y
  end,

  --[[ Set X Cursor Position ]] ------------------------------------------------
  ["cursorx"] = function(self)
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then return end
    self.cursor.x = _mod1
  end,

  --[[ Set Y Cursor Position ]] ------------------------------------------------
  ["cursory"] = function(self)
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then return end
    self.cursor.y = _mod1
  end,

  --[[ Tab Indent Text ]] ------------------------------------------------------
  ["tab"] = -- Moves over 4 spaces.
  function(self) self.cursor.x = self.cursor.x + love.graphics.getFont():getWidth(" ") * 4 end,

  --[[ Pad out the text this many pixels ]] -------------------------------------
  ["pad"] = function(self)
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then return end
    self.cursor.x = self.cursor.x + _mod1
  end,
  --[[ Adjust Line Height ]] -------------------------------------
  ["lineheight"] = function(self)
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then return end
    self.adjust_line_height = _mod1
  end,
  -----------------------------------------------------------------------------
  --  Character Timing
  -----------------------------------------------------------------------------
  --[[ Skip to the end of the string ]] ----------------------------------------
  ["skip"] = function(self) self.current_character = #self.table_string end,

  --[[ Pause for a set period ]] -----------------------------------------------
  ['w'] = function(self)
    one_time_command(self, self.command_modifer[1])
    local _mod1 = tonumber(self.command_modifer[2])
    -- print("Pause", _mod1)
    if type(_mod1) ~= "number" then return end
    if _mod1 <= 0 then return end
    self.timer_pause = _mod1
  end,

  --[[ Delete a set number of characters, destructive ]] -----------------------
  ["backspace"] = function(self)
    one_time_command(self, self.command_modifer[1])
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then return end
    if _mod1 <= 0 then return end
    for _ = 1, _mod1 + 1 do
      table.remove(self.table_string, self.current_character - 1)
      if self.current_character > 2 then self.current_character = self.current_character - 1 end
    end
  end,

  --[[ Change the speed for printing the characters ]] -------------------------
  ["cps"] = function(self)
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then return end
    self.current_print_speed = _mod1
  end,

  --[[ Reset the speed for printing the characters ]] --------------------------
  ["/cps"] = function(self) self.current_print_speed = self.default_print_speed end,

  --[[ Warp a set number of characters forward ]] ------------------------------
  ["warp"] = function (self)
    one_time_command(self, self.command_modifer[1])
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then return end
    if _mod1 > #self.table_string - self.current_character then return end
    if _mod1 <= 1 then return end
    self.current_character = self.current_character + _mod1
  end,

  --[[ Instantly dismiss the dialogue and increment ptr ]] ---------------------
  ["nw"] = function (self)
    self.current_character = #self.table_string
    scriptJump(ptr + 1)
  end,

  ------------------------------------------------------------------------------
  --  Text Formatting
  ------------------------------------------------------------------------------
  --[[ Set the text color ]] ---------------------------------------------------
  ["col"] = -- Sets the current color to a color on your palette table.
  function(self)
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then
      ---@diagnostic disable-next-line: cast-local-type
      _mod1 = tostring(self.command_modifer[2])
      if type(_mod1) == "string" then
        if _mod1:sub(1, 1) ~= "#" then
          return
        else
          local r = tonumber(_mod1:sub(2, 3), 16)
          local g = tonumber(_mod1:sub(4, 5), 16)
          local b = tonumber(_mod1:sub(6, 7), 16)
          local a = tonumber(_mod1:sub(8, 9), 16)
          if r == nil or g == nil or b == nil then return end
          if a == nil then a = 255 end
          r = r / 255;
          g = g / 255;
          b = b / 255;
          a = a / 255;
          self.current_color = {
            r,
            g,
            b,
            a,
          }
        end
      end
      return
    end
    if not palette_table then return end
    local palette_table = string_to_table(palette_table)
    if _mod1 > #palette_table then return end
    if _mod1 < 1 then return end
    self.current_color = palette_table[_mod1]
  end,

  --[[ Reset the text color ]] -------------------------------------------------
  ["/col"] = -- Resets color to the default color.
  function(self, i) self.current_color = self.default_color end,

  --[[ Set the text shadow color ]] ---------------------------------------------------
  ["shadowcol"] = function(self)

    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then
      ---@diagnostic disable-next-line: cast-local-type
      _mod1 = tostring(self.command_modifer[2])
      if type(_mod1) == "string" then
        if _mod1:sub(1, 1) ~= "#" then
          return
        else
          local r = tonumber(_mod1:sub(2, 3), 16)
          local g = tonumber(_mod1:sub(4, 5), 16)
          local b = tonumber(_mod1:sub(6, 7), 16)
          local a = tonumber(_mod1:sub(8, 9), 16)
          if r == nil or g == nil or b == nil then return end
          if a == nil then a = 255 end
          r = r / 255;
          g = g / 255;
          b = b / 255;
          a = a / 255;
          self.current_shadow_color = {
            r,
            g,
            b,
            a,
          }
        end
      end
      return
    end
    if not palette_table then return end
    local palette_table = string_to_table(palette_table)
    if _mod1 > #palette_table then return end
    if _mod1 < 1 then return end
    self.current_shadow_color = palette_table[_mod1]
  end,

  --[[ Reset the text shadow color ]] -------------------------------------------------
  ["/shadowcol"] = function(self, i) self.current_shadow_color = self.default_shadow_color end,


  --[[ Fake Bold ]] ------------------------------------------------------------
  ["b"] = function(self)
    self.effect_flags.dropshadow = 10
    self.current_color = {1, .94509803921569, .90980392156863}
  end,

  --[[ Turn off Fake Bold ]] ---------------------------------------------------
  ["/b"] = -- Turns off italics.
  function(self)
    self.effect_flags.dropshadow = false
    self.current_color = self.default_color
  end,

  --[[ Text blink ]] -----------------------------------------------------------
  ["blink"] = function(self)
    local _mod1 = tonumber(self.command_modifer[2])
    if type(_mod1) ~= "number" then
      self.effect_speed.blink_speed = self.effect_speed.blink_speed_default
    else
      self.effect_speed.blink_speed = _mod1
    end
    self.effect_flags.blink = true
  end,

  -----------------------------------------------------------------------------
  --  Image Commands
  -----------------------------------------------------------------------------
  --[[ Draw a picture ]] -------------------------------------------------------
  ["img"] = function(self)
    if not image_table then return end
    local image_table = string_to_table(image_table)
    local _mod1 = self.command_modifer[2]
    local _mod2 = self.command_modifer[3]
    if image_table[_mod1] and image_table[_mod1][_mod2] then
      love.graphics.draw(image_table[_mod1][_mod2], self.tx + self.cursor.x, self.ty + self.cursor.y)
      self.cursor.x = self.cursor.x + image_table[_mod1][_mod2]:getWidth()
    elseif image_table[_mod1] and type(image_table[_mod1]) ~= "table" then
      love.graphics.draw(image_table[_mod1], self.tx + self.cursor.x, self.ty + self.cursor.y)
      self.cursor.x = self.cursor.x + image_table[_mod1]:getWidth()
    else
      love.graphics.draw(undefined_image, self.tx + self.cursor.x, self.ty + self.cursor.y)
      self.cursor.x = self.cursor.x + undefined_image:getWidth()
    end
  end,

}

--[[----------------------------------------------------------------------------------------------------
       DOCOMMAND - Do the command if it's found in the command table.
----------------------------------------------------------------------------------------------------]] --
function M:doCommand(command)
  local splitcommands = {} -- Table to hold commands if they are split.
  command = command:sub(2, #command - 1) -- Trim special_characters from the entry
  if command:match(special_character[4]) then -- If the split character is in the command
    command = command:gsub("%s" .. special_character[4] .. "%s", special_character[4]) -- Trim spaces around it
    splitcommands = split_string_by(command, "=") -- Split commands into tables
    command = splitcommands[1] -- Make sure that the command is still sent as normal
    self.command_modifer = splitcommands -- Send the command modifiers to a place we can access them
  else
    self.command_modifer = {
      command,
    }
  end
  if self.command_table[command] then -- If found
    return self.command_table[command] -- Return the command function
  end
  return function() end -- Return a blank function if nothing is found.
end

--[[----------------------------------------------------------------------------------------------------
       CHANGE DRAW - Change the draw parameters depending on flags
----------------------------------------------------------------------------------------------------]] --
function M:changeDraw(tx, ty, i)
  local strchg = {
    x = math.floor(((tx + get_character_height() / 2)) + 0.5),
    y = math.floor(((ty + get_character_height() / 2)) + 0.5),
    rot = 0,
    sx = 1,
    sy = 1,
    ox = math.floor(((get_character_height() / 2)) + 0.5),
    oy = math.floor(((get_character_height() / 2)) + 0.5),
    padding = 0,
  }
  if self.effect_flags.italics then strchg.rot = strchg.rot + math.rad(10) end

  if self.effect_flags.swing then
    strchg.rot = strchg.rot + math.rad(math.sin(self.timer_animation * self.effect_speed.swing_speed) * 10)
  end

  if self.effect_flags.shake then
    strchg.x = math.floor((tx + get_character_width() / 2 +
                            math.sin(self.timer_animation * self.effect_speed.shake_speed + i / 2)) + 0.5) +
                 get_character_width(" ")
    strchg.y = math.floor((ty + get_character_height() / 2 +
                            math.cos(self.timer_animation * self.effect_speed.shake_speed + i / 2)) + 0.5)
  end

  if self.effect_flags.spin then
    strchg.x = math.floor((tx + get_character_width(self.table_string[i]) / 2) + 0.5)
    strchg.y = math.floor((ty + get_character_height() / 2) + 0.5)
    strchg.ox = math.floor((get_character_width(self.table_string[i]) / 2) + 0.5)
    strchg.oy = math.floor((get_character_height() / 2) + 0.5)
    strchg.rot = strchg.rot + self.timer_animation * self.effect_speed.spin_speed
  end

  if self.effect_flags.raindrop then
    strchg.y = ty + math.tan((self.timer_animation) * self.effect_speed.raindrop_speed + i) +
                 get_character_height() / 2
  end

  if self.effect_flags.mirror then
    strchg.sx = strchg.sx * -1
    strchg.ox = get_character_width(self.table_string[i])
  end

  if self.effect_flags.bounce then
    strchg.y = math.floor((strchg.y + 2 * math.sin(self.timer_animation * self.effect_speed.bounce_speed + i)) + 0.5)
  end

  if self.effect_flags.blink then
    if math.floor(self.timer_animation * self.effect_speed.blink_speed) % 2 == 0 then strchg.sy = strchg.sy * 0 end
  end

  if self.effect_flags.scale and self.effect_flags.scale ~= 0 and type(self.effect_flags.scale) == "number" then
    strchg.sx = self.effect_flags.scale
    strchg.sy = self.effect_flags.scale
    strchg.padding = (get_character_width(self.table_string[i]) * self.effect_flags.scale) -
                       get_character_width(self.table_string[i])
  end

  if self.effect_flags.rotate and type(self.effect_flags.rotate) == "number" then
    strchg.x = math.floor((tx + get_character_width(self.table_string[i]) / 2) + 0.5)
    strchg.y = math.floor((ty + get_character_height() / 2) + 0.5)
    strchg.ox = math.floor((get_character_width(self.table_string[i]) / 2) + 0.5)
    strchg.oy = math.floor((get_character_height() / 2) + 0.5)
    strchg.rot = strchg.rot + math.rad(self.effect_flags.rotate)
    strchg.padding = 2
  end

  if self.effect_flags.fakebold then strchg.padding = 1 end

  return table_shallow_copy(strchg)
end

function M:addDraw(str, tx, ty, i)

  if self.effect_flags.shader then love.graphics.setShader(self.effect_flags.shader) end

  if self.effect_flags.dropshadow and self.effect_flags.dropshadow ~= 0 and self.effect_flags.dropshadow < 11 then
    love.graphics.setColor(self.current_shadow_color)
    local dropshadowtable = {
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y + 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 0, str.y + self.cursor.y + 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y + 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y + 0, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y + 0, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y + 0, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 0, str.y + self.cursor.y + 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 0, str.y + self.cursor.y - 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y + 0, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y - 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y + 0, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y - 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
      function()
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y + 0, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y + 0, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 0, str.y + self.cursor.y + 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 0, str.y + self.cursor.y - 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y + 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y - 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y + 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
        love.graphics.print(self.table_string[i], str.x + self.cursor.x - 1, str.y + self.cursor.y - 1, str.rot, str.sx,
          str.sy, str.ox, str.oy)
      end,
    }
    dropshadowtable[self.effect_flags.dropshadow]()
  end

  if self.effect_flags.rainbow then
    local phase = self.timer_animation * self.effect_speed.rainbow_speed
    local center = 128
    local width = 80 + self.effect_speed.rainbow_color_adj -- max 127
    local frequency = -math.pi * 80 / #self.table_string
    local red = math.sin(frequency * i + 2 + phase) * width + center;
    local green = math.sin(frequency * i + 0 + phase) * width + center;
    local blue = math.sin(frequency * i + 4 + phase) * width + center;
    self.current_color = {
      red / 255,
      green / 255,
      blue / 255,
      1,
    }
  end

  if self.effect_flags.fakebold then
    love.graphics.setColor(self.current_color)
    love.graphics.print(self.table_string[i], str.x + self.cursor.x + 1, str.y + self.cursor.y + 0, str.rot, str.sx,
      str.sy, str.ox, str.oy)
  end

  if self.effect_flags.underline then
    love.graphics.setColor(self.current_color)
    love.graphics.rectangle("fill", self.tx + self.cursor.x, self.ty + self.cursor.y +
      get_character_height() + self.current_underline_position,
      get_character_width(self.table_string[i]), 1)
  end

  if self.effect_flags.strikethrough then
    love.graphics.setColor(self.current_color)
    love.graphics.rectangle("fill", self.tx + self.cursor.x,
      self.ty + self.cursor.y + math.floor(get_character_height() / 2) +
        self.current_strikethrough_position, get_character_width(self.table_string[i]), 1)
  end

  love.graphics.setColor(1, 1, 1, 1)
end

---@alias text_rendering "left"|"center"|"right"|"full"

---@class (exact) text_settings
---@field autotags string? `"{tab}"` Added at the start of each text.
---@field font love.Font? `love.graphics.getFont()` Default font.
---@field color number[]? `{1, 1, 1, 1}` Default text color.
---@field shadow_color number[]? `{1, 1, 1, 1}` Default dropshadow color.
---@field print_speed number? `0.2` Delay between characters in seconds.
---@field adjust_line_height number? `0` Default line spacing in pixels.
---@field default_strikethrough_position number? `0` Position of the strikethrough.
---@field default_underline_position number? `0` Position of the underline.
---@field character_sound boolean? `false` Whether to use typing sounds.
---@field sound_number integer? `0` The sounds to use when typing.
---@field sound_every integer? `2` Characters to type before playing another sound.
---@field default_warble integer? `0` How much to adjust the typing sounds.


--[[ Generate Class ]] -----------------------------------------------------------
---@param rendering text_rendering
---@param table_settings text_settings
function m.new(rendering, table_settings) -- Todo, configuration at runtime. 
  -- Process default true settings


  rendering = rendering or "left" -- Left, Center, Right, Full

  if type(table_settings) ~= "table" then table_settings = {} end
  local autotags = table_settings.autotags
  if autotags ~= nil then autotags = tostring(autotags) end
  ---@class textbox
  local self = {}
  setmetatable(self, {
    __index = M,
  })
  -- Storage
  self.table_string = {}
  self.get = {
    width = 0,
    height = 0,
    lines = 0,
  }
  self.command_modifer = ""
  self.current_character = 0
  self.tx = 0
  self.ty = 0
  self.scroll = 0
  -- Timers/Counters
  self.timer_print = 1
  self.timer_animation = 0
  self.timer_pause = 0
  self.sound_every_counter = 1
  self.waitforinput = false
  -- Text
  self.prefix = autotags or ""

  self.keep_space_on_line_break = true
  self.modify_character_width_table = table_settings.modify_character_width_table or {}
  self.default_font = table_settings.font or love.graphics.getFont()
  self.default_color = table_settings.color or {
    0.05,
    0.05,
    0.05,
    1,
  }
  self.current_color = self.default_color
  self.default_shadow_color = table_settings.shadow_color or {
    0.5,
    0.5,
    0.5,
    1,
  }
  self.current_shadow_color = self.default_shadow_color
  self.default_print_speed = table_settings.print_speed or 0.05
  self.current_print_speed = self.default_print_speed
  self.rendering = rendering
  self.default_adjust_line_height = table_settings.adjust_line_height or 0
  self.adjust_line_height = self.default_adjust_line_height
  self.default_strikethrough_position = table_settings.default_strikethrough_position or 0
  self.current_strikethrough_position = self.default_strikethrough_position
  self.default_underline_position = table_settings.default_underline_position or 0
  self.current_underline_position = self.default_underline_position
  -- Text Sounds
  self.default_character_sound = table_settings.character_sound
  self.character_sound = self.default_character_sound
  self.default_sound_every = table_settings.sound_every or 2
  self.sound_every = self.default_sound_every
  self.default_sound_number = table_settings.sound_number or 1
  self.sound_number = self.default_sound_number
  self.default_warble = table_settings.warble or 0
  self.warble = self.default_warble
  -- Commands
  self.icon_width = 16
  self.effect_flags = {
    shake = false,
    spin = false,
    raindrop = false,
    dropshadow = false,
    mirror = false,
    bounce = false,
    blink = false,
    rainbow = false,
    scale = false,
    shader = false,
    rotate = false,
    swing = false,
    fakebold = false,
  }
  self.effect_speed = {
    swing_speed_default = 10,
    swing_speed = 10,
    shake_speed_default = 15,
    shake_speed = 15,
    spin_speed_default = 5,
    spin_speed = 5,
    raindrop_speed_default = 3,
    raindrop_speed = 3,
    bounce_speed_default = 10,
    bounce_speed = 10,
    blink_speed_default = 2,
    blink_speed = 2,
    rainbow_speed_default = 10,
    rainbow_speed = 10,
    rainbow_color_adj_default = 0,
    rainbow_color_adj = 0,
  }
  return self
end

--[[ Return The Class ]] ----------------------------------------------------------
return m
