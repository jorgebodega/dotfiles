local awful = require("awful")

awful.keyboard.append_global_keybindings({
	-- Go back in tag history
	awful.key({ super }, escape, awful.tag.history.restore, { description = "go back", group = "tag" }),
})

awful.keyboard.append_client_keybindings({
	-- View specific tag
	awful.key({
		modifiers = { super },
		keygroup = "numrow",
		description = "view tag",
		group = "tag",
		on_press = function(index, client)
			local screen = client.screen
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),

	-- Move focused tag
	awful.key({
		modifiers = { super, shift },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index, client)
			local screen = client.screen
			local tag = screen.tags[index]
			if tag then
				client:move_to_tag(tag)
			end
		end,
	}),
})
