local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local palette = require("palettes.frappe")
local theme = {}

theme.font = "UbuntuMono Nerd Font Mono 12"

theme.bg_normal = palette.mantle
theme.bg_focus = palette.base
theme.bg_urgent = palette.maroon
theme.bg_minimize = palette.surface0
theme.bg_systray = palette.mantle

theme.fg_normal = palette.text
theme.fg_focus = palette.overlay0
theme.fg_urgent = palette.maroon
theme.fg_minimize = palette.sky

theme.useless_gap = dpi(5)
theme.border_normal = palette.mantle
theme.border_focus = palette.lavender
theme.border_marked = palette.red
theme.border_radius = dpi(8)
theme.border_width = dpi(0)

theme.menu_height = 30
theme.menu_width = 120

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

--Signals
client.connect_signal("focus", function(c)
	c.border_color = theme.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = theme.border_normal
end)

theme.icon_theme = nil

return theme
