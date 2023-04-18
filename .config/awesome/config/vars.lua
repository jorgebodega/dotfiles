local _M = {}

local awful = require("awful")

_M.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.max,
	awful.layout.suit.floating,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.spiral,
}

_M.tags = { "1", "2", "3", "4", "5" }

return _M
