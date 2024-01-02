local awful = require("awful")
local beautiful = require("beautiful")

client.connect_signal("request::manage", function(client, context)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	if context == "new" then
		awful.client.setslave(client)
	end

	if context == "startup" and not client.size_hints.user_position and not client.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(client)
	end
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
