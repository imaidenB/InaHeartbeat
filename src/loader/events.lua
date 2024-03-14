function init_event(e,...)
    args={...}
    if e=="s_glitch"then
        s_bed=lgnewImg"assets/images/bg/cg/cg1.png"
        s_bed2=lgnewImg"assets/images/bg/cg/cg1-glitch1.png"
        s_bed3=lgnewImg"assets/images/bg/cg/cg1-glitch2.png"
        s_bed4=lgnewImg"assets/images/bg/cg/cg1-glitch3.png"
        runtime=lgnewImg"assets/images/bg/cg/cg1-error.png"
    elseif e=="load"then
        cart_spin=lovease:play"assets/images/boot/load.ase"
    end
end