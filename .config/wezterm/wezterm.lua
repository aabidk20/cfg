local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13.0

-- Window appearance
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 0,
	bottom = 0,
}

-- Initial window size
config.initial_cols = 80
config.initial_rows = 25

-- Key mapping: Ctrl+i -> ESC [ 105 ; 6 u
config.keys = {
	{
		key = "i",
		mods = "CTRL",
		action = wezterm.action.SendString("\x1b[105;6u"),
	},
}

local function get_color_scheme()
	local scheme = "Catppuccin Mocha"
	if wezterm.gui then
		scheme = wezterm.gui.get_appearance()
		if scheme == "Light" then
			return "Catppuccin Latte"
		end
	end
	return "Catppuccin Mocha"
end

-- Color scheme
config.color_scheme = get_color_scheme()

-- Tab bar plugin
wezterm.plugin
	.require("https://github.com/yriveiro/wezterm-tabs")
	.apply_to_config(config, { tabs = { tab_bar_at_bottom = true } })

return config
