#!/usr/bin/env zsh
set -euo pipefail

# Ensure script is executed from its own directory (repo root assumption)
SCRIPT_DIR="${0:A:h}"
if [[ "$PWD" != "$SCRIPT_DIR" ]]; then
    echo "Run this script from its directory: $SCRIPT_DIR" >&2
    exit 1
fi

sudo pacman -Syq --needed --noconfirm \
    base-devel \
    git \
    > /dev/null

if ! command -v paru >/dev/null 2>&1; then
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$tmpdir"
    pushd "$tmpdir" >/dev/null
    makepkg -si --noconfirm
    popd >/dev/null
    rm -rf "$tmpdir"
fi

source installers/paru.sh
link_paru_config

# Install paru itself (after config symlink if you keep config inside)
paru -Syq --needed --noconfirm \
    paru-bin \
    > /dev/null

source installers/hyprland.sh
source installers/kitty.sh
source installers/waybar.sh

link_hyprland_config
link_kitty_config
link_waybar_config

# COMPROBAR IWD
paru -Sy --needed --noconfirm \
    blueberry \
    btop \
    hypridle \
    hyprland \
    hyprland-qtutils \
    hyprlock \
    hyprpaper \
    hyprpicker \
    hyprshot \
    hyprsunset \
    impala \
    kitty \
    mako \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    rofi \
    satty \
    ttf-cascadia-mono-nerd \
    uwsm \
    waybar \
    wl-clip-persist \
    wl-clipboard \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland \
    zen-browser-bin

# wl-clipboard
# Optional dependencies for uwsm
#     bemenu: optional picker for uuctl support
#     dmenu: optional picker for uuctl support
#     fuzzel: optional picker for uuctl support
#     libnewt: for "uwsm start select" [installed]
#     libnotify: for feeback from "uswm app" commands or fmon service [installed]
#     rofi-wayland: optional picker for uuctl support [installed]
#     wmenu: optional picker for uuctl support
#     wofi: optional picker for uuctl support

