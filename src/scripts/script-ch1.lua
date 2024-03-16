function ch1script()
    if ptr < 225 then changeState("game", 0)
    elseif ptr == 225 then
        music ''
        b "It's lunchtime the next day."
    elseif ptr == 226 then
        b "Honestly, I usually just play 2048 during lunch."
    elseif ptr == 227 then
        b "However, the district's recently started cracking down on students skipping lunch."
    elseif ptr == 228 then
        b "Even Aiden, who always brings lunch from home, has been having issues."
    elseif ptr == 229 then
        b "However, I just suck it up and grab a tray."
    elseif ptr == 230 then
        b "Fortunately, it's actually edible."
    elseif ptr == 231 then
        b "For school lunch standards..."
    elseif ptr == 232 then
        b "I find Liam and sit down next to him."
    elseif ptr == 233 then
        bg "school_int"
        music "iah"
        updL('a', 1)
        p "Hey, Liam! Guess what?"
    elseif ptr == 234 then
        updL('b', 1)
        l "What?"
    elseif ptr == 235 then
        p "I got a date!"
    elseif ptr == 236 then
        b 'I know it\'s not {b}really{/b} a date, but "date" sounds {b}way{/b} better than "unpaid counseling."'
    elseif ptr == 237 then
        updL('c', 2)
        l "Oh yeah? Cool."
    elseif ptr == 238 then
        p "Do you know Sarah?"
    elseif ptr == 239 then
        updL('a', 1)
        l "That blonde in your Advisory?"
    elseif ptr == 240 then
        p "Yeah, her."
    elseif ptr == 241 then
        updL('c', 12)
        l "Suprising. Where'd you go?"
    elseif ptr == 242 then
        p "*sigh*"
    elseif ptr == 243 then
        p "Her house."
    elseif ptr == 244 then
        p "She apparently trusts me enough to open up about her home life."
    elseif ptr == 245 then
        p "And {b}oh, my God{/b}, am I glad she did."
    elseif ptr == 246 then
        p "The stuff she goes through..."
    elseif ptr == 247 then
        p "She almost has it as bad as Aiden."
    elseif ptr == 248 then
        updL('d', 1)
        b "I recall last year, when Aiden told me about the things his dad does to him."
    elseif ptr == 249 then
        b "Just thinking about it sends chills down my spine..."
    elseif ptr == 250 then
        updL('e', 12)
        l "Oh, crap..."
    elseif ptr == 251 then
        wait(3)
    elseif ptr == 252 then
        updL('f', 2)
        l "Did she show you her ti--{nw}"
    elseif ptr == 253 then
        music ''
        updL('e', 1)
        p "{b}Nein!{/b}"
    elseif ptr == 254 then
        b "I stop Liam just as I see Sarah walking toward us."
    elseif ptr == 255 then
        b "That was {b}close{/b}..."
    elseif ptr == 256 then
        music "ss"
        updS('c', "1c", 2)
        updL('g', 21, 0)
        s "Hey!"
    elseif ptr == 257 then
        b "Sarah takes a seat in front of me."
    elseif ptr == 258 then
        p "Hey. This is Liam."
    elseif ptr == 259 then
        updL('e', 21)
        l "Hi..."
    elseif ptr == 260 then
        s "Spencie told me about you."
    elseif ptr == 261 then
        b 'Did she just call me "Spencie?"'
    elseif ptr == 262 then
        updS('a', "2c")
        s "Aren't you adorable, you chubby baby?"
    elseif ptr == 263 then
        updS('a', "13c")
        updL('b', 2)
        b "She pinches Liam's cheek."
    elseif ptr == 264 then
        music ''
        p "{b}Ayo?{/b}"
    elseif ptr == 265 then
        b "That's all I manage to say."
    elseif ptr == 266 then
        b "I'm just so taken aback by her doing that."
    elseif ptr == 267 then
        updL('h', 21)
        l "{b}What the fuck?{/b}"
    elseif ptr == 268 then
        updS('j', "1c")
        b "All of a sudden, almost everyone's eyes are on us."
    elseif ptr == 269 then
        b "I mean, that {b}was{/b} pretty fucked up..."
    elseif ptr == 270 then
        b "But Sarah was just joking around...{w=.5} Right?"
    elseif ptr == 271 then
        b "So I really don't want her to get in trouble."
    elseif ptr == 272 then
        p "Shh~!"
    elseif ptr == 273 then
        b "I don't think any staff saw anything..."
    elseif ptr == 274 then
        b "Everyone goes back to their own thing."
    elseif ptr == 275 then
        b "Phew..."
    elseif ptr == 276 then
        music "ss"
        updS('e', "2c")
        updL('i', 12)
        s "So, Liam,{w=.5} what do you like to do?"
    elseif ptr == 277 then
        l "That {b}wasn't{/b} funny."
    elseif ptr == 278 then
        updS('f', "2c")
        s "Sorry! Sorry!"
    elseif ptr == 279 then
        updL('a', 1)
        l "It's okay. Just {b}don't{/b} do that again."
    elseif ptr == 280 then
        updL('a', 21)
        l "And to answer your question, I like to play video games and draw."
    elseif ptr == 281 then
        updS('a', "1c")
        s "Oh, my gosh, same~!"
    elseif ptr == 282 then
        updL('f', 21)
        l "Really? What games?"
    elseif ptr == 283 then
        updS('c', "2c")
        s "Roblox. Pokémon."
    elseif ptr == 284 then
        updS('d', "2c")
        s "Honestly, not a whole lot."
    elseif ptr == 285 then
        updL('f', 12)
        l "Which Pokémon games?"
    elseif ptr == 286 then
        updS('c', "3c")
        s "Well, right now, I'm playing through Ultra Sun."
    elseif ptr == 287 then
        s "But I also want to play Black 2. I've heard it's the best gen."
    elseif ptr == 288 then
        updL('c', 12)
        l "Yeah, it totally is."
    elseif ptr == 289 then
        updL('b', 2)
        l "But that's all you've played?"
    elseif ptr == 290 then
        p "Yeah, she only has a DS."
    elseif ptr == 291 then
        updS('d', "2c")
        s "A {b}2{/b}DS, but, yeah."
    elseif ptr == 292 then
        updL('a', 1)
        p "I've always wanted one. Aiden's is {b}so{/b} cool!"
    elseif ptr == 293 then
        updS('a', "1c")
        s "He has a 3DS, too?{w=.25} Cool!"
    elseif ptr == 294 then
        s "Maybe I can actually make use of that Wi-Fi revival..."
    elseif ptr == 295 then
        s "{w=.5}There's {b}so~{/b} many things I love about 3DSes..."
    elseif ptr == 296 then
        l "Well, that ruins any chance of us trading..."
    elseif ptr == 297 then
        updL('a', 21)
        l "I {b}do{/b} play Roblox, though."
    elseif ptr == 298 then
        updL('a', 1)
        l "But not as much as I used to. They've {b}really{/b} fallen off lately."
    elseif ptr == 299 then
        updS('d', "3c")
        s "Well,{w=.25} that's {b}something{/b}..."
    elseif ptr == 300 then
        p "What about Minecraft? You'd probably like it."
    elseif ptr == 301 then
        updS('c', "23c")
        s "Yeah, I have it on my 2DS."
    elseif ptr == 302 then
        updS('d',"23c")
        s "But they stopped updating that version a while ago, so it isn't {b}really{/b} Minecraft."
    elseif ptr == 303 then
        updL('c', 21)
        l "What about Pocket Edition? It's still getting updates."
    elseif ptr == 304 then
        s "Yeah, I tried Pocket Edition a few years back."
    elseif ptr == 305 then
        s "But the controls were {b}way{/b} too janky."
    elseif ptr == 306 then
        l "Did you try using the joystick?"
    elseif ptr == 307 then
        updS('i', "1c")
        s "`Joystick?'"
    elseif ptr == 308 then
        l "Yeah. You should've gotten a pop-up with other controls."
    elseif ptr == 309 then
        updS('d', "2c")
        s "Nope."
    elseif ptr == 310 then
        updL('a', 1)
        l "Hm~."
    elseif ptr == 311 then
        l "You must've played just before they added them."
    elseif ptr == 312 then
        updS('i', "1c")
        s "Well... I hope I still own it on Google Play."
    elseif ptr == 313 then
        updS('d', "1c")
        s "I'm due for my axolotl fix!"
    elseif ptr == 314 then
        updS('b', "1c")
        s "Ahaha!"
    elseif ptr == 315 then
        music "bell"
        updS('f', "3c")
        updL('e', 1)
        wait(2)
    elseif ptr == 316 then
        updS('d', "3c")
        s "Fu~ck..."
    elseif ptr == 317 then
        b "I must've completely missed everyone putting their trays away."
    elseif ptr == 318 then
        b "Now we're all gonna be late to our classes!"
    elseif ptr == 319 then
        hideAll()
        b "We all hurry and finish eating our food, then put our trays away."
    elseif ptr == 320 then
        b "Thank God for that two-minute bell..."
    elseif ptr == 321 then
        bg ''
        b "We each go our separate ways."
    elseif ptr == 322 then
        b "To be honest, I'm glad I didn't spend lunch playing 2048."
    elseif ptr == 323 then
        b "This was actually the first lunch I've really enjoyed."
    elseif ptr == 324 then
        b "Then again, I haven't been here all that long yet."
    elseif ptr == 325 then
        b "But I can already say that it's been a {b}huge{/b} success so far."
    elseif ptr == 326 then
        b "And I can't wait to see what's to come!"
    elseif ptr == 327 then
        wait(2.5)
    elseif ptr == 328 then
        b "After I get home from school, I turn on my computer."
    elseif ptr == 329 then
        b "Normally, I'd call up the Fearsome Foursome, but my headset's broken again."
    elseif ptr == 330 then
        b "And I can't hear a thing on my phone or my tablet."
    elseif ptr == 331 then
        b "Anyway, remembering what I told Aiden yesterday, I launch Minecraft."
    elseif ptr == 332 then
        b "There's a player on the Fearsome Foursome's server."
    elseif ptr == 333 then
        b 'Hovering over the player count shows "imaiden_B."'
    elseif ptr == 334 then
        b "Rather than DMing him, I simply join the server."
    elseif ptr == 335 then
        wait(2.5)
    elseif ptr == 336 then
        music "sweden"
        bg "minecraft"
        -- mb(chat)
        mb "{col=#FFEC27}engineer723 joined the game{/col}"
    elseif ptr == 337 then
        -- ma(chat="<imaiden_B> "..chat)
        ma "o/"
    elseif ptr == 338 then
        -- mp(chat="<engineer723> "..chat)
        mp "\\o"
    elseif ptr == 339 then
        mp "woah"
    elseif ptr == 340 then
        mp "whats this new room"
    elseif ptr == 341 then
        ma "trading hall"
    elseif ptr == 342 then
        mp "oooh"
    elseif ptr == 343 then
        mb "A trading hall could be useful..."
    elseif ptr == 344 then
        mb "But where the hell is Aiden gonna get villagers?"
    elseif ptr == 345 then
        mp "where will you get villagers"
    elseif ptr == 346 then
        ma "zombie villagers"
    elseif ptr == 347 then
        ma "gapple and weakness potion revives them"
    elseif ptr == 348 then
        mp "ok"
    elseif ptr == 349 then
        wait(1, true)
    elseif ptr == 350 then
        mp "where are you"
    elseif ptr == 351 then
        ma "coming back from the mine"
    elseif ptr == 352 then
        mp "k"
    elseif ptr == 353 then
        bg("cg/a_cg1", 1)
        mb "Aiden walks up in a full suit of diamond armor."
    elseif ptr == 354 then
        mb "He's holding a diamond sword."
    elseif ptr == 355 then
        mb "How long did he spend down there?"
    elseif ptr == 356 then
        mp "woah"
    elseif ptr == 357 then
        mp "full diamond"
    elseif ptr == 358 then
        ma "yeah"
    elseif ptr == 359 then
        tag(2)
        mb "Aiden drops a diamond pickaxe to me. I pick it up."
    elseif ptr == 360 then
        tag(3)
        mp "thanks"
    elseif ptr == 361 then
        ma "ofc"
    elseif ptr == 362 then
        bg "minecraft"
        mb "I peer inside the newly-dug cave."
    elseif ptr == 363 then
        mb "Inside, there's a bit of redstone."
    elseif ptr == 364 then
        mb "I could never begin to understand any of it."
    elseif ptr == 365 then
        mp "whats this"
    elseif ptr == 366 then
        ma "grabs villagers from a breeder"
    elseif ptr == 367 then
        mb "Jeez. He's going all-in on this."
    elseif ptr == 368 then
        mb "What is he gonna build next, a storage system for every item?"
    elseif ptr == 369 then
        mp "wow"
    elseif ptr == 370 then
        mp "can i help"
    elseif ptr == 371 then
        ma "I guess..."
    elseif ptr == 372 then
        ma "Can you get five gold ingots?"
    elseif ptr == 373 then
        mb "If I went mining, I'd be down there for days."
    elseif ptr == 374 then
        mb "It's not like we live in a badlands."
    elseif ptr == 375 then
        mb "And the Nether is much too scary for me."
    elseif ptr == 376 then
        mp "can i do anything else"
    elseif ptr == 377 then
        ma "hmm"
    elseif ptr == 378 then
        ma "can you get some glass?"
    elseif ptr == 379 then
        ma "I only need three."
    elseif ptr == 380 then
        mb "That sounds much easier."
    elseif ptr == 381 then
        mp "sure"
    elseif ptr == 382 then
        hideA()
        mb "I go to the nearest beach..."
    elseif ptr == 383 then
        mb "...which isn't actually that nearby."
    elseif ptr == 384 then
        mb "But before I get there, I get a text."
    elseif ptr == 385 then
        mb "It's from an unknown number."
    elseif ptr == 386 then
        mp "i just got a random text"
    elseif ptr == 387 then
        mp "hows it going <3"
    elseif ptr == 388 then
        ma "Tell them they have the wrong number."
    elseif ptr == 389 then
        mb "I do, and they soon respond."
    elseif ptr == 390 then
        mp "no i dont"
    elseif ptr == 391 then
        mp "settings doesnt lie"
    elseif ptr == 392 then
        mb "I'm honestly kinda freaked out."
    elseif ptr == 393 then
        mb "Who is this, and how do they know me?"
    elseif ptr == 394 then
        mb "Their area code is from around here."
    elseif ptr == 395 then
        mb "But that means nothing."
    elseif ptr == 396 then
        mb 'I reply "Who the fuck are you?"'
    elseif ptr == 397 then
        mp "i asked who they are"
    elseif ptr == 398 then
        mb "Their response?"
    elseif ptr == 399 then
        mb '"I think you know, Spencie"'
    elseif ptr == 400 then
        mb 'Only two people have ever called me "Spencie."'
    elseif ptr == 401 then
        mb "And I don't think Aiden has a second number..."
    elseif ptr == 402 then
        mp "ITS SARAH"
    elseif ptr == 403 then
        ma "..."
    elseif ptr == 404 then
        ma "Yuri 2: Electric Boogaloo"
    elseif ptr == 405 then
        mp "lol"
    elseif ptr == 406 then
        mb "Yeah, she is acting kinda like how Yuri would..."
    elseif ptr == 407 then
        mb "Except... Sarah isn't a video game character."
    elseif ptr == 408 then
        mb "So that makes this a bit creepier."
    elseif ptr == 409 then
        mb "That must also be why Settings was open yesterday."
    elseif ptr == 410 then
        mb "I left her with my phone when I almost pissed myself."
    elseif ptr == 411 then
        mb "And she must've grabbed my number from it."
    elseif ptr == 412 then
        mb "I guess she forgot to switch back to Docs."
    elseif ptr == 413 then
        mp "im getting off now"
    elseif ptr == 414 then
        mp "i have to deal with this CRAZY girl"
    elseif ptr == 415 then
        ma "to what?"
    elseif ptr == 416 then
        mp "aiden i swear to god"
    elseif ptr == 417 then
        music "aad"
        bg ''
        b "I close Minecraft."
    elseif ptr == 418 then
        b "Then, I text Sarah."
    elseif ptr == 419 then
        b '"You dummkopf!"'
    elseif ptr == 420 then
        b '"I thought you were a stalker or something!"'
    elseif ptr == 421 then
        b 'She responds "Oops. Sorry."'
    elseif ptr == 422 then
        b "I can't believe it."
    elseif ptr == 423 then
        b "She is into me!"
    elseif ptr == 424 then
        b "I think..."
    elseif ptr == 425 then
        b "Taking my phone number from Settings..."
    elseif ptr == 426 then
        b "That is such a nerdy, yet obsessive thing to do..."
    elseif ptr == 427 then
        b 'As Aiden would say, "the Lion, the Witch, and the Audacity of This Bitch."'
    elseif ptr == 428 then
        b "I might be fine with a little bit of obsession..."
    elseif ptr == 429 then
        b "But I don't want her to {b}actually{/b} go Yuri."
    elseif ptr == 430 then
        b "That weekend still haunts me to this day."
    elseif ptr == 431 then
        b "I add her phone number as a contact."
    elseif ptr == 432 then
        b "If this is what she wants..."
    elseif ptr == 433 then
        b "Then I'll just have to accept it and go with the flow."
    elseif ptr == 434 then
        b "Besides..."
    elseif ptr == 435 then
        b "This is probably the best way to get a {b}real{/b} date."
    elseif ptr == 436 then
        b "I have no reason to refuse!"
    elseif ptr > 436 then cartSpin() end
end