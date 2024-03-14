tr={}
tr.auto="Auto"
tr.skip="Skip"
tr.credits={
    -- Lyrics
    "This was a triumph.",
    "I'm making a note here:",
    "HUGE SUCCESS.",
    
    "It's hard to overstate",
    "my satisfaction.",


    "Aperture Science",
    "We do what we must",
    "because we can.",

    "For the good of all of us.",
    "Except the ones who are dead.",

    "But there's no sense crying",
    "over every mistake.",
    "You just keep on trying",
    "till you run out of cake.",

    "And the Science gets done.",
    "And you make a neat gun.",
    "For the people who are",
    "still alive.",


    "I'm not even angry.",
    "I'm being so sincere right now.",
    "Even though you broke my heart.",
    "And killed me.",

    "And tore me to pieces.",
    "And threw every piece into a fire.",
    "As they burned it hurt because",
    "I was so happy for you!",

    "Now these points of data",
    "make a beautiful line.",
    "And we're out of beta.",
    "We're releasing on time.",

    "So I'm GLaD. I got burned.",
    "Think of all the things we learned",
    "for the people who are",
    "still alive.",


    "Go ahead and leave me.",
    "I think I prefer to stay inside.",
    "Maybe you'll find someone else",
    "to help you.",

    "Maybe Black Mesa...",
    "THAT WAS A JOKE. FAT CHANCE.",
    "Anyway, this cake is great.",
    "It's so delicious and moist.",

    "Look at me still talking",
    "when there's Science to do.",
    "When I look out there,",
    "it makes me GLaD I'm not you.",

    "I've experiments to run.",
    "There is research to be done.",
    "On the people who are",
    "still alive.",


    "And believe me I am",
    "still alive.",
    "I'm doing Science and I'm",
    "still alive.",
    "While you're dying I'll be",
    "still alive.",
    "And when you're dead I will be",
    "still alive.",

    "STILL ALIVE",
    -- Credits
    "Writing:",
    "Programming:",
    "Music:",
    "Art:",
    "Special Thanks:",
    -- Immediate mode
    "?chapter",
    "ls",
    "load ",
    "info",
    "run",
    "printh(#include readme.lua,'readme.txt',true)",
    "extcmd'folder'"
}
local basedirs={
    ["3DS"] ="3ds/data/lovepotion/\nInaHeartbeat",
    Android ="Android/data/\norg.love2d.android",
    ["OS X"]="Library/Application Support/\npico-8",
    Windows ="AppData\\Roaming\\pico-8"
}
local horizon_splash=g_system=="3DS"and"3DS > Switch"or"Who the fuck would even play\nthis on a 3DS?"
tr.splash={
    "Winner of the fastest\nrelease award!",
    "Don't make me tell your mom\nabout her.",
    "Who needs sex when you can\nflirt with pixels?",
    horizon_splash,
    "This game contains\nmild sex.",

    'It\'s "PICO-8," not "Pico 8,"\ndumbass!',
    "PICO-8 > Ren'Py",
    '?"Hello, world!"',
    basedirs[g_system],

    "DDLC is quivering in its\nshoes right now.",
    "I gently open the door.",
    "PPLC died for this."
}
tr.confirm="Are you sure?\nUnsaved data\nwill be lost."