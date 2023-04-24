local awful = require("awful")

awful.keyboard.append_global_keybindings({
	-- Focus the previous/next screens
	awful.key({ super }, "period", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ super }, "comma", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
})
