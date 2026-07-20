require("programs")

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
-- KEYBINDINGS

local mainMod = "SUPER"

-- 1. APPS

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("flatpak run dev.vencord.Vesktop")) -- "Discord (Vencord)"
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser)) -- "Browser (Zen)"
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal)) -- "Terminal (Ghostty)"
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- "File Manager (Nautilus)"
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(terminal .. " -e " .. tuiFileManager)) -- "TUI File Manager (Yazi)"

-- 2. COMPOSITOR

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Imagens/Prints/"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- "Close Active Window"
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- "Float Active Window"
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- "Pseudo Active Window"
hl.bind(mainMod .. " + X", hl.dsp.layout("togglesplit")) -- "Split Active Window"

local directions = {
	{ key = "h", dir = "left" },
	{ key = "j", dir = "down" },
	{ key = "k", dir = "up" },
	{ key = "l", dir = "right" },
}

for _, entry in ipairs(directions) do
	hl.bind(mainMod .. " + " .. entry.dir, hl.dsp.focus({ direction = entry.dir })) -- Moves Focus
	hl.bind(mainMod .. " + " .. entry.key, hl.dsp.focus({ direction = entry.dir })) -- Moves Focus (VIM keys)
end

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i })) -- Switch Focus to Workspace
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i })) -- Switch Active Window to Workspace
end

hl.bind(mainMod .. " + A", hl.dsp.workspace.toggle_special("magic")) -- Switch Focus to Magic Workspace
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:magic" })) -- Switch Active Window to Magic Workspace

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" })) -- Workspace UP
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" })) -- Workspace DOWN

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- Drag With Mouse
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Resize With Mouse

-- 3. NOCTALIA

local ipc = "qs -c noctalia-shell ipc call"
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu)) -- "App Launcher"
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd(ipc .. " settings toggle"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(ipc .. " wallpaper toggle"))

-- 4. DEVICE

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
) -- Raise Volume
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
) -- Lower Volume
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
) -- Mute Volume
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
) -- Mute Mic

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true }) -- Next
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- Pause
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- Play
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true }) -- Pause

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true }) -- Built-In Display Brightness UP
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true }) -- Built-In Display Brightness DOWN

-- 5. SUBMAPS

-- Resize Mode
hl.bind(mainMod .. " + ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	local horizontal = 0
	local vertical = 0
	local keymaps = {
		{ key = "h", dir = "left", horizontal = -100, vertical = 0 },
		{ key = "j", dir = "down", horizontal = 0, vertical = -100 },
		{ key = "k", dir = "up", horizontal = 0, vertical = 100 },
		{ key = "l", dir = "right", horizontal = 100, vertical = 0 },
	}

	for _, entry in ipairs(keymaps) do
		hl.bind(entry.dir, hl.dsp.window.resize({ x = entry.horizontal, y = entry.vertical, relative = true }))
		hl.bind(entry.key, hl.dsp.window.resize({ x = entry.horizontal, y = entry.vertical, relative = true }))
	end

	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Move Mode
hl.bind(mainMod .. " + ALT + M", hl.dsp.submap("move"))
hl.define_submap("move", function()
	local keymaps = {
		{ key = "h", dir = "left", horizontal = -100, vertical = 0 },
		{ key = "j", dir = "down", horizontal = 0, vertical = 100 },
		{ key = "k", dir = "up", horizontal = 0, vertical = -100 },
		{ key = "l", dir = "right", horizontal = 100, vertical = 0 },
	}
	for _, entry in ipairs(keymaps) do
		hl.bind(entry.dir, hl.dsp.window.move({ x = entry.horizontal, y = entry.vertical, relative = true }))
		hl.bind(entry.key, hl.dsp.window.move({ x = entry.horizontal, y = entry.vertical, relative = true }))
	end

	hl.bind("escape", hl.dsp.submap("reset"))
end)
