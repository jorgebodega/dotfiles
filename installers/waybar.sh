#!/usr/bin/env zsh

link_waybar_config() {
    local src_dir=".config/waybar"
    local abs_src_dir="$(readlink -f $src_dir)"
    local target_dir="$HOME/.config/waybar"

    if [[ ! -d "$src_dir" ]]; then
        echo "Config directory not found (expected repo $src_dir)" >&2
        return 1
    fi

    if [[ -L "$target_dir" ]]; then
        local current="$(readlink -f "$target_dir" 2>/dev/null || true)"
        echo "Current symlink target: $current"
        if [[ "$current" == "$abs_src_dir" ]]; then
            echo "Existing symlink points to $current" >&2
            return 0
        else
            echo "Existing symlink points to $current (expected $abs_src_dir)" >&2
            return 1
        fi
    elif [[ -e "$target_dir" ]]; then
        echo "Path already exists (not a symlink): $target_dir" >&2
        return 1
    fi

    mkdir -p "$HOME/.config"
    ln -s "$(readlink -f "$src_dir")" "$target_dir"
    echo "Created symlink: $target_dir -> $src_dir" >&2
}