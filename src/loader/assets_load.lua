local function lanewSrc(filename)
    return love.audio.newSource("assets/audio/"..filename..".mp3", "static")
end
function loader_assets(l_timer)
    print("loader_assets: "..l_timer)
    if not gui then gui = {} end
    
    if l_timer == 1 then
        blankImg = lg.newImg "blank"
        blankPeachy = peachy.new "blank"
        bootAnim = peachy.new("gui/boot", "boot")
        love.audio.play(lanewSrc "sfx/boot")
        bgImg = blankImg
        background = "blank"
        p8sciiFont = lg.newImageFont("assets/fonts/p8scii.png","é !\"%&'()*,-./0123456789:>?abcdefghijklmnopqrstuvwxyz\\_`ABCDEFGHIJKLMNOPRSTUVWXYZ~✽½♥☉", 1)
        mojanglesFont = lg.newImageFont("assets/fonts/mojangles.png"," \"'+,-./012379:<>?abcdefghijklmnopqrstuvwxyz_`ABCDEFGHIJLNORSTUWYZ", 1)
        immediateFont = lg.newImageFont("assets/fonts/immediate.png","▮ #'(),./0123456789:=>?ceilmnps[]_ABCDEFGHIJKLMNOPRSTUWXY")
        menuFont = lg.newImageFont("assets/fonts/menu.png","▮▶□ -:abcdefghiklmnopqrstuvwy_")
        lg.setFont(p8sciiFont)
        
    elseif l_timer == 2 then
        sfx_hover = lanewSrc "sfx/hover"
        sfx_click = lanewSrc "sfx/click"
        placeholderH = peachy.new "placeholderH"
        placeholderB = peachy.new "placeholderB"
        ah = placeholderH
        sh = placeholderH
        lh = placeholderH
        ab = placeholderB
        sb = placeholderB
        lb = placeholderB
    elseif l_timer == 3 then
        splash = peachy.new("gui/splash", "anim")
        imaiden_b = lg.newImg "gui/imaiden_b"
    elseif l_timer == 4 then
        namebox = slicy.load "gui/name"
        dlgbox = peachy.new("gui/dlgbox","blank")
        dlgtext = text.new("left", {
            color = {0, 0, 0, 1},
            shadow_color = {0.51372549019608, 0.46274509803922, 0.61176470588235, 1},
            font = p8sciiFont,
            adjust_line_height = -2
        })
        hist_box = text.new("left", {
            color = {0, 0, 0, 1},
            shadow_color = {0.51372549019608, 0.46274509803922, 0.61176470588235, 1},
            font = p8sciiFont,
            adjust_line_height = -2
        })
        immediatetext = text.new("left", {
            color = {1, .94509803921569, .90980392156863, 1},
            font = immediateFont,
            adjust_line_height = -2,
            print_speed = .125
        })
        immediateCursor = text.new("left", {
            font = immediateFont
        })
        minecrafttext = text.new("left", {
            color = {1, .94509803921569, .90980392156863, 1},
            font = mojanglesFont,
            adjust_line_height = 1
        })
        gui.cartSpin = peachy.new("gui/load", "load")
        gui.cartSpin:onLoop(function(self)
            self:stop()
            if chapter < 3 then
                chapter = chapter+1
                changeState("game", chapter)
            elseif chapter == 3 then
                ptr = ptr+1
                xaload = -1
            else ptr = 804
            end
        end, gui.cartSpin)
        gui.cartSpin:pause()
        gui.button = slicy.load "gui/button"
        gui.button_hover = slicy.load "gui/button_hover"
    end
end