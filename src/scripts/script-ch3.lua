function ch3script()
    if ptr < 681 then changeState("game", 2)
    elseif ptr == 681 then
        if xaload == 0 then savegame() end
        dlg_enabled = false
        bg "bsod"
    elseif ptr == 682 or ptr == 684 then cartSpin()
    elseif ptr == 683 then
        bg "time_card"
        if xaload == 0 then savegame() end
        wait(5)
    elseif ptr == 685 then
        music "bell"
        bg ''
        bgm:setLooping(true)
        b "I wake up to the sound of my alarm."
    elseif ptr == 686 then
        p "Stop."
    elseif ptr == 687 then
        music ''
        wait(2.5)
    elseif ptr == 688 then
        dlg("Assistant", "Hello.")
    elseif ptr == 689 then
        dlg("Assistant", "It's 9:24 AM.")
    elseif ptr == 690 then
        b "9:00 already? Crap."
    elseif ptr == 691 then
        dlg("Assistant", "It's Monday,{w=.25} January 21☉,{w=.2} 2030.")
    elseif ptr == 692 then
        dlg("Assistant", "You have one new message.")
    elseif ptr == 693 then
        dlg("Assistant", "From Sarah:")
    elseif ptr == 694 then
        dlg("Assistant", "`Soooo I overslept this morning and almost missed the bus.")
    elseif ptr == 695 then
        dlg("Assistant", '`I guess my birthday really "DID"{w=.2} a number on us,{w=.2} huh?{w=.25} LOL')
    elseif ptr == 696 then
        b "Just as humorous as ever..."
    elseif ptr == 697 then
        b "Making jokes about anything and everything, no matter the touchiness..."
    elseif ptr == 698 then
        dlg("Assistant", "`Anyway,{w=.25} good luck today,{w=.2} Spencie{w=.25} ♥'")
    elseif ptr == 699 then
        b "I finally get out of bed."
    elseif ptr == 700 then
        b "If I don't get ready soon, I actually {b}will{/b} be late, unlike Sarah."
    elseif ptr == 701 then
        b "I quickly change, grab a bite, and make my way out the door."
    elseif ptr == 702 then
        b "I probably could've and should've called out sick, but whatever."
    elseif ptr == 703 then
        b "Thankfully, when I get there, I'm not fired."
    elseif ptr == 704 then
        b "But I did get yelled at. Yay."
    elseif ptr == 705 then
        b "When I get home, I plug in my phone and walk into our office."
    elseif ptr == 706 then
        b "And I notice that one of Sarah's monitors is on."
    elseif ptr == 707 then
        b "Looking at her taskbar, I see some apps open that I don't recognize."
    elseif ptr == 708 then
        b "But I do recognize one of them."
    elseif ptr == 709 then
        b "PICO-8, the game engine that Aiden's been obsessed with since I met him."
    elseif ptr == 710 then
        b "I didn't know she was into game dev..."
    elseif ptr == 711 then
        b "Looking up, I see what appears to be Lua code."
    elseif ptr == 712 then
        b "Which is strange, because as far as I know, she hasn't used Lua in {b}years{/b}."
    elseif ptr == 713 then
        b "She ditched it after, like, a month in favor of Python."
    elseif ptr == 714 then
        b "There's also some text written in Notepad."
    elseif ptr == 715 then
        b "Curious, I read it."
    elseif ptr == 716 then
        bg "notepad"
        dlg_enabled = false
    elseif ptr == 717 then
        dlg_enabled = true
        p "Ah--"
    elseif ptr == 718 then
        b "What is this?"
    elseif ptr == 719 then
        b "Reading the text file, I get a pit in my stomach."
    elseif ptr == 720 then
        b "This feels {b}nothing{/b} like anything she's written."
    elseif ptr == 721 then
        b "Feeling quite concerned, I simply turn off the monitor."
    elseif ptr == 722 then
        bg ''
        b "Is she...{w=.25} okay?"
    elseif ptr == 723 then
        b "Does she need therapy?{w=1} Scizophrenia treatment?"
    elseif ptr == 724 then
        b "Whatever it may be, I'll be here for her."
    elseif ptr == 725 then
        b "Just as I have been for the past five years."
    elseif ptr == 726 then
        b "Suddenly, the front door opens."
    elseif ptr == 727 then
        s "I'm ho~me!"
    elseif ptr == 728 then
        b "At this point, all self-control has left me."
    elseif ptr == 729 then
        b "The little guy who makes sure my actions are good ones has gone on a smoke break or something."
    elseif ptr == 730 then
        b "I run into the living room and give Sarah perhaps the biggest hug I've {b}ever{/b} given her."
    elseif ptr == 731 then
        b "And words just fly out of my mouth."
    elseif ptr == 732 then
        p "I love you. I really do. You know this."
    elseif ptr == 733 then
        p "I'll love you no matter what. You're the most important person to me."
    elseif ptr == 734 then
        p "I'll take on {b}any{/b} of your burdens."
    elseif ptr == 735 then
        p "And...{w=.5} I know you're going through some things right now."
    elseif ptr == 736 then
        p "But that's okay."
    elseif ptr == 737 then
        p "That's what I'm here for."
    elseif ptr == 738 then
        p "Everything's gonna be okay."
    elseif ptr == 739 then
        b "Huh. Not bad."
    elseif ptr == 740 then
        b "Sarah appears a bit hesitant."
    elseif ptr == 741 then
        s "Thank{w=.25} you,{w=.5} but why{w=.5} now?."
    elseif ptr == 742 then
        b "Something tells me I shouldn't tell her I read that file..."
    elseif ptr == 743 then
        p "To be honest...{w=.5} I'm not sure."
    elseif ptr == 744 then
        p "But...{w=.5} Something just{w=.5} told me that you needed help."
    elseif ptr == 745 then
        s "Well,{w=1} thank you, Spencer."
    elseif ptr == 746 then
        wait(5)
    elseif ptr == 747 then
        p "So, how're you feeling? Up to that birthday video?"
    elseif ptr == 748 then
        s "Hell yeah."
    elseif ptr == 749 then
        s "But first... Something that didn't cross my mind until I left work."
    elseif ptr == 750 then
        s "We should've called out sick. Probably would've been a good idea."
    elseif ptr == 751 then
        s "If I'm being quite honest...{w=1} I haven't entirely recovered."
    elseif ptr == 752 then
        s "What about you?"
    elseif ptr == 753 then
        p "Same.{w=.5} Let's go do that first."
    elseif ptr == 754 then
        b "We both call out sick from work before recording a YouTube video."
    elseif ptr == 755 then
        b "We were going to on her birthday, but{w=.5} that{w=.25} didn't happen."
    elseif ptr == 756 then
        b "Even if we only have around 1,000 subscribers, we put a lot of effort into our content."
    elseif ptr == 757 then
        b "We finish the video at around 9:30, and then we quit for the night."
    elseif ptr == 758 then
        b "Then, we send it to Aiden, who always does a {b}great{/b} job editing videos."
    elseif ptr == 759 then
        b "He even {b}subtitles{/b} them, which is just {b}incredible{/b}, considering the amount of effort it takes."
    elseif ptr == 760 then
        b "Sarah, feeling exausted, checks out for the night."
    elseif ptr == 761 then
        b "But I have a bit of energy, so I stay up a bit longer."
    elseif ptr == 762 then
        b "To not disturb her, I decide to watch YouTube on my phone rather than the TV."
    elseif ptr == 763 then
        b "When I grab it, I have a text from Sarah from a little after she got home."
    elseif ptr == 764 then
        b "I probably didn't get it because I had Do Not Disturb on."
    elseif ptr == 765 then
        b "I unlock my phone and read it."
    elseif ptr == 766 then
        b '"I LOVE you. You know this.'
    elseif ptr == 767 then
        b '"Back when you confessed to me, you said that you wanted to live with me forever.'
    elseif ptr == 768 then
        b '"So did I. I still stand true to that. But do YOU?'
    elseif ptr == 769 then
        b '"Do you STILL want to live with me forever?'
    elseif ptr == 770 then
        b '"I guess what I want to say is... Spencer, will you marry me?"'
    elseif ptr == 771 then
        b "..."
    elseif ptr == 772 then
        b "I almost can't believe my eyes."
    elseif ptr == 773 then
        b "She's serious. She wants to marry me."
    elseif ptr == 774 then
        b "She actually wants to marry me."
    elseif ptr == 775 then
        b "This is kinda sudden..."
    elseif ptr == 776 then
        b "But, if I'm being completely honest..."
    elseif ptr == 777 then
        b "I've felt the same way for a while now."
    elseif ptr == 778 then
        b "And her birthday probably made me feel it even more."
    elseif ptr == 779 then
        b "I'm sure it was the same for her, at least a little bit."
    elseif ptr == 780 then
        b "I sit down on the couch, thinking to myself."
    elseif ptr == 781 then
        b "Do I {b}really{/b} want to do this?"
    elseif ptr == 782 then
        b "It seems like an easy answer."
    elseif ptr == 783 then
        b "But...{w=.5} Is she {b}truly{/b},{w=.75} {b}absolutely{/b},{w=.25} the one I want to marry?"
    elseif ptr == 784 then
        wait(5)
    elseif ptr == 785 then
        b "That thought stays with me as I fall asleep."
    elseif ptr == 786 then
        b "This is a mostly permanent decision, kinda like a tattoo."
    elseif ptr== 787 then
        b "I just want to be 1,000% sure I'm not fucking up my future."
    elseif ptr == 788 then
        wait(5)
    elseif ptr == 789 then
        b "That night, I have a dream where I accept her confession, and I have children with her."
    elseif ptr == 790 then
        b "It gives me a pleasant feeling, one that I can't quite put into words."
    elseif ptr == 791 then
        b "And when I wake up, I feel deep down, I've made my decision."
    elseif ptr == 792 then
        b "Throughout the last 5½ years, I've always been by her side."
    elseif ptr == 793 then
        b "I've kissed her.{w=.25} Lived with her."
    elseif ptr == 794 then
        b "Helped her through her toughest times."
    elseif ptr == 795 then
        b "I've become too invested in her to ditch her now.{w=.5} And why would I?"
    elseif ptr == 796 then
        b "As I said back when I confessed to her, she's everything a guy could ever ask for."
    elseif ptr == 797 then
        b "Shaking her shoulder, I try to wake her up."
    elseif ptr == 798 then
        s "Spen{w=.5}cer?{w=.75} Wha{w=.5}t's up?"
    elseif ptr == 799 then
        p "I got your text."
    elseif ptr == 800 then cartSpin()
    elseif ptr == 801 then
        if xaload == 0 then
            dlg_enabled = false
            bg "end_error"
            local text = "COULD NOT #INCLUDE FILE:\n{col=#FF77A8}DRAW.LUA"
            immediatetext:send(text, 128, true)
            savegame()
        end
        wait(10)
    elseif ptr == 802 then
        -- The whole immediate mode scene is just one huge text:send() call with waits and warps.
        if xaload == 0 then
            savegame()
            -- immediateCursor:send('', 8, true)
            immediate_y = 0
            local text = [[{warp=39}COULD NOT #INCLUDE FILE:
{col=#FF77A8}DRAW.LUA
{/col}{function=love.window.setTitle"6.P8 (PICO-8)"}> {w=1}?PTR{w=.2}{warp=13}
{col=#C2C3C7}[NIL]
{/col}> {w=1.25}?CHAPTER{w=.2}{warp=13}
{col=#C2C3C7}[NIL]
{/col}> {w=1.25}INFO{w=.2}{warp=63}
{col=#FF77A8}FILE: 6.P8
{col=#C2C3C7}COULD NOT #INCLUDE FILE:
{col=#FF77A8}STATES/GAME.LUA
{/col}> {w=1.75}LS{w=.2}{warp=54}
{col=#29ADFF}DIRECTORY: /
{col=#FF77A8}SCRIPTS
STATES
{col=#C2C3C7}REN.P8
IAH.P8
{/col}> {w=1.5}CD STATES{w=.2}{warp=16}
{col=#29ADFF}/STATES/
{/col}> {w=.75}LS{w=.2}{function=immediate_y=immediate_y-12}{warp=38}
{col=#29ADFF}DIRECTORY: /STATES/
{col=#C2C3C7}LOAD.LUA
{/col}> {w=.75}CD ../SCRIPTS{w=.2}{function=immediate_y=immediate_y-12}{warp=18} 
{col=#29ADFF}/SCRIPTS/
{/col}> {w=.5}LS{w=.2}{function=immediate_y=immediate_y-30}{warp=47}
{col=#29ADFF}DIRECTORY: /SCRIPTS/
{col=#C2C3C7}6.P8
7.P8
SA.P8
{/col}> {w=1.75}LOAD 7{w=.2}{function=immediate_y=immediate_y-12;love.window.setTitle"7.P8 (PICO-8)"}{warp=31}
{col=#C2C3C7}LOADED 7.P8 (16239 CHARS)
{/col}> INFO{w=.2}{function=immediate_y=immediate_y-24}{warp=53}
{col=#FF77A8}FILE: 7.P8
{col=#C2C3C7}COULD NOT #INCLUDE FILE:
{col=#FF77A8}REN.P8
{/col}> {w=1}LOAD SA{w=.2}{function=immediate_y=immediate_y-12;love.window.setTitle"SA.P8 (PICO-8)"}{warp=34}
{col=#C2C3C7}LOADED SA.P8 (13004 CHARS)
{/col}> {w=.5}INFO{w=.2}{function=immediate_y=immediate_y-30}{warp=97}
{col=#FF77A8}FILE: SA.P8
{/col}TOKENS:      1025 /  8192
CHARS:      13004 / 65535
COMPRESSED:  7023 / 15616
> {w=.75}RUN{w=.2}{function=changeState"credits"}]]
            immediatetext:send(text, 128)
            immediateCursor:send("{col=#FF004D}{blink=4}▮", 8, true)
        end
        immediatetext:update(dt)
        immediateCursor:update(dt)
    elseif ptr == 803 then
        if xaload == 0 then
            immediate_y = 0
            if g_system == "Windows" or g_system == "OS X" then
                immediatetext:send([[{warp=2}> {w=.2}F=#INCLUDE README.LUA{w=.2}{warp=3}
> {w=.2}PRINTH(F,'README.TXT',TRUE){w=.2}{function=write("appdata/InaHeartbeat/readme.txt",love.filesystem.read"scripts/writables/readme.txt")}{warp=3}
> {w=.2}EXTCMD'FOLDER'{w=.2}{function=love.system.openURL("file://"..getWorkingDirectory().."/appdata/InaHeartbeat")}{warp=3}
> {w=.5}]], 128)
            else immediatetext:send([[> F=#INCLUDE README.LUA{w=.2}{warp=3}
> #INCLUDE #{w=.75}634{w=.5}121{w=.75}{warp=3}
> POEM{F,0,FALSE}]], 128)
            end
            immediateCursor:send("{col=#FF004D}{blink=2}▮", 8, true)
        end
        immediatetext:update(dt)
        immediateCursor:update(dt)
        if immediatetext:is_finished() then cartSpin() end
    elseif ptr == 804 and chapter == 4 then
        bg "credits_error"
        love.window.setTitle "InaHeartbeat"
        chapter = 5
        savegame()
    end
end