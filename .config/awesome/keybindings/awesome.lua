local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

awful.keyboard.append_global_keybindings({
	-- awful.key({ super }, "h", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ super, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ super, "Control" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
})
