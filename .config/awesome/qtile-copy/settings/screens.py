# Multimonitor support
from os import path
from libqtile.config import Screen
from libqtile.bar import Bar
from settings.widgets import right_screen_bar, left_screen_bar, center_screen_bar
# from Xlib import display
from settings.path import qtile_path
# import subprocess

wallpaper_file = path.join(qtile_path, "wallpaper.jpg")
# d = display.Display()
# s = d.screen()
# r = s.root
# res = r.xrandr_get_screen_resources()._data

# num_screens = 0
# for output in res["outputs"]:
# print("Output %d:" % (output))
# mon = d.xrandr_get_output_info(output, res["config_timestamp"])._data
# print("%s: %d" % (mon["name"], mon["num_preferred"]))
# if mon["num_preferred"]:
# num_screens += 1

# screens = []
# for screen in range(0, num_screens):
# if screen == 1:  # This only work in my case
# screens.append(Screen(top=Bar(base_widgets(), 30, opacity=1)))
# else:
# screens.append(Screen(top=Bar(bar_widgets(), 26, opacity=1)))

screens = [
    Screen(top=Bar(center_screen_bar(), 27, opacity=1)),
    Screen(top=Bar(right_screen_bar(), 26, opacity=1)),
    Screen(top=Bar(left_screen_bar(), 26, opacity=1)),
]
