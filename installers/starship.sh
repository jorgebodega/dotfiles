#!/usr/bin/env zsh

link_starship_config() {
    local src_file=".config/starship.toml"
    local abs_src_file="$(readlink -f $src_file)"
    local target_file="$HOME/.config/starship.toml"
    local backup_file="$HOME/.config/starship.toml.backup"

    if [[ ! -f "$src_file" ]]; then
        echo "Config file not found (expected repo $src_file)" >&2
        return 1
    fi

    # Remove old backup if exists
    if [[ -e "$backup_file" || -L "$backup_file" ]]; then
        echo "Removing old backup at $backup_file" >&2
        rm -rf "$backup_file"
    fi

    # Backup existing config if present
    if [[ -e "$target_file" || -L "$target_file" ]]; then
        echo "Backing up existing starship config to $backup_file" >&2
        mv "$target_file" "$backup_file"
    fi

    mkdir -p "$HOME/.config"
    ln -s "$abs_src_file" "$target_file"
    echo "Created symlink: $target_file -> $abs_src_file" >&2
}
