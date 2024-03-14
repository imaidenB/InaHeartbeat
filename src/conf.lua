function love.conf(t)
	t.identity = "InaHeartbeat"
	t.window.width = 640 -- Base Width that we scale up.
	t.window.height = 540 -- Base Height that we scale up.
	t.window.resizable = false -- Controlled though allow_window_resize, set false in conf.
	t.window.minwidth = 128 -- Should match Width
	t.window.minheight = 128 -- Should match Height
end

lv1luaconf={
	keyconf = "SE",
	imgscale = false,
	resscale = true
}
