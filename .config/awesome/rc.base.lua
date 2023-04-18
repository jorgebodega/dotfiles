-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local dpi = beautiful.xresources.apply_dpi

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/theme-def.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
super = "Mod4"
-- }}}

-- {{{ Menu

polybar = {
	{
		"Kill bar",
		function()
			awful.spawn.with_shell("sh ~/.config/awesome/kpolybar.sh")
		end,
	},
	{
		"Spawn bar",
		function()
			awful.spawn.with_shell("sh ~/.config/awesome/spolybar.sh")
		end,
	},
}

mymainmenu = awful.menu({
	items = {
		{
			"Apps",
			function()
				awful.spawn.with_shell("sleep 0.5s && sh ~/.config/rofi/launchers/type-6/launcher.sh")
			end,
		},
		{
			"Nemo",
			function()
				awful.spawn.with_shell("nemo")
			end,
		},
		{
			"Scrshot",
			function()
				awful.spawn.with_shell("sleep 0.5s && flameshot full")
			end,
		},
		{ "Terminal", terminal },
		{ "Polybar", polybar, beautiful.menu_submenu_icon },
		{ "Restart", awesome.restart },
		{
			"Quit",
			function()
				awesome.quit()
			end,
		},
	},
})

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.spiral.dwindle,
		awful.layout.suit.floating,
	})
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
	awful.wallpaper({
		screen = s,
		widget = {
			{
				image = beautiful.wallpaper,
				upscale = true,
				downscale = true,
				widget = wibox.widget.imagebox,
			},
			valign = "center",
			halign = "center",
			tiled = false,
			widget = wibox.container.tile,
		},
	})
end)
-- }}}

-- {{{ Tags
screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table.
	local names = { "1", "2", "3", "4", "5" }
	local l = awful.layout.suit
	local layouts = { l.spiral.dwindle, l.spiral.dwindle, l.spiral.dwindle, l.spiral.dwindle, l.floating }
	awful.tag(names, s, layouts)
end)
-- }}}

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})
-- }}}

-- {{{ Calendar widget
local calendar_widget = require("calendar")
local cw = calendar_widget({
	theme = "catppuccin",
	placement = "top center",
	start_sunday = false,
	radius = 8,
})
-- }}}

-- {{{ Key bindings

client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),
		awful.button({ super }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),
		awful.button({ super }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)

-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	})

	-- Floating clients.
	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"Sxiv",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},
			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	})

	-- Add titlebars to normal clients and dialogs
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = false },
	})

	ruled.client.append_rule({
		rule_any = {
			class = { "firefox" },
		},
		properties = { screen = 1, border_width = 0 },
	})
	ruled.client.append_rule({
		rule = { instance = "Steam" },
		properties = { screen = 1, tag = "4", floating = true },
	})
	ruled.client.append_rule({
		rule = { instance = "discord" },
		properties = { screen = 1, tag = "2" },
	})
	ruled.client.append_rule({
		rule = { instance = "discord-screenaudio" },
		properties = { screen = 1, tag = "2" },
	})
	ruled.client.append_rule({
		rule_any = {
			instance = { "youtube music" },
		},
		properties = { screen = 1, tag = "3" },
	})
	ruled.client.append_rule({
		rule_any = {
			class = { "thunderbird" },
		},
		properties = { screen = 1, tag = "3" },
	})
	ruled.client.append_rule({
		rule = { instance = "vscodium" },
		properties = { screen = 1, tag = "4" },
	})
	ruled.client.append_rule({
		rule = { instance = "dolphin-emu" },
		properties = { floating = true },
	})
	ruled.client.append_rule({
		rule = { instance = "Windscribe" },
		properties = { floating = true },
	})
	ruled.client.append_rule({
		rule = { instance = "feh" },
		properties = { floating = true },
	})
	ruled.client.append_rule({
		rule = { instance = "nm-connection-editor" },
		properties = { floating = true },
	})

	ruled.client.append_rule({
		rule = { instance = "scrcpy" },
		properties = { floating = true },
	})
	ruled.client.append_rule({
		rule = { instance = "polybar" },
		properties = { border_width = 0 },
	})
end)
-- }}}

-- {{{ Notifications

naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 4
naughty.config.defaults.title = "Notification"
naughty.config.defaults.position = "top_right"
naughty.config.defaults.border_width = 0
beautiful.notification_spacing = 16

local function create_notif(n)
	local icon_visibility

	if n.icon == nil then
		icon_visibility = false
	else
		icon_visibility = true
	end

	-- Action widget
	local action_widget = {
		{
			{
				id = "text_role",
				align = "center",
				font = "Product Sans 10",
				widget = wibox.widget.textbox,
			},
			margins = { left = dpi(3), right = dpi(3) },
			widget = wibox.container.margin,
		},
		widget = wibox.container.background,
	}

	-- Apply action widget ^
	local actions = wibox.widget({
		notification = n,
		base_layout = wibox.widget({
			spacing = dpi(20),
			layout = wibox.layout.flex.horizontal,
		}),
		widget_template = action_widget,
		widget = naughty.list.actions,
	})

	local function space_h(length, circumstances)
		return wibox.widget({
			forced_width = length,
			visible = circumstances,
			layout = wibox.layout.fixed.horizontal,
		})
	end

	-- Make other widgets
	local title = wibox.widget.textbox()
	title.font = "Product Sans Bold 12"
	title.align = "center"
	title.markup = n.title

	local message = wibox.widget.textbox()
	message.font = "Product Sans 12"
	message.align = "left"
	message.markup = n.message

	local icon = wibox.widget({
		nil,
		{
			{
				image = n.icon,
				visible = icon_visibility,
				widget = wibox.widget.imagebox,
			},
			strategy = "max",
			width = dpi(115),
			height = dpi(115),
			widget = wibox.container.constraint,
		},
		expand = "none",
		layout = wibox.layout.align.vertical,
	})

	local container = wibox.widget({
		{
			title,
			{
				icon,
				space_h(dpi(25), icon_visibility),
				message,
				layout = wibox.layout.fixed.horizontal,
			},
			actions,
			spacing = dpi(20),
			layout = wibox.layout.fixed.vertical,
		},
		margins = dpi(15),
		widget = wibox.container.margin,
	})

	naughty.layout.box({
		notification = n,
		type = "notification",
		bg = beautiful.bg,
		border_width = 0,
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, 5)
		end,
		widget_template = {
			{
				{
					{
						widget = container,
					},
					strategy = "max",
					width = dpi(300),
					height = dpi(200),
					widget = wibox.container.constraint,
				},
				strategy = "min",
				width = dpi(300),
				height = dpi(130),
				widget = wibox.container.constraint,
			},
			bg = beautiful.bg,
			widget = wibox.container.background,
		},
	})
end

naughty.connect_signal("request::display", function(n)
	create_notif(n)
end)

ruled.notification.connect_signal("request::rules", function()
	ruled.notification.append_rule({
		rule = {},
		properties = {
			screen = awful.screen.focused(),
			implicit_timeout = 4,
		},
	})
end)

-- }}}

-- Autostart

awful.spawn.with_shell("sh ~/.fehbg")
awful.spawn.with_shell("sh ~/.config/awesome/autorun.sh")
awful.spawn.with_shell("pkill http-server")
awful.spawn.with_shell("http-server ~/.config/chevron/dist")
