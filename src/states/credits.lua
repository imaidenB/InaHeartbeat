lyricbox = text.new("left", {
    font = p8sciiFont,
    color = {1, .6392156862745, 0, 1},
    print_speed = .065,
    adjust_line_height = -2
})
lcursor = text.new("left",{
    font = p8sciiFont,
    color = {1, .6392156862745, 0, 1}
})
lcursor:send("{blink=8}_", 4, true)

creditbox = text.new("left", {
    font = p8sciiFont,
    color = {1, .6392156862745, 0, 1},
    print_speed = .11375,
    adjust_line_height = -2
})
ccursor = text.new("left",{
    font = p8sciiFont,
    color = {1, .6392156862745, 0, 1}
})
ccursor:send("{blink=8}_", 4, true)

local saBg = lg.newImg "credits/bg"
credits_gfx = peachy.new("credits/gfx", "none")

local lyrics = {
    -- -- {Time, [lyric: clear screen], [speed: 1], [image: previous]}
    -- {2.75,      "This was a triumph."},
    -- {14.099,    "I'm making a note here:"},
    -- {20.798,    "HUGE SUCCESS."},
    
    -- {29.197,    "It's hard to overstate",3},
    -- {36,        "my satisfaction.",3},

    -- {50.7,      "Aperture Science",2,"aperture"},
    -- {61.994,    "We do what we must"},
    -- {67,        "because we can."},

    -- {77.493,    "For the good of all of us.",3},
    -- {87.392,    "Except the ones who are dead.",1,"toxic"},

    -- {94.2},

    -- {94.291,    "But there's no sense crying",2,"aperture"},
    -- {100.291,   "over every mistake.",2},
    -- {106.09,    "You just keep on trying"},
    -- {112,       "till you run out of cake."},

    -- {118.089,   "And the Science gets done.",2,"atom"},
    -- {124.5,     "And you make a neat gun.",2},
    -- {129.788,   "For the people who are",2},
    -- {135.0,     "still alive.",2,"aperture"},

    -- {140},

    -- {157.586,   "I'm not even angry."},
    -- {170.084,   "I'm being so sincere right now.",3},
    -- {184.783,   "Even though you broke my heart.",3,"heartbreak"},
    -- {194.982,   "And killed me.",3},

    -- {205.281,   "And tore me to pieces.",2,"explode"},
    -- {217.18,    "And threw every piece into a fire.",2,"fire"},
    -- {232.579,   "As they burned it hurt because"},
    -- {242.578,   "I was so happy for you!",2,"check"},

    -- {249},

    -- {249.477,   "Now these points of data"},
    -- {254.5,     "make a beautiful line."},
    -- {261.176,   "And we're out of beta."},
    -- {266,       "We're releasing on time."},

    -- {273.175,   "So I'm GLaD. I got burned.",2,"fire"},
    -- {279.074,   "Think of all the things we learned",1,"atom"},
    -- {285.274,   "for the people who are",2},
    -- {290.784,   "still alive.",2,"aperture"},

    -- {311},

    -- {313.471,   "Go ahead and leave me."},
    -- {324.67,    "I think I prefer to stay inside.",3},
    -- {340.269,   "Maybe you'll find someone else",3},
    -- {350.312,   "to help you.",3},

    -- {361.367,   "Maybe Black Mesa...",2,"black_mesa"},
    -- {372.566,   "THAT WAS A JOKE.^ FAT CHANCE."},
    -- {388.264,   "Anyway, this cake is great.",3,"cake"},
    -- {398.064,   "It's so delicious and moist."},

    -- {404.8},

    -- {404.863,   "Look at me still talking",2,"glados"},
    -- {410,       "when there's Science to do.",2,"toxic"},
    -- {416.762,   "When I look out there,",2,"aperture"},
    -- {422,       "it makes me GLaD I'm not you.",2},

    -- {428.661,   "I've experiments to run.",2},
    -- {434,       "There is research to be done.",2},
    -- {440.56,    "On the people who are",2},
    -- {445,       "still alive.",2},

    -- {452},

    -- {452.559,   "And believe me I am",2},
    -- {457,       "still alive.",2,"aperture"},
    -- {463.658,   "I'm doing Science and I'm",2},
    -- {469,       "still alive."},
    -- {475.756,   "I feel FANTASTIC and I'm"},
    -- {481,       "still alive"},
    -- {487.855,   "While you're dying I'll be"},
    -- {493.455,   "still alive."},
    -- {499.454,   "And when you're dead I will be",2},
    -- {506.454,   "still alive."},
    -- {511,       ''},
    -- {511.253,   "STILL ALIVE"},
    -- {517.453},
    [[{w=1.037}This was a triumph.{w=2.508}
I'm making a note here:{w=.537}
HUGE SUCCESS.{w=1.724}
{cps=.08125}It's hard{/cps} to overstate{w=.494}
my{w=.454}{cps=.094} satisfaction.{w=2.367}
{function=credits_gfx:setTag"aperture"}{cps=.08125}Aperture Science{w=2.283}
{/cps}We do what we must{w=.518}
because{w=.496} we can.{w=1.68}
{cps=.0975}For the good{w=.218} of all{w=.097} of us.{w=.122}
{function=credits_gfx:setTag"toxic"}{/cps}Except the ones who are dead.{w=.11}]],
	[[{w=.11}{function=credits_gfx:setTag"aperture"}But there's no sense crying
over every mistake.{w=.416}
You just keep on trying{w=.333}
till you run out of cake.{w=.385}
{function=credits_gfx:setTag"atom"}{cps=.08125}And the Science gets done.{w=.048}
{/cps}And you make a neat gun.{w=.22}
For the people who are{w=.206}
{function=credits_gfx:setTag"aperture"}still alive.{w=2.4}]],
	[[{w=3.992}{/cps}I'm not even angry.{w=2.749}
{cps=.0975}I'm being so sincere right now.{w=1.884}
{function=credits_gfx:setTag"heartbreak"}Even though you broke my heart.{w=.14}
And killed me.{w=1.49}
{function=credits_gfx:setTag"explode"}{cps=.08125}And tore me to peices.{w=2.06}
{function=credits_gfx:setTag"fire"}And threw every piece into a fire.{w=1.936}
As they burned it hurt because{w=.228}
{function=credits_gfx:setTag"check"}{cps=.08125}I was so happy for you!{w=0.2}]],
	[[{/cps}Now these points of data{w=.1}
make a beautiful line.{w=.53}
And we're out of beta.{w=.31}
We're releasing on time.{w=.101}
{function=credits_gfx:setTag"fire"}So I'm GLaD. I got burned.{w=.236}
{function=credits_gfx:setTag"atom"}Think of all the things we learned.{w=.256}
{cps=.08125}For the people who are
{function=credits_gfx:setTag"aperture"}still alive.{w=5.939}]],
	[[{w=.266}{/cps}Go ahead and leave me.{w=2.201}
{cps=.0975}I think I prefer to stay inside.{w=1.914}
Maybe you'll find someone else{w=.155}
to help you.{w=2.076}
{function=credits_gfx:setTag"black_mesa"}{cps=.08125}Maybe Black Mesa...{w=2.181}
{/cps}THAT WAS A JOKE.{w=1.203} FAT CHANCE.{w=1.571}
{function=credits_gfx:setTag"cake"}{cps=.0975}Anyway, this cake is great.{w=.622}
{/cps}It's so delicious and moist.{w=.15}]],
	[[{w=.039}{function=credits_gfx:setTag"glados"}Look at me still talking{w=.101}
{function=credits_gfx:setTag"toxic"}when there's Science to do.{w=.339}
{function=credits_gfx:setTag"aperture"}When I look out there,
It makes me GLaD I'm not you.{w=.242}
I've experiments to run.{w=.306}
There is research to be done.{w=.331}
On the people who are{w=.251}
still alive.{w=1.5}]],
	[[{w=.027}And believe me I am{w=.278}
still alive{w=0.868}
I'm doing Science and I'm{w=.589}
{/cps}still alive.{w=1.19}
I feel FANTASTIC and I'm{w=.275}
still alive.{w=1.47}
While you're dying I'll be{w=.17}
still alive.{w=1.226}
{/cps}And when you're dead I will be{w=.291}
still alive.{w=1.043}
STILL ALIVE{w=1.043}]],
	[[{w=1.75}{function=ptr=804}]]} -- Two seconds should be long enough for the last "Still alive." and for the #INCLUDE.

local credits = [[{warp=2}> {w=6.55}FOREACH(CRE{warp=2}
DITS,WRITE)




{pad=2}    In a
  Heartbeat

 {s=-6}
 {s=-6}
 {s=-6}
Writing{s=-6}
imaiden_B{s=-6}
Hyruliam{s=-6}
Luka{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
Programming{s=-6}
imaiden_B{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
Music{s=-6}
imaiden_B{s=-6}
-In a{s=-6}
 Heartbeat{s=-6}
-Sarah's Song{s=-6}
-The Only One{s=-6}
 I Trust{s=-6}
-An Actual{s=-6}
 Date{s=-6}
-Together{s=-6}
 Forever{s=-6}
 {s=-6}
C418{s=-6}
-Sweden{s=-6}
 {s=-6}
Junichi{s=-6}
 Masuda{s=-6}
-Lavender{s=-6}
 Town{s=-6}
 {s=-6}
Jonathan{s=-6}
 Coulton{s=-6}
-Still Alive{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
Art{s=-6}
imaiden_B{s=-6}
Luka{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
`Still Alive'{s=-6}
 PICO-8 cover{s=-6}
 & code{s=-6}
`Portal -{s=-6}
 Still Alive'{s=-6}
by Liquidream{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
Data Saving{s=-6}
`Binary Save{s=-6}
 System'{s=-6}
by UltimaN3rd{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
Background &{s=-6}
 Portrait{s=-6}
 Storage{s=-6}
`PX9'{s=-6}
by zep{s=-6}
 {s=-6}
 {s=-6}
{pad=3}{img=l}{pad=3}{img=s}{pad=3}{img=p}{pad=3}{img=a}{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
Special{s=-6}
 thanks to{s=-6}
Hyruliam{s=-6}
Luka{s=-6}
Sad-Cat{s=-6}
ItzOof{s=-6}
zep{s=-6}
Team Salvato{s=-6}
LukeZGD{s=-6}
and Spencer{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
{pad=2}   The End{s=-6}
 {s=-6}
Thanks for{s=-6}
playing,{s=-6}
Spencer!{s=-6}
I hope you{s=-6}
had a great{s=-6}
Christmas!{s=-6}
-Aiden, 11/29{s=-6}
{pad=2}  11:13 PM{w=81.5}{s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
 {s=-6}
THANK YOU FOR{s=-6}
PARTICIPATING{s=-6}
IN THIS{s=-6}
ENRICHMENT{s=-6}
CENTER{s=-6}
ACTIVITY!!{s=-6}
 {s=-6}
> ]]

function credits_init()
    music "sa"
    immediatetext:finish()
    state = "credits"
    lyricbox:send('', 60)
    creditbox:send(credits, 56)
end

function credits_draw()
    lg.setCol(1, 1, 1)
    lg.draw(saBg)
    credits_gfx:draw(75, 74)
    lg.setScissor(4, 5, 64, 123)
    lx, ly = lyricbox:draw(4, 5)
    lcursor:draw(lx, ly)
    lg.setScissor(72, 5, 126, 69)
    cx, cy = creditbox:draw(72, 5)
    ccursor:draw(cx, cy)
    lg.setScissor()
    if #lyrics == 0 then immediatetext:draw(0, 0) end
end
function credits_update()
    lyricbox:update(dt)
    lcursor:update(dt)
    if lyricbox:is_finished() then
        if #lyrics > 0 then
            lyricbox:send(table.remove(lyrics, 1), 60)
        else
            scriptCheck()
        end
    end
    creditbox:update(dt)
    ccursor:update(dt)
end
function credits_keypressed(key)
    if key == "start" then pause() end
end