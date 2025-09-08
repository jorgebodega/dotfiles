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

source installers/hyprland.sh
source installers/paru.sh

link_hyprland_config
link_paru_config

# Install paru itself (after config symlink if you keep config inside)
paru -Syq --needed --noconfirm \
    paru-bin \
    > /dev/null

# paru -Sy --needed --noconfirm \
#     hyprland \
#     hyprlock \
#     hyprpaper \
#     hypridle \
#     hyprshot \
#     satty \
#     bitwarden \
#     xdg-desktop-portal-hyprland

# repo_root="${0:A:h}"  # Absolute path of this script directory (zsh-specific :A)
# repo_hypr_dir="$repo_root/.config/hypr"
# if [[ -d "$repo_hypr_dir" ]]; then
#     target_hypr_dir="$HOME/.config/hypr"
#     if [[ -e "$target_hypr_dir" ]]; then
#         echo "hypr directory already exists at $target_hypr_dir" >&2
#         exit 1
#     fi
#     mkdir -p "$HOME/.config"
#     ln -s "$repo_hypr_dir" "$target_hypr_dir"
#     echo "Created symlink: $target_hypr_dir -> $repo_hypr_dir" >&2
# fi

# echo "Done"

