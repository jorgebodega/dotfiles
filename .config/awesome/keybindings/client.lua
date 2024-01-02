local awful = require("awful")

awful.keyboard.append_global_keybindings({
	awful.key({ super }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	-- Focus the previous/next clients in the current tag
	awful.key({ super }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus the next client by index", group = "client" }),
	awful.key({ super }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus the previous client by index", group = "client" }),

	-- Swap with the previous/next clients in the current tag
	awful.key({ super, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ super, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
})

awful.keyboard.append_client_keybindings({
	-- Toggle fullscreen
	awful.key({ super }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),

	-- Toggle maximized
	-- Maximized still has menubar
	awful.key({ super }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "toggle maximize", group = "client" }),

	-- Close client
	awful.key({ super }, "q", function(client)
		client:kill()
	end, { description = "close client", group = "client" }),

	-- Toggle floating window
	awful.key({ "Control" }, "space", function(client)
		local screen = client.screen

		awful.client.floating.toggle(client)
		client.width = screen.workarea.width * 0.85
		client.height = screen.workarea.height * 0.9
		awful.placement.centered(client)
	end, { description = "toggle floating", group = "client" }),
	-- awful.key({ super, "Control" }, "Return", function(c)
	-- awful.key({ super }, "o", function(c)
	-- 	c:move_to_screen()
	-- end, { description = "move to screen", group = "client" }),
})
