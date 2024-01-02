local awful = require("awful")
local menubar = require("menubar")

awful.keyboard.append_global_keybindings({
	awful.key({ super }, "p", function()
		menubar.show()
	end, { description = "show the menubar", group = "launcher" }),
})
