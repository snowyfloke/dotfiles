hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "PiP Zen",
	match = {
		title = "Picture-in-Picture",
	},

	float = true,
	move = { 1115, 57 },
	size = { 230, 127 },
	pin = true,
})

hl.window_rule({
	name = "E-Mail Float",
	match = {
		title = "Escrever: (sem assunto)",
		class = "org.mozilla.Thunderbird",
	},

	float = true,
})
