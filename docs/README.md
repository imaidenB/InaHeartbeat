# Modding Documentation
## Definitions
Here are some terms that appear in this guide that you might not know. These might not apply in a non-Lua or non-LÖVE context.
### General
Term          |Meaning
----          |-----------------------------------------------------------------------------------------------------------------------------------
FOSS          |**F**ree and **o**pen-**s**ource **s**oftware.
File Directory|The proper term for a folder.
Root Directory|The "top" directory which contains all other directories.
File Path     |The directory "tree" that holds a file. `/a/b/c.txt` would refer to the file `c.txt` inside of folder `/b/` inside of folder `/a/`.
Function      |A chunk of code that can be run at any point. They usually also take arguments.
Argument      |Pieces of data that can change what a function does or how it does it.
Variable      |A stored piece of data that can be changed or accessed or changed at any time.
### *In a Heartbeat*-specific
Term      |Meaning
----------|-----------------------------------------------------------------------------------------------
Chapter   |A `.lua` file containing a tree of `elseif` statements and instructions
Pointer   |The player's progress in the story, stored in the variable `ptr`.
Background|An image representing a scene's location.
Portrait  |An image of a character, composed of a head, a left half, and a right half.
CG        |**C**haracter **g**raphic. A scene that doesn't follow the usual portrait-on-background format.
State     |The behavior to follow depending on what is currently happening in-game. 


## Getting Started
To get started with modding *In a Heartbeat*, you will need the following:
Item        |Purpose
------------|------------------------
Mod Template|Template
LÖVE        |Running your mod
VSCodium    |Editing `.lua` files
<details><summary>More info on LÖVE</summary>
LÖVE is a 2D game engine that uses Lua. It is FOSS, and can run on many different platforms.
</details>
<details><summary>More info on VSCodium</summary>
VSCodium is a FOSS fork of Visual Studio Code, a programming-focused text editor with support for almost every text-based programming language.
The original is from Microsoft and contains required telemetry.
</details>

---
The following are not *strictly* necessary, but might help a lot:

Item       |Purpose
-------------|-----------------------------------------
Audacity     |Trimming audio for looping
LibreSprite  |Viewing and editing `.ase` images/animations
love-launcher|Easily launching LÖVE
<details><summary>More info on Audacity</summary>
Audacity is a FOSS audio editor. It supports dozens of file formats, and makes converting between them easy. 
</details>
<details><summary>More info on LibreSprite</summary>
LibreSprite is a FOSS fork of Aseprite, a pixel art-focused image editor. The original is far more feature-packed, and I highly encourage you to purchase it if you like LibreSprite and US$15 to spend.
</details>
<details><summary>More info on love-launcher</summary>
love-launcher is a Visual Studio Code extension that lets you launch an opened folder in LÖVE instead of having to compress it to a .love file or messing with command line parameters.
</details>

---
