function ch0script()
    if ptr == 0 then
        music "bell"
        wait(5)
    elseif ptr == 1 then
        b "The dismissal bell has just rung, and I am taking my time leaving."
    elseif ptr == 2 then
        b "Unlike literally everyone else..."
    elseif ptr == 3 then
        b "Sometimes I wonder if I'm the only one with any patience..."
    elseif ptr == 4 then
        music "iah"
        bg "school_ext"
        updA('a', 1)
        dlg("???", "Hey! Spencer!")
    elseif ptr == 5 then
        updA('a', 3)
        b "A student shouts out to me."
    elseif ptr == 6 then
        b "He is Aiden, a 16-year-old senior who I've known for almost two years."
    elseif ptr == 7 then
        b "We aren't as much of friends as we were then, but we still regularly chat over Discord."
    elseif ptr == 8 then
        p "What's up?"
    elseif ptr == 9 then
        updA('c', 31)
        a "Will you be online today?"
    elseif ptr == 10 then
        a "I really want to play on the server with you and Liam."
    elseif ptr == 11 then
        updA('c', 23)
        a "There's something I want to build, and I'm gonna need help."
    elseif ptr == 12 then
        updA('a', 3)
        b "Liam... Another freshman whom I've known for longer than I can remember."
    elseif ptr == 13 then
        b "I can't believe we're still friends after all of this time..."
    elseif ptr == 14 then
        p "I should be."
    elseif ptr == 15 then
        p "I'll DM you when I'm free."
    elseif ptr == 16 then
        updA('c', 2)
        a "Sweet!"
    elseif ptr == 17 then
        updA('c', 12)
        a "See you later!"
    elseif ptr == 18 then
        hideA()
        p "Yeah."
    elseif ptr == 19 then
        b "What kind of monstrosity is Aiden planning now?"
    elseif ptr == 20 then
        dlg("???", "Spencer~!")
    elseif ptr == 21 then
        p "Huh?"
    elseif ptr == 22 then
        music "ss"
        updS('e', 31)
        b "The door opens, and a tired-looking girl about my age runs out, carrying a few papers in her hand."
    elseif ptr == 23 then
        b "That girl is Sarah, one of the students I share Advisory with."
    elseif ptr == 24 then
        b "I'm kind of into her, but I've honestly never been able to work up the courage to talk to her."
    elseif ptr == 25 then
        b "From what I've heard though, she's pretty good with tech, she has issues with her mom, and she's an okay drawer."
    elseif ptr == 26 then
        b "In fact, some jerk was making fun of her for said issues in the hall earlier today, but I got them to fuck off."
    elseif ptr == 27 then
        b "What dummkopf would even do that kind of thing in {b}high school{/b}, anyway?"
    elseif ptr == 26 then
        b "And her issues aren't even that small."
    elseif ptr == 27 then
        b 'Her mom is one of those "I\'m your parent, not your friend" psychos, and probably should get checked out...'
    elseif ptr == 28 then
        p "Oh... What's up? I kinda have to hurry."
    elseif ptr == 29 then
        updS('g', 31)
        s "Um... Thank you{w=.25} again{w=.25} for what you did earlier."
    elseif ptr == 30 then
        p "Yeah. You're welcome."
    elseif ptr == 31 then
        updS('g', 21)
        s "I{w=.25} know this may be a big ask, but{w=.25} would you be willing to walk home with me and let me just{w=.25} talk?"
    elseif ptr == 32 then
        s "After that, I{w=.25} feel like I can trust that you'd {b}actually{/b} listen."
    elseif ptr == 33 then
        b "Oh, boy. Could her mom really be {b}that{/b} bad?"
    elseif ptr == 34 then
        b "Jeez..."
    elseif ptr == 35 then
        p "Maybe... Where do you live?"
    elseif ptr == 36 then
        updS('d', 31)
        s "Down 9✽ Avenue, just west of the train tracks. Is that too far?"
    elseif ptr == 37 then
        b "Wait...{w=.5} She lives {b}that{/b} close to me?"
    elseif ptr == 38 then
        b "In that case..."
    elseif ptr == 39 then
        p "Not at all. In fact, I live, like, three blocks from there."
    elseif ptr == 40 then
        p "I might as well just take the bus home and meet you at your place."
    elseif ptr == 41 then
        p "But you really walk {b}½ an hour{/b} home?"
    elseif ptr == 42 then
        updS('a', 1)
        s "Yeah. It's actually very relaxing and pretty."
    elseif ptr == 43 then
        b "How could this city be pretty?"
    elseif ptr == 44 then
        updS('c', 31)
        s "But yeah, I guess that could work."
    elseif ptr == 45 then
        b "My bus's horn beeps."
    elseif ptr == 46 then
        p "Fuck, I gotta go.{w=.25} Bye~!"
    elseif ptr == 47 then
        hideS()
        b "I wave to Sarah and run to my bus."
    elseif ptr == 48 then
        b "She waves back, and I watch her put her papers in her bag and walk away."
    elseif ptr == 49 then
        b "Soon after, the bus's ignition starts, and we drive off."
    elseif ptr == 50 then
        bg ''
        music "tooit"
        b "Along the way, I struggle to contain my excitement."
    elseif ptr == 51 then
        b "This is my chance to finally talk to her."
    elseif ptr == 52 then
        b "Who knows? She might like me, too."
    elseif ptr == 53 then
        b "And it doesn't have to stop {b}there{/b}, either..."
    elseif ptr == 54 then
        wait(1.5, true)
    elseif ptr == 55 then
        b "After I get home, I grab a snack before telling my mom what I signed up for."
    elseif ptr == 56 then
        b "She says that it's fine, as long as I'm back by 8:00."
    elseif ptr == 57 then
        b "I agree, and make my way down ***REMOVED***."
    elseif ptr == 58 then
        wait(.75)
        dlg_enabled = false
    elseif ptr == 59 then
        bg "sarah_ext"
        wait(.75, true)
    elseif ptr == 60 then
        b "Fuck, what was I thinking?"
    elseif ptr == 61 then
        b "I didn't get her actual address!"
    elseif ptr == 62 then
        b "How am I going to find her now?"
    elseif ptr == 63 then
        updS('a', 2)
        music "ss"
        s "Spencer~!"
    elseif ptr == 64 then
        p "Ah!{w=1} {b}Sarah!{/b}"
    elseif ptr == 65 then
        p "You never gave me your actual address,{w=.25} {b}schweinehund{/b}!"
    elseif ptr == 66 then
        updS('e', 1)
        s "Oops...{w=.5} Sorry~!"
    elseif ptr == 67 then
        p "Oh, you're fine."
    elseif ptr == 68 then
        b "Uu... Don't take that the wrong way..."
    elseif ptr == 69 then
        updS('a', 1)
        s "Anyway, come on in!"
    elseif ptr == 70 then
        bg "sarah_int"
        updS('c', "13b")
        s "Spencer's here!"
    elseif ptr == 71 then
        dlg("mother", "Hello! Sarah's been{w=.25} so excited for you to come over!")
    elseif ptr == 72 then
        updS('e', "3b")
        dlg("mother", "It's nice to finally meet you!")
    elseif ptr == 73 then
        p "Ehehe... Hey!"
    elseif ptr == 74 then
        b "Why is she being so nice?"
    elseif ptr == 75 then
        b "I thought she was, like... a manipulative monster or something..."
    elseif ptr == 76 then
        b "But she actually seems really nice."
    elseif ptr == 77 then
        b "I don't think Sarah would lie..."
    elseif ptr == 78 then
        b "So she's probably putting on a facade for me..."
    elseif ptr == 79 then
        b "I gently sigh."
    elseif ptr == 80 then
        dlg("mother", "Well, I guess I'll leave you two alone.{w=.5} I trust that you won't{function=music ''} rape her or anything.")
    elseif ptr == 81 then
        updS('j', "3b")
        b "What the fuck?{w=.25} {b}Raping{/b} her?"
    elseif ptr == 82 then
        b "Is that something that's...{w=.5} God..."
    elseif ptr == 83 then
        dlg("mother", "She barely ever gets any free time nowadays...")
    elseif ptr == 84 then
        updS('h', "1b")
        s "O~{w=.1}kay! Let's go!"
    elseif ptr == 85 then
        hideS()
        dlg("mother", "Oh, and let me know if you get hungry.")
    elseif ptr == 86 then
        dlg("mother", "I have plenty of snacks.")
    elseif ptr == 87 then
        p "Okay. Thanks!"
    elseif ptr == 88 then
        b "Huh. Almost as generous as Aiden's mom.{w=.25} Cool!"
    elseif ptr == 89 then
        bg "sarah_room"
        music "ss"
        s "So~, this is my room."
    elseif ptr == 90 then
        updS('d', "21b")
        b "Full of energy, Sarah opens her bedroom door."
    elseif ptr == 91 then
        p "Ah, cool."
    elseif ptr == 92 then
        p "It looks very...{w=.5} artsy."
    elseif ptr == 93 then
        updS('e', "2b")
        s "Oh, it's not much."
    elseif ptr == 94 then
        s "Ehehe..."
    elseif ptr == 95 then
        updS('c', "1b")
        b "I glance around her room."
    elseif ptr == 96 then
        p "Is that... No~!"
    elseif ptr == 97 then
        b "I notice one of her drawings."
    elseif ptr == 98 then
        b "It looks like...{w=.75} Sayori's suicide?"
    elseif ptr == 99 then
        updS('k', "1b")
        s "Hold on, you {b}actually{/b} know what that is?"
    elseif ptr == 100 then
        p "I had nightmares for {b}months{/b} after that!"
    elseif ptr == 101 then
        updS('j', "1b")
        s "Jeez..."
    elseif ptr == 102 then
        updS('c', "2b")
        s "Well, in that case then, who's your favorite Doki?"
    elseif ptr == 103 then
        p "Yuri."
    elseif ptr == 104 then
        updS('a', "1b")
        s "Mine's Sayori!{w=.25} She's such a cute and happy ball of sunshine!"
    elseif ptr == 105 then
        p "That...{w=.25} checks out."
    elseif ptr == 106 then
        updS('b', "3b")
        p "So{w=.25}, you were{w=.25} gonna talk to me about something?"
    elseif ptr == 107 then
        updS('g', "2b")
        s "Oh~,{w=.5} yeah."
    elseif ptr == 108 then
        bg ''
        hideS()
        music "tooit"
        wait(2, true)
    elseif ptr == 109 then
        b "We've been talking for {b}hours{/b}."
    elseif ptr == 110 then
        b "At some point, the conversation drifted off from Sarah's mom."
    elseif ptr == 111 then
        b "But as a result, I learned a {b}lot{/b} more about her."
    elseif ptr == 112 then
        b "...And I think I like her a bit more."
    elseif ptr == 113 then
        b "For example, she's a fairly avid gamer, despite not having a computer."
    elseif ptr == 114 then
        b "She really only plays Roblox on her phone and Pokémon on her 2DS, though."
    elseif ptr == 115 then
        b "She's also a big nerd, kinda like Aiden."
    elseif ptr == 116 then
        b "Honestly, they'd probably be very good friends."
    elseif ptr == 117 then
        b "But that'd run the risk of him stealing her from me!"
    elseif ptr == 118 then
        bg "sarah_room_night"
        music "ss"
        updS('c', "2b")
        s "`Aiden', huh?"
    elseif ptr == 119 then
        s "Tell me more about this `Aiden' you speak of."
    elseif ptr == 120 then
        p "You've never run into him?"
    elseif ptr == 121 then
        p "About my height, ginger braids, black backpack with his name on it?"
    elseif ptr == 122 then
        updS('k', "23b")
        s "I might've seen him once or twice in the halls."
    elseif ptr == 123 then
        s "But his appearance and name are all I really know about him."
    elseif ptr == 124 then
        updS('l', "1b")
        b "Sarah looks like she just realized something, but she keeps her mouth shut."
    elseif ptr == 125 then
        updS('c', "2b")
        p "Hmm... Let's see..."
    elseif ptr == 126 then
        wait(3)
    elseif ptr == 127 then
        p "He's 16... He's the oldest of five boys."
    elseif ptr == 128 then
        updS('i', "2b")
        s "{b}Five?{/b}"
    elseif ptr == 129 then
        p "Yea~h."
    elseif ptr == 130 then
        updS('k', "2b")
        s "Wow..."
    elseif ptr == 131 then
        updS('c', "2b")
        p "Wha~t else...?"
    elseif ptr == 132 then
        p "He's a great coder."
    elseif ptr == 133 then
        p "In fact, he actually made an {b}entire{/b} video game for my 13✽ birthday."
    elseif ptr == 134 then
        updS('l', "1b")
        s "Wait, {b}really{/b}?"
    elseif ptr == 135 then
        updS('d', "1b")
        s "Can I play it?"
    elseif ptr == 136 then
        p "I'm pretty sure he'd be willing to send you a copy."
    elseif ptr == 137 then
        updS('a', "1b")
        s "Yay~!"
    elseif ptr == 138 then
        updS('c', "3b")
        p "Hm..."
    elseif ptr == 139 then
        p "Oh, yeah. He's also {b}very{/b} immature."
    elseif ptr == 140 then
        p "Like, whenever he's around me, he'll make a `that's what she said' joke whenever he can."
    elseif ptr == 141 then
        p "And it doesn't even need to make sense! He'll still say it!"
    elseif ptr == 142 then
        updS('b', "1b")
        s "Ahaha!"
    elseif ptr == 143 then
        s "That sounds {b}just{/b} like me when I was 12!"
    elseif ptr == 144 then
        b "Same, I guess..."
    elseif ptr == 145 then
        updS('d', "3b")
        wait(1)
    elseif ptr == 146 then
        p "By any chance, are you still kinda like that?"
    elseif ptr == 147 then
        updS('k', "3b")
        s "A little bit, I guess."
    elseif ptr == 148 then
        s "Why?"
    elseif ptr == 149 then
        p "Well, call me Google, `cause I'm obsessed with your every action."
    elseif ptr == 150 then
        s "..."
    elseif ptr == 151 then
        updS('b', "1b")
        s "Ahaha~!"
    elseif ptr == 152 then
        s "That was {b}terrible{/b},{w=.5} but {b}so{/b} good!"
    elseif ptr == 153 then
        p "Well, if you liked that one, Aiden made an entire Google Doc of `em."
    elseif ptr == 154 then
        updS('l', "3b")
        s "Oh,{w=.1} my gosh. An {b}entire{/b} Google Doc?"
    elseif ptr == 155 then
        updS('a', "1b")
        s "Show me! Show me!"
    elseif ptr == 156 then
        updS('f', "1b")
        b 'I take my phone out of my pocket and open the Google Doc titled "Terrible pickup lines."'
    elseif ptr == 157 then
        b "Then, I give it to Sarah."
    elseif ptr == 158 then
        s "`Are you zeroes and ones?{w=1} `Cause{w=.25} I want you to--{nw}"
    elseif ptr == 159 then
        updS('b', "13b")
        s "{b}Gah~!{/b}"
    elseif ptr == 160 then
        wait(2)
    elseif ptr == 161 then
        s "{b}`Minary~!'{/b}"
    elseif ptr == 162 then
        updS('a', "13b")
        p "You think they're good?"
    elseif ptr == 163 then
        updS('d', "13b")
        s "{b}Hell no!{/b} These are the {b}worst{/b} pickup lines I've ever heard!"
    elseif ptr == 164 then
        updS('a', "1b")
        s "But that's what makes them so good!"
    elseif ptr == 165 then
        p "Yeah!"
    elseif ptr == 166 then
        updS('c', "13b")
        s "`Call me Team Rocket,{w=.5} `cause I'm taking a Pikach--{nw}"
    elseif ptr == 167 then
        updS('d', "13b")
        s "{w=.5}How many of these are there?"
    elseif ptr == 168 then
        updS('c', "13b")
        s "124 lines{w=.5} divided by three..."
    elseif ptr == 169 then
        updS('k', "13b")
        s "That's, like, {b}60{/b} pickup lines..."
    elseif ptr == 170 then
        updS('l', "13b")
        s "Oh, my fucking..."
    elseif ptr == 171 then
        p "Yeah..."
    elseif ptr == 172 then
        updS('i', "13b")
        music ''
        p "Gah!"
    elseif ptr == 173 then
        updS('i', "23b")
        s "What's wrong?"
    elseif ptr == 174 then
        b "You know that feeling where you're just doing fine..."
    elseif ptr == 175 then
        b "...and then all of a sudden, your bladder almost expodes?"
    elseif ptr == 176 then
        b "Yeah..."
    elseif ptr == 177 then
        p "Where's your bathroom?"
    elseif ptr == 178 then
        updS('c', "32b")
        s "{w=.25}First door on the right."
    elseif ptr == 179 then
        hideS()
        p "Thanks!"
    elseif ptr == 180 then
        bg ''
        b "I rush out of Sarah's room and head to her bathroom."
    elseif ptr == 181 then
        b "I'm in there for {b}way{/b} longer than I probably should be..."
    elseif ptr == 182 then
        bg "sarah_room_night"
        updS('c', "13b")
        b "And, when I'm done, Sarah's on her phone, scrolling TikTok."
    elseif ptr == 183 then
        b "I swear, the government doesn't hate that app {b}nearly{/b} as much as they claim to..."
    elseif ptr == 184 then
        music "ss"
        updS('d', "13b")
        s "There you are!{w=.25} Finally..."
    elseif ptr == 185 then
        p "Yeah... Sorry!"
    elseif ptr == 186 then
        p "Gah!"
    elseif ptr == 187 then
        updS('k', "32b")
        s "Hm? What now?"
    elseif ptr == 188 then
        b "I glance out the window."
    elseif ptr == 189 then
        b "It's {b}pitch black{/b} outside."
    elseif ptr == 190 then
        b "When did that happen?"
    elseif ptr == 191 then
        p "What time is it?"
    elseif ptr == 192 then
        s "8:32."
    elseif ptr == 193 then
        p "I had to be back ½ an hour ago!"
    elseif ptr == 194 then
        updS('j', "32b")
        p "Mom's gonna be pissed..."
    elseif ptr == 195 then
        updS('e', "32b")
        s "Great..."
    elseif ptr == 196 then
        p "I gotta go!{w=.25} Bye!"
    elseif ptr == 197 then
        bg "sarah_int"
        hideS()
        s "{b}Wait!{/b}"
    elseif ptr == 198 then
        updS('f', "1b")
        p "Hm?"
    elseif ptr == 199 then
        updS('c', "1b")
        s "Don't forget your phone!"
    elseif ptr == 200 then
        b "Sarah hands me my phone."
    elseif ptr == 201 then
        b "I put it back in my pocket."
    elseif ptr == 202 then
        updS('c', "2b")
        dlg("mother", "Aw~, are you leaving already?")
    elseif ptr == 203 then
        dlg("mother", "I can make some extra dinner if you'd like.")
    elseif ptr == 204 then
        p "I had to be back ½ an hour ago."
    elseif ptr == 205 then
        p "Believe me, I'd stay if I could."
    elseif ptr == 206 then
        updS('d', "2b")
        dlg("mother", "Well, just remember that you're allowed back anytime, as long as Sarah says so.")
    elseif ptr == 207 then
        dlg("mother", "It's a miracle she has {b}any{/b} friends in the first place.")
    elseif ptr == 208 then
        updS('h', "2b")
        p "Thanks! I'm glad I could come over."
    elseif ptr == 209 then
        b "For more reasons than one."
    elseif ptr == 210 then
        b "Honestly..."
    elseif ptr == 211 then
        b "I might have found a new crush."
    elseif ptr == 212 then
        b "But, it's too early to say for sure."
    elseif ptr == 213 then
        b "I'll just have to see what the future holds."
    elseif ptr == 214 then
        updS('a', "1b")
        s "Come back soon, okay?"
    elseif ptr == 215 then
        s "I had a {b}lot{/b} of fun today!"
    elseif ptr == 216 then
        p "For sure! I did, too."
    elseif ptr == 217 then
        updS('f', "23b")
        p "Well, I gotta go. {cps=.1}Bye~!"
    elseif ptr == 218 then
        bg ''
        hideS()
        music "aad"
        dlg("Sarah & mom", "Bye~!")
    elseif ptr == 219 then
        b "I hurry down ***REMOVED***."
    elseif ptr == 220 then
        b "As I do, I pull my phone out of my pocket to call Mom."
    elseif ptr == 221 then
        b "But for some reason, Settings is active instead of Google Docs..."
    elseif ptr == 222 then
        b "I don't think much of it, and I simply open the Phone app."
    elseif ptr == 223 then
        b "Surprisingly, Mom is {b}very{/b} understanding of my tardiness."
    elseif ptr == 224 then
        b "Almost {b}too{/b} understanding..."
    elseif ptr > 224 then cartSpin()
    end

    -- Disclaimer
    if ptr == -11 then
        bg("cg/splash", 2)
        b "This game is not recommended for children or sensitive individuals."
    elseif ptr == -10 then
        b "Those who are {b}at all{/b} sensitive to the following should take caution playing:"
    elseif ptr == -9 then
        b "Abuse"
    elseif ptr == -8 then
        b "Rape"
    elseif ptr == -7 then
        b "Suicide"
    elseif ptr == -6 then
        b "Alcohol"
    elseif ptr == -5 then
        b "In addition, {b}major{/b} spoilers for Doki Doki Literature Club! are present throughout."
    elseif ptr == -4 then
        b "If you have not beaten it before, {b}please{/b} do so before playing In a Heartbeat."
    elseif ptr == -3 then
        choose '' -- ('') is a special parameter that displays "I agree." with a button indicator.
        b "By playing In a Heartbeat, you agree that you are over 12 y/o, and that you consent to exposure to the above content."
    elseif ptr == -2 then
        tag(1)
        wait(1.5)
    elseif ptr == -1 then
        ptr = 0
        savegame()
        changeState "splash"
    end
end