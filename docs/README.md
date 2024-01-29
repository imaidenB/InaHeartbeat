# *In a Heartbeat* Mod Guide
This acts as a guide on creating visual novels using Ren'P8-LOVE, a modified version of DDLC-LOVE's engine.

Click the "Menu" button in the top-left to jump to sections.

# Getting started
Before you begin, you will need the following:
- [LÖVE](https://love2d.org/)
- *IaH* Mod Template
- VSCodium \(for writing and coding\)

These are optional, but can help a lot:
- LibreSprite \(for art\)
- Audacity \(for sound editing\)
- *IaH* source code \(for reference\)
> [!IMPORTANT]
Inside the mod template, open `conf.lua` and change `t.identity` to the name of your mod.
This prevents your mod's save data from conflicting with other mods or the base game.

To test your mod, you can:
- compress the folder to a `.zip` file, rename it to a `.love` file, and launch it
- drag-and-drop the folder on top of `love.exe` \(Windows\) or `love.app` \(OS X\)
> [!TIP]
> If you're using Windows, you can also create a shortcut to `love.exe` and place it somewhere easily accessible
> \(i.e. the same location as your mod folder\), and drag-and-drop the folder onto it instead of `love.exe`.

# Chapters
Ren'P8-LOVE games revolve around chapters. A chapter is a `.lua` file containing a giant `elseif` tree with instructions.

Here is an example of a short Ren'P8-LOVE chapter:
<details>
  <summary>Click to reveal</summary>

```lua
function ch0script()
  if ptr==0 then
    music"bell"
    pause(5)
  elseif ptr==1 then
    b"The bell at Skyline High School has just rung, and I am taking my time with leaving."
  elseif ptr==2 then
    b"Unlike literally everyone else..."
  elseif ptr==3 then
    b"Sometimes I wonder if I'm the only one with any patience..."
  elseif ptr==4 then
    bg"skyline_ext"
    updA('a','1','2')
    a"Hey!"
  elseif ptr==5 then
    updA('b','2','2')
    b"I see a guy older than me running up to me."
  elseif ptr==6 then
    b"He is Aiden, a 16-year-old senior who I've known for just over two years."
  elseif ptr==7 then
    b"We're not as much of friends as we were, say, a year ago, but we still regularly chat through Discord."
  elseif ptr==8 then
    p"What's up?"
  elseif ptr==9 then
    a"Are you gonna be online?"
  elseif ptr==10 then
    a"I really want to play on the server with you and Liam."
  elseif ptr==11 then
    a"There's something I want to build, and I'm gonna need help."
  elseif ptr==12 then
    b"Liam... Another freshman who I've known for longer than I can remember."
  elseif ptr==13 then
    b"I can't believe we're still friends to this day."
  elseif ptr==14 then
    p"I should be. I'll DM you when I'm free."
  elseif ptr==15 then
    updA('c','2','2')
    a"Sweet! See you later, then."
  elseif ptr==16 then
    hideA()
    p"Yeah..."
  elseif ptr==17 then
    b"What kind of monstrosity does he have planned this time?"
  end
end
```
</details>

# Finalizing your mod
> [!IMPORTANT]
> Before you export your mod, open `main.lua` and, near the top, change `test` to `false`.
> This prevents users from using developer tools.

Once you're finished making your mod, you have a couple of ways to export it.

## Export as .love
Compress your mod folder to a `.zip` file, and rename it to a `.love` file.
Anyone who has LÖVE installed can run this file on Windows, OS X, Linux, and Android.
> [!NOTE]
> Just like vanilla *IaH*, the mod will only work on Android if the user has a controller connected.

## Export as standalone app
Follow the instructions at [the Game Distribution wiki article](https://love2d.org/wiki/Game_Distribution) for your operating system.
