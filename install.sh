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
source installers/mako.sh
source installers/rofi.sh
source installers/sddm.sh
source installers/starship.sh
source installers/vscode.sh
source installers/waybar.sh
source installers/zshrc.sh

link_hyprland_config
link_kitty_config
link_mako_config
link_rofi_config
link_sddm_config
link_starship_config
# link_vscode_config
link_waybar_config
link_zshrc_config

# COMPROBAR IWD
paru -Syq --needed --noconfirm \
    bat \
    blueberry \
    btop \
    catppuccin-sddm-theme-frappe \
    dbeaver \
    docker \
    docker-buildx \
    docker-compose \
    downgrade \
    eza \
    fnm-bin \
    gitkraken \
    hypridle \
    hyprland \
    hyprland-guiutils \
    hyprlock \
    hyprpaper \
    hyprpicker \
    hyprpolkitagent \
    hyprshot \
    hyprsunset \
    impala \
    kitty \
    mako \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    openssh \
    qt5-quickcontrols2 \
    qt5-wayland \
    qt6-declarative \
    qt6-svg \
    qt6-wayland \
    rofi \
    satty \
    sddm \
    sddm-conf \
    spotify \
    starship \
    subversion \
    telegram-desktop \
    ttf-cascadia-mono-nerd \
    uwsm \
    visual-studio-code-bin \
    waybar \
    wl-clip-persist \
    wl-clipboard \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland \
    zen-browser-bin \
    zinit \
    zsh \

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