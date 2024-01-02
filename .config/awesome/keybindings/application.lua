local awful = require("awful")

awful.keyboard.append_global_keybindings({
	-- Terminal
	awful.key({ super }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open terminal", group = "application" }),
	-- File explorer
	awful.key({ super }, "e", function()
		awful.spawn("thunar")
	end, { description = "open file explorer", group = "application" }),
	-- Browser
	awful.key({ super }, "b", function()
		awful.spawn("firefox")
	end, { description = "open browser", group = "application" }),
	-- Browser on private session
	awful.key({ super, shift }, "b", function()
		awful.spawn("firefox --private-window")
	end, { description = "open browser (private session)", group = "application" }),
	-- Screenshot
	awful.key({ super }, "s", function()
		awful.spawn("flameshot gui")
	end, { description = "open screenshot", group = "application" }),
	-- VSCode
	awful.key({ super }, "c", function()
		awful.spawn("code")
	end, { description = "open vscode", group = "application" }),
	-- VSCode
	awful.key({ super }, "g", function()
		awful.spawn("gitkraken")
	end, { description = "open git gui", group = "application" }),
})
