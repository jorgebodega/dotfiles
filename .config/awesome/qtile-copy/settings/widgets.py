from libqtile import qtile, widget
from settings.path import qtile_path
from settings.theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
base_colors = lambda fg="text", bg="dark": {
    "foreground": colors[fg],
    "background": colors[bg],
}

base = lambda fg="text", bg="dark": {
    **base_colors(fg, bg),
    "fmt": " {} ",
}

separator = lambda: widget.Sep(**base(), linewidth=0, padding=5)

icon = lambda fg="text", bg="dark", fontsize=16, text="?", padding=10: widget.TextBox(
    **base_colors(fg, bg), fontsize=fontsize, text=text, padding=padding
)

powerline = lambda fg, bg: widget.TextBox(
    **base_colors(fg, bg),
    text="",
    fontsize=60,
    padding=-4,  # Icon: nf-oct-triangle_left
)

workspaces = lambda: [
    separator(),
    widget.GroupBox(
        **base(fg="light"),
        font="UbuntuMono Nerd Font",
        fontsize=17,
        margin_y=3,
        margin_x=0,
        padding_y=8,
        padding_x=5,
        borderwidth=1,
        active=colors["active"],
        inactive=colors["inactive"],
        rounded=False,
        highlight_method="block",
        urgent_alert_method="block",
        urgent_border=colors["urgent"],
        this_current_screen_border=colors["focus"],
        this_screen_border=colors["grey"],
        other_current_screen_border=colors["dark"],
        other_screen_border=colors["dark"],
        disable_drag=True,
    ),
    separator(),
    widget.WindowName(**base(fg="focus"), fontsize=14, padding=5),
    separator(),
]

base_widgets = lambda: [*workspaces(), separator()]


right_screen_bar = lambda: [
    *base_widgets(),
]

left_screen_bar = lambda: [
    *base_widgets(),
    powerline("color2", "dark"),
    widget.CurrentLayout(**base(bg="color2"), padding=5),
    powerline("color1", "color2"),
    icon(bg="color1", fontsize=17, text=" "),  # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg="color1"), format="%d/%m/%Y - %H:%M "),
]

center_screen_bar = lambda: [
    *base_widgets(),
    widget.Systray(**base("dark"), padding=10),
    separator(),
    powerline("color4", "dark"),
    icon(bg="color4", text=""),  # Icon: nf-fa-download
    widget.CheckUpdates(
        **base(bg="color4"),
        display_format="{updates} updates",
        no_update_string="No updates",
        update_interval=300,
        custom_command="paru -Qu",
        execute="alacritty -e sudo pacman -Syu",
    ),
    powerline("color3", "color4"),
    icon(bg="color3", text=""),  # Icon: nf-mdi-ethernet_cable
    widget.Net(**base(bg="color3"), interface="enp7s0", format="{down} ↓↑ {up}"),
    icon(bg="color3", text=""),  # Icon: nf-mdi-memory
    widget.CPU(**base(bg="color3")),
    icon(bg="color3", text=""),  # Icon: nf-dev-database
    widget.Memory(**base(bg="color3")),
    powerline("color2", "color3"),
    widget.CurrentLayout(**base(bg="color2"), padding=5),
    powerline("color1", "color2"),
    icon(bg="color1", fontsize=17, text=" "),  # Icon: nf-mdi-calendar_clock
    widget.Clock(**base_colors(bg="color1"), format="%d/%m/%Y - %H:%M "),
]

widget_defaults = {
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
