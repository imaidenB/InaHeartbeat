function ch2script()
    if ptr < 437 then changeState("game", 1)
    elseif ptr == 437 then
        b "It's been almost a week since Sarah stole my phone number."
    elseif ptr == 438 then
        b "In that time, a lot has happened."
    elseif ptr == 439 then
        b "On Monday, Sarah and Liam exchanged Roblox usernames."
    elseif ptr == 440 then
        b "I don't know how much they've been playing, but Sarah doesn't seem to be any less into me."
    elseif ptr == 441 then
        b "In fact, she's been texting up a storm."
    elseif ptr == 442 then
        b "One thing she said is that she had seen Aiden many times before she was a freshman."
    elseif ptr == 443 then
        b "But she actually deleted that message before I could ask her about it."
    elseif ptr == 444 then
        b "I {b}do{/b} have a couple of theories about why..."
    elseif ptr == 445 then
        b "{b}Game Theories!{/b}"
    elseif ptr == 446 then
        b "I still miss MatPat..."
    elseif ptr == 447 then
        b "Anyway, I've only started liking her even more, now that I've gotten to know her better."
    elseif ptr == 448 then
        b "But most importantly..."
    elseif ptr == 449 then
        b "It's Liam's 14✽ birthday, and he invited me, Sarah, and Aiden to come over at 4:30."
    elseif ptr == 450 then
        b "It's the first time he's done that, probably because I usually just hog his VR headset when I come over."
    elseif ptr == 451 then
        b "To be fair, I really don't blame him.{w=.5} But I'll try to resist it just this once."
    elseif ptr == 452 then
        b "Some stuff came up, so I'm gonna be about ½ an hour late.{w=.5} Oh well..."
    elseif ptr == 453 then
        b "After I finish up, I say goodbye to my family and head out the door."
    elseif ptr == 454 then
        b "But shortly after I do, I get a text from Aiden saying that Sarah isn't there yet."
    elseif ptr == 455 then
        b "Which concerns me, because she seemed pretty excited to go."
    elseif ptr == 456 then
        b "I call her, but her phone rings and goes to voicemail."
    elseif ptr == 457 then
        b "She wasn't at school for some reason, so I haven't heard from her at all today."
    elseif ptr == 458 then
        b "Feeling a little frightened, I decide to run over to Sarah's house."
    elseif ptr == 459 then
        b "She's been a teensy bit...{w=.5} off{w=.25} these past few days."
    elseif ptr == 460 then
        b "So I want to make sure she's okay."
    elseif ptr == 461 then
        bg "sarah_ext_curtain"
        b "By the time I get to her place, I'm almost out of breath."
    elseif ptr == 462 then
        b "Her curtains are shut, despite her always opening them in the day."
    elseif ptr == 463 then
        b "Strange..."
    elseif ptr == 464 then
        b "Ignoring that, I ring her video doorbell."
    elseif ptr == 465 then
        wait(3, true)
    elseif ptr == 466 then
        dlg("mother", "Oh. Hey, Spencer!")
    elseif ptr == 467 then
        dlg("mother", "I'm not home, but what's up?")
    elseif ptr == 468 then
        p "I wanna check on Sarah."
    elseif ptr == 469 then
        p "I haven't seen her all day, and she isn't answering her phone."
    elseif ptr == 470 then
        dlg("mother", "She wasn't at school?")
    elseif ptr == 471 then
        p "Yeah. I'm a bit worried something happened to her."
    elseif ptr == 472 then
        dlg("mother", "Oh, dear.")
    elseif ptr == 473 then
        dlg("mother", "Well, you can go ahead and check on her.")
    elseif ptr == 474 then
        dlg("mother", "If she never left, the door should still be unlocked.")
    elseif ptr == 475 then
        p "Okay. Thanks!"
    elseif ptr == 476 then
        bg ''
        b "I open the door and let myself in."
    elseif ptr == 477 then
        p "Sarah?"
    elseif ptr == 478 then
        p "*gulp*"
    elseif ptr == 479 then
        b "I guess she's a heavy sleeper?"
    elseif ptr == 480 then
        b "I can't believe I ended up doing this after all."
    elseif ptr == 481 then
        b "Waking her up in her own house..."
    elseif ptr == 482 then
        b "Isn't that more like something a boyfriend would do?"
    elseif ptr == 483 then
        b "In any case..."
    elseif ptr == 484 then
        b "It just feels right."
    elseif ptr == 485 then
        b "Outside Sarah's room, I knock on her door."
    elseif ptr == 486 then
        p "Sarah?"
    elseif ptr == 487 then
        p "Wake up, dummko~pf!"
    elseif ptr == 488 then
        b "There's no response."
    elseif ptr == 489 then
        b "I really didn't want to have to enter her room like this..."
    elseif ptr == 490 then
        b "Isn't it kind of a breach of privacy?"
    elseif ptr == 491 then
        b "But she really leaves me no choice."
    elseif ptr == 492 then
        b "I gently open the door."
    elseif ptr == 493 then
        p ".......Sar--{nw}"
    elseif ptr == 494 then
        if xaload == -1 then
            bg("cg/s_cg1", "glitch")
            music "lavender"
            b ''
        end
        bgImg:update(dt)
        wait(7.7499, true)
    elseif ptr == 495 then
        if xaload == 0 then
            createDirectory(p8Dir)
            write(p8Dir.."/traceback.p8l", love.filesystem.read "scripts/writables/traceback.p8l")
            dlgtext.current_shadow_color = {.16078431372549, .094117647058824, .07843137254902, 1}
            useAltCtc = true
        elseif xaload == 360 then
            bgTag = "still"
            b "..."
        end
    elseif ptr == 496 then
        tag "normal"
        b "What the hell?"
    elseif ptr == 497 then
        b "She isn't moving {b}at all{/b}."
    elseif ptr == 498 then
        b "Did she go and pull a Sayori?{w=.5} Minus the rope?"
    elseif ptr == 499 then
        b "No... She would never do that...{w=1} Would she?"
    elseif ptr == 500 then
        b "Feeling {b}very{/b} worried, I run over to her."
    elseif ptr == 501 then
        if xaload == 0 then
            bg("cg/s_cg2", 1)
            dlgtext.current_shadow_color = dlgtext.default_shadow_color
            useAltCtc = false
        end
        b "I can still hear her breathing softly."
    elseif ptr == 502 then
        b "That's a {b}huge{/b} relief."
    elseif ptr == 503 then
        b "But those eyes..."
    elseif ptr == 504 then
        b "I've never seen her so lifeless."
    elseif ptr == 505 then
        b "And then, {b}my{/b} eyes drift down..."
    elseif ptr == 506 then
        p "Gah..."
    elseif ptr == 507 then
        b "Wait...{w=.75} They're {b}that{/b} big?{w=1}{nw}"
    elseif ptr == 508 then
        b "No! {b}Stop it! Stop it!{/b}"
    elseif ptr == 509 then
        b "It's {b}super{/b} wierd to get turned on by unconscious people, you know!"
    elseif ptr == 510 then
        b "Not that you weren't already turned on by some weird shit..."
    elseif ptr == 511 then
        b "But there's gotta be {b}some{/b} law against that..."
    elseif ptr == 512 then
        wait(1)
    elseif ptr == 513 then
        b "My horny ass somehow manages to power through."
    elseif ptr == 514 then
        b "She still hasn't noticed me {b}at all{/b}."
    elseif ptr == 515 then
        b "I wave my arm in her face."
    elseif ptr == 516 then
        p "Sarah~..."
    elseif ptr == 517 then
        b "She doesn't even flinch."
    elseif ptr == 518 then
        p "What the fuck did you do..."
    elseif ptr == 519 then
        b "Feeling desperate, I grab her by the shoulders and shake her."
    elseif ptr == 520 then
        tag(2)
        p "{b}Sarah!{/b}"
    elseif ptr == 521 then
        s "Huh?"
    elseif ptr == 522 then
        tag(3)
        s "{b}Ahh!{/b}"
    elseif ptr == 523 then
        tag(4)
        b "She falls onto her bed, startling me in the process."
    elseif ptr == 524 then
        b "We each take a moment to catch our breath."
    elseif ptr == 525 then
        tag(5)
        s "Spen{.5}cer?"
    elseif ptr == 526 then
        s "Wh{w=.25}at are you{w=.75} doing here?"
    elseif ptr == 527 then
        p "You were supposed to be at Liam's place almost an hour ago!"
    elseif ptr == 528 then
        p "And you weren't at school today!"
    elseif ptr == 529 then
        p "So I had no choice but to check on you."
    elseif ptr == 530 then
        p "And then you went and made me think you pulled a Sayori."
    elseif ptr == 531 then
        tag(6)
        s "Oh, shit. Not again..."
    elseif ptr == 532 then
        p "Huh?"
    elseif ptr == 533 then
        s "*sigh*"
    elseif ptr == 534 then
        tag(2)
        s "Well, long story short...{w=.25} I recently started some different meds."
    elseif ptr == 535 then
        tag(8)
        s "Apparently, my old ones made me hallucinate and shit, but I have no memory of that."
    elseif ptr == 536 then
        p "The fuck?"
    elseif ptr == 537 then
        tag(7)
        s "Yeah..."
    elseif ptr == 538 then
        tag(9)
        s "And I guess these ones{w=.25} turned me into a zombie for, like,{w=.25} nine hours."
    elseif ptr == 539 then
        tag(7)
        s "Man, I'm starving."
    elseif ptr == 540 then
        p "Well, why don't you get dressed, and then we can grab a bite before we leave."
    elseif ptr == 541 then
        tag(9)
        s "That sounds good.{w=1} Gimmie, like, 10-ish minutes."
    elseif ptr == 542 then
        p "Okay."
    elseif ptr == 543 then
        bg "sarah_int"
        music ''
        b "I leave Sarah's room and wait for her."
    elseif ptr == 544 then
        b "After about 10 minutes, she comes out, wearing what is probably my favorite outfit I've seen her in."
    elseif ptr == 545 then
        music "ss"
        updS('m', "1d")
        s "What do you think?"
        choose {"So cute!", "Nice!"}
    elseif ptr == 546 then
        p (choice)
    elseif ptr < 550 then
        if choice == "Nice!" then -- "Nice!"
            if ptr == 547 then
                updS('m',"3d")
                s "Yeah, I love this shirt!"
            elseif ptr == 548 then
                p "I can tell. It looks great on you."
            elseif ptr == 549 then
                s "Thanks!"
            end
        elseif ptr == 547 then -- "So cute!"
            updS('o',"2d")
            s "Aw, thanks, Spencie!"
        elseif ptr == 548 then
            p "Yeah. It's probably my favorite one I've seen you wear."
        elseif ptr == 549 then
            s "Really? Mine too!"
        end
    elseif ptr == 550 then
        p "Anyway, let's grab some food."
    elseif ptr == 551 then
        hideS()
        b "We eat some food, and start our walk to Liam's place."
    elseif ptr == 552 then
        bg "sarah_ext"
        b "Along the way, she appears a {b}lot{/b} more energetic than usual."
    elseif ptr == 553 then
        b "Which I guess makes sense, considering she technically got almost 20 hours of sleep."
    elseif ptr == 554 then
        b "Or maybe it's just ADHD. Who knows?"
    elseif ptr == 555 then
        b "But either way, at least she won't fall asleep on the way back."
    elseif ptr == 556 then
        b "Also, there was something that I noticed when I found Sarah that I'd like to ask her about."
    elseif ptr == 557 then
        p "Sarah?"
    elseif ptr == 558 then
        updS('m', "2e")
        s "Ye~s?"
    elseif ptr == 559 then
        p "About that book that was on your bed..."
    elseif ptr == 560 then
        s "What book?"
    elseif ptr == 561 then
        updS('t', "3e")
        b "Sarah sucks her teeth."
    elseif ptr == 562 then
        updS('u', "3e")
        s "Um... What{w=.25} about{w=.5} it?"
    elseif ptr == 563 then
        p "Is it yours?"
    elseif ptr == 564 then
        s "Well...{w=.5} yes, but..."
    elseif ptr == 565 then
        p "Ahaha!"
    elseif ptr == 566 then
        updS('v',"2e")
        s "You{w=.75}'re laughing at me..."
    elseif ptr == 567 then
        p "No! It's just how you're taking it.{w=1} Look."
    elseif ptr == 568 then
        p "How could I get mad at someone for reading the word of God?"
    elseif ptr == 569 then
        p "The `purest book on Earth?'"
    elseif ptr == 570 then
        updS('w', "32e")
        s "W-wait... Do you go to..."
    elseif ptr == 571 then
        p "Yeah.{w=.5} I'm--{nw}"
    elseif ptr == 572 then
        updS('r', "1e")
        s "*gasp*{w=1} No {b}way~!{/b}"
    elseif ptr == 573 then
        updS('', 4)
        b "Sarah lets out an ear-piercing squeal."
    elseif ptr == 574 then
        updS('x',"2e")
        s "Oops..."
    elseif ptr == 575 then
        updS('y',"2e")
        b "Sarah looks around, presumably to find out how many passersby got a show."
    elseif ptr == 576 then
        updS('x',"2e")
        s "We're, like, 20 yards from that intersection.{w=.25} Any closer, and I'd be in jail."
    elseif ptr == 577 then
        updS('z', "3e")
        s "But hey, at least you're{.5} happy,{.75} I guess."
    elseif ptr == 578 then
        hideS()
        s "Ahaha!"
    elseif ptr == 579 then
        b "What the hell kind of comment was that?"
    elseif ptr == 580 then
        b "Though, to be honest... she's kinda right."
    elseif ptr == 581 then
        bg "liam"
        updS('r', "13e")
        b "Before I know it, we're at Liam's house."
    elseif ptr == 582 then
        b "Before we even make it to the door, Liam comes out to greet us."
    elseif ptr == 583 then
        updS('r', "13e", -1)
        updL('a', "1b", 1)
        l "Finally you two made it!"
    elseif ptr == 584 then
        p "Yeah... She{w=.5} overslept."
    elseif ptr == 585 then
        updS('q', "13e")
        b "Sarah elbows me."
    elseif ptr == 586 then
        updL('c', "1b")
        l "Huh. And here I was thinking you were always energetic!"
    elseif ptr == 587 then
        updS('n', "2e")
        s "Yeah, yeah..."
    elseif ptr == 588 then
        hideL()
        b "Liam runs inside and motions us to come in, too."
    elseif ptr == 589 then
        updA('a', "1b", 1)
        b "But Aiden comes out before we can make it in."
    elseif ptr == 590 then
        b "He's not wearing anything over his brace, which is a bit odd."
    elseif ptr == 591 then
        a "Hey~! You guys made it!"
    elseif ptr == 592 then
        b "Me and Aiden awkwardly do our handshake, which we haven't exactly defined yet."
    elseif ptr == 593 then
        s "Aiden!"
    elseif ptr == 594 then
        a "You're Sarah, right? Spencer's girlfriend?"
    elseif ptr == 595 then
        updS('a', "2e")
        s "What? No!"
    elseif ptr == 596 then
        updA('e', "2b")
        a "Ahaha! I'm kidding."
    elseif ptr == 597 then
        updS('s', "3e")
        s "What's that you're wearing? Are you okay?"
    elseif ptr == 598 then
        a "Yeah. It's a brace for my scoliosis."
    elseif ptr == 599 then
        a "It's meant to hopefully delay surgery until I'm, like, 18."
    elseif ptr == 600 then
        updS('t', "3e")
        s "Oh, jeez. Well, good luck."
    elseif ptr == 601 then
        a "Thanks."
    elseif ptr == 602 then
        p "Yo, Aiden. Guess what?"
    elseif ptr == 603 then
        a "What?"
    elseif ptr == 604 then
        p "Apparently Sarah goes to our church!"
    elseif ptr == 605 then
        updS('x', "1e")
        s "..."
    elseif ptr == 606 then
        a "I thought I recognized her from our activities."
    elseif ptr == 607 then
        updS('u', "2e")
        s "Ehehe... Yeah."
    elseif ptr == 608 then
        l "Hurry up, guys! The cake is almost ready!"
    elseif ptr == 609 then
        hideA()
        b "Aiden runs inside and removes his shoes. Me and Sarah do the same."
    elseif ptr == 610 then
        bg ''
        hideS()
        wait(2, true)
    elseif ptr == 611 then
        b "The party is amazing."
    elseif ptr == 612 then
        b "Aiden brought some ice cream from home, since he can't have the cake."
    elseif ptr == 613 then
        b "Sarah's gift for Liam was about as good as mine."
    elseif ptr == 614 then
        b "Me and Sarah stay behind a bit longer to chat with Liam."
    elseif ptr == 615 then
        bg "liam"
        b "Finally, I walk outside, Sarah following closely."
    elseif ptr == 616 then
        updS('w', "12e")
        s "Wait!"
    elseif ptr == 617 then
        p "Huh?"
    elseif ptr == 618 then
        updS('u', "2e")
        s "Um... Spencie?"
    elseif ptr == 619 then
        p "Yeah?"
    elseif ptr == 620 then
        s "Are you{w=.5} free{w=.25} Saturday?"
    elseif ptr == 621 then
        b "Hold on. Is she...{w=.5} asking me out?"
    elseif ptr == 622 then
        b "I'm not completely free, but I could make room for a date."
    elseif ptr == 623 then
        p "I think so. Why?"
    elseif ptr == 624 then
        updS('z', "13e")
        s "Well,{w=.5} I was wondering if you'd{w=.75} wanna{w=.5} maybe{w=.5} do something."
    elseif ptr == 625 then
        updS('o', "2e")
        s "You know... Just{w=.25} the{w=.5} two of us?"
    elseif ptr == 626 then
        b "Oh, my God. She {b}is{/b} asking me out."
    elseif ptr == 627 then
        b "I don't know how Mom'd feel about me being alone with her for hours..."
    elseif ptr == 628 then
        b "But I'm sure I could figure something out."
    elseif ptr == 629 then
        p "That sounds okay. What do you{w=.25} want to do?"
    elseif ptr == 630 then
        updS('r', "1e")
        s "I don't know. There's so much I can think of!"
    elseif ptr == 631 then
        p "Well, we can work out the specifics later."
    elseif ptr == 632 then
        p "But yeah, I'm down for a date Saturday."
    elseif ptr == 633 then
        b "{b}Gah{/b}, why did you say it like that?"
    elseif ptr == 634 then
        updS('', 5) -- ('', 4) and ('', 5) refer to 4.png and 5.png respectively
        s "Yay!"
    elseif ptr == 635 then
        updS('m', "2e")
        s "Oh, and{w=.5} you know,{w=.75} when you woke me up earlier..."
    elseif ptr == 636 then
        s "Yeah~,{w=.5} I {b}totally{/b} saw your pants."
    elseif ptr == 637 then
        updS('r', "1e")
        s "Ahaha!"
    elseif ptr == 638 then
        hideS()
        b "Excuse me?"
    elseif ptr == 639 then
        b "What kind of flirt was that?"
    elseif ptr == 640 then
        b "But if she has the audacity to say something like that..."
    elseif ptr == 641 then
        s "Hurry up, slowpoke!"
    elseif ptr == 642 then
        b "Sarah calls out to me from the intersection."
    elseif ptr == 643 then
        b "I run, catching up to her."
    elseif ptr == 644 then
        b "But I don't stop in front of her."
    elseif ptr == 645 then
        updS('w', "1e")
        s ".......Spence--{nw}"
    elseif ptr == 646 then
        bg("cg/s_cg3", 1)
        hideS()
        dlgTop = true
        music "aad"
        s "{b}Oof!{/b}"
    elseif ptr == 647 then
        wait(3, true)
    elseif ptr == 648 then
        tag(2)
        s "Spencer?"
    elseif ptr == 649 then
        p "I love you."
    elseif ptr == 650 then
        s "Huh?"
    elseif ptr == 651 then
        p "Well, `love' might a bit much, but it's the only word that I can think of."
    elseif ptr == 652 then
        p "To be honest, I've kinda been into you from the very beginning."
    elseif ptr == 653 then
        p "But, now that I know just how much {b}you're{/b} into me..."
    elseif ptr == 654 then
        p "I have no reason {b}not{/b} to confess my true feelings."
    elseif ptr == 655 then
        tag(3)
        s "Spencer,{w=1} thank you. I love you too.{w=.5} But..."
    elseif ptr == 656 then
        s "I think you're overreacting a bit."
    elseif ptr == 657 then
        s "I'm not worthy of someone like you..."
    elseif ptr == 658 then
        tag(4)
        s "You're caring, smart, helpful, funny..."
    elseif ptr == 659 then
        s "And you really are {b}adorable{/b}. Even more than Liam."
    elseif ptr == 660 then
        tag(3)
        s "But what do {b}I{/b} have to offer?"
    elseif ptr == 661 then
        tag(4)
        s "A mean mom and medication issues..."
    elseif ptr == 662 then
        p "Sarah, what are you talking about?"
    elseif ptr == 663 then
        p "From what I've seen, you've got {b}everything{/b} a guy could ask for..."
    elseif ptr == 664 then
        p "You're smart, funny, loyal, cute..."
    elseif ptr == 665 then
        tag(3)
        s "Really?"
    elseif ptr == 666 then
        tag(6)
        p "Yeah."
    elseif ptr == 667 then
        p "And I can't help but admit..."
    elseif ptr == 668 then
        p "You've some decent...{w=1} Uh...{w=.75} Well,{w=.5} you know."
    elseif ptr == 669 then
        tag(7)
        s "..."
    elseif ptr == 670 then
        tag(8)
        s "Ahaha!"
    elseif ptr == 671 then
        tag(9)
        s "You, too."
    elseif ptr == 672 then
        p "Huh?{w=1.25} What do you--{nw}"
    elseif ptr == 673 then
        bg ''
        p "Mmmph!{w=.75}{nw}"
    elseif ptr == 674 then
        wait(2.5, true)
        dlgTop = false
    elseif ptr == 675 then
        updA('e', "3b", 0)
        a "Ah, young love..."
    elseif ptr == 676 then
        updA('e', "2b")
        a "They look so cute together!"
    elseif ptr == 677 then
        wait(1)
    elseif ptr == 678 then
        updA('b', "31b")
        a "...Why am I saying that about, essentially, my daughter?"
    elseif ptr == 679 then
        updA('b', "3b")
        a "Never mind. I'm getting distracted."
    elseif ptr == 680 then
        a "Let's continue on..."
    elseif ptr > 680 then cartSpin()
    end
end