#!/usr/bin/env zsh

link_sddm_config() {
    local src_file="etc/sddm.conf"
    local abs_src_file="$(readlink -f $src_file)"
    local target_file="/etc/sddm.conf"
    local backup_file="/etc/sddm.conf.backup"

    if [[ ! -f "$src_file" ]]; then
        echo "Config file not found (expected repo $src_file)" >&2
        return 1
    fi

    # Remove old backup if exists
    if [[ -e "$backup_file" || -L "$backup_file" ]]; then
        echo "Removing old backup at $backup_file" >&2
        sudo rm -f "$backup_file"
    fi

    # Backup existing config if present
    if [[ -e "$target_file" || -L "$target_file" ]]; then
        echo "Backing up existing SDDM config to $backup_file" >&2
        sudo mv "$target_file" "$backup_file"
    fi

    sudo cp "$abs_src_file" "$target_file"
    echo "Copied SDDM config: $src_file -> $target_file" >&2
}
