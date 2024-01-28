Hey! Thanks for checking out my rinky-dink PICO-8 cartridge that is technically too big for PICO-8.

<details>
  <summary>See also: Sleep-Deprived Programmer Ramblings</summary>
  
  > TLDR: *In a Heartbeat* literally became too big for PICO-8, so I moved it into another game engine.

  *In a Heartbeat* actually runs in LÖVE, "an awesome 2D game framework for Lua."
  > Lua is the same programming language that PICO-8, and Roblox Studio use for code.
  It's also the programming language that I'm the most familiar with.
  
  This is due to the fact that PICO-8 cartridges, among other limitations, have a fixed character limit of 65,535.
  This also includes shared files that are copied into the cartridge on launch.
  
  In pre-LÖVE *In a Heartbeat*, one of these shared files was `images.lua`. It contained all of the game's backgrounds and portraits.
  The thing is, those images were all stored as giant strings of text averaging at 1,300 characters each.
  Having **34** of these "image strings" ended up using over *half* of the character limit.
  > If you want to see what this looked like, check out images.lua.
  <!-- [Bonus Content/Development/images.lua](images.lua).-->
  Be warned, though, that the names of the images are still present, so consider waiting until you finish the game to view it.
  
  
  So imagine my face when I booted the cartridge and PICO-8 told me that I couldn't `#INCLUDE` `renp8.lua` because I was over the character limit...
  
  Now, there exists a tool called [Shrinko8](https://github.com/thisismypassport/shrinko8/) that can take a PICO-8 cartridge and strip away as many unnecessary characters as possible.
  
  So I gave it *In a Heartbeat*.
  
  <!--![A screenshot of text in the Minecraft Five font reading "Error: cart takes too much compressed space!"](shrinko_error.png)-->
  
  Yeah...
  
  So I went looking for ways to get around the character limit.
  
  Enter PICOLÖVE, "an implementation of PICO-8's API in LÖVE."
  
  It... kinda worked.
  It's a bit janky, it's missing some crucial PICO-8 commands, and worst of all, it requires LÖVE **0.10.2**.
  
  So I scrapped it, and decided to "recreate" PICO-8 in LÖVE.
  
  > This will make a bit more sense after you beat the game.
  
  Canonically, *In a Heartbeat* runs in PICO-8. Again, the only reason it doesn't is because of the stupid character limit, and *In a Heartbeat* could *theoretically* run in PICO-8 just fine.
  I'm just too lazy to find out how to trim it down.
  
  Besides, doing it in LÖVE made programming, debugging, and editing 1,000,000x easier.
  
  ---
  As a side note, before I dropped PICOLÖVE, I was adding in the missing functions.
  While testing, I learned that LÖVE **really** hates any strings that contain "%" at all.
  
  And, image strings contain plenty of those.
  So, I also dropped image strings, in favor of `.png` files.
  
  This not only solved the random crashes, but also allowed me to use *Doki Doki Literature Club!*-style portraits.
  
  That is, *Doki Doki Literature Club!* stores portraits as a left half, a right half, and a head.
  
  <!--![A screenshot of a folder in File Explorer showing Sayori's portraits being stored in segments.](ddlc_portraits.png)-->
  
  And, to make my life **way** easier, [DDLC-LÖVE](https://github.com/LukeZGD/DDLC-LOVE/), a remake of *Doki Doki Literature Club!* in LÖVE, already did the drawing for me.
  In fact, it's basically a perfect visual novel engine, coded in a language that I'm **extremely** fluent in.
  
  So technically, *In a Heartbeat* is a *Doki Doki Literature Club!* mod. Only, it's coded in Lua instead of Ren'Py.
  
</details>

# Controls

The controls are fairly similar to the demo, with a few changes:
|Mouse|Keyboard|Controller|Action|
|-|-|-|-|
|Left Click|Space/Enter|A||Dismiss dialogue, select menu item|
|Right Click|H|B|Toggle UI visibility|
|Middle Click|Esc|Start|Toggle quick menu, close pause menu
|Scroll Wheel|Shift+Up/Down|B+D-Pad Up/Down|Scroll dialogue|
|-|Arrows|D-Pad|Menuing|

These buttons do nothing in any other context.

> [!IMPORTANT]
> Playing on Android requires connecting a controller via Bluetooth or USB.
> *In a Heartbeat* does not have touchscreen support.

> [!NOTE]
> For 3DS, the Bottom Screen **is** used for menuing.

# Info

Just like *Doki Doki Literature Club!*, *In a Heartbeat* isn't over until the credits are finished.

Once you finish *In a Heartbeat*, you should totally check out [Bonus Content] if you don't yet have your *In a Heartbeat* fix. 😉

---

Fun fact: In short, "doki-doki" is the sound of your heartbeat in Japanese. Yes, apparently thumping isn't international.
> That's what she said.

This is where both *Doki Doki Literature Club!* and *In a Heartbeat* get their names.
It is also why me and Dan Salvato much, much prefer saying "DDLC" instead of "Doki Doki."

# Installation
## Computers
Grab the latest release of *In a Heartbeat* for your operating system from the "Releases" tab.

Simply extract the `.zip` to a folder located somewhere accessible, like your Desktop.
  
Then, run the `iah` application.
## Android
Grab `iah.apk` from the "Releases" tab.

Run it to install the game as an app.

> [!IMPORTANT]
> As *In a Heartbeat* is not from Google Play, you may need to grant permission for the `.apk` to install.
## 3DS
> [!IMPORTANT]
> Installing *In a Heartbeat* on a 3DS requires Luma3DS. For more information, visit [3DS Hacks Guide](https://3ds.hacks.guide).

Scan this QR code using FBI's "Remote Install":

Alternatively, you can grab `iah.cia` from the "Releases" tab and transfer it to your SD card.
