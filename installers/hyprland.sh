#!/usr/bin/env zsh

link_hyprland_config() {
    local src_dir=".config/hypr"
    local abs_src_dir="$(readlink -f $src_dir)"
    local target_dir="$HOME/.config/hypr"
    local backup_dir="$HOME/.config/hypr.backup"

    if [[ ! -d "$src_dir" ]]; then
        echo "Config directory not found (expected repo $src_dir)" >&2
        return 1
    fi

    # Remove old backup if exists
    if [[ -e "$backup_dir" || -L "$backup_dir" ]]; then
        echo "Removing old backup at $backup_dir" >&2
        rm -rf "$backup_dir"
    fi

    # Backup existing config if present
    if [[ -e "$target_dir" || -L "$target_dir" ]]; then
        echo "Backing up existing hyprland config to $backup_dir" >&2
        mv "$target_dir" "$backup_dir"
    fi

    mkdir -p "$HOME/.config"
    ln -s "$abs_src_dir" "$target_dir"
    echo "Created symlink: $target_dir -> $abs_src_dir" >&2
}