from libqtile.command import lazy
from libqtile.config import Key

mod = "mod4"

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # ------------ System Configs ------------
        ([mod, "control"], "l", lazy.spawn("light-locker-command -l")),
        # Change window sizes (MonadTall)
        ([mod, "shift"], "l", lazy.layout.grow()),
        ([mod, "shift"], "h", lazy.layout.shrink()),
        # Toggle floating
        ([mod, "shift"], "f", lazy.window.toggle_floating()),
        # Toggle between different layouts as defined below
        ([mod], "Tab", lazy.next_layout()),
        ([mod, "shift"], "Tab", lazy.prev_layout()),
        # ------------ App Configs ------------
        # Menu
        ([mod], "m", lazy.spawn("rofi -show drun")),
        # Window Nav
        ([mod, "shift"], "m", lazy.spawn("rofi -show")),
        # Redshift
        ([mod], "r", lazy.spawn("redshift -O 2400")),
        ([mod, "shift"], "r", lazy.spawn("redshift -x")),
    ]
]
