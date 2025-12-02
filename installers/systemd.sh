#!/usr/bin/env zsh

configure_systemd_services() {
    local preset_src="systemd/99-dotfiles.preset"
    local abs_preset_src="$(readlink -f $preset_src)"
    local preset_dest="/etc/systemd/system-preset/99-dotfiles.preset"
    local backup_dest="/etc/systemd/system-preset/99-dotfiles.preset.backup"

    if [[ ! -f "$preset_src" ]]; then
        echo "Preset file not found: $preset_src" >&2
        return 1
    fi

    # Remove old backup if exists
    if [[ -e "$backup_dest" || -L "$backup_dest" ]]; then
        echo "Removing old backup at $backup_dest" >&2
        sudo rm -rf "$backup_dest"
    fi

    # Backup existing preset if present
    if [[ -e "$preset_dest" || -L "$preset_dest" ]]; then
        echo "Backing up existing preset to $backup_dest" >&2
        sudo mv "$preset_dest" "$backup_dest"
    fi

    sudo mkdir -p "$(dirname "$preset_dest")"
    sudo cp "$abs_preset_src" "$preset_dest"
    echo "Copied preset: $preset_dest" >&2

    # Apply presets
    echo "Applying systemd presets..." >&2
    sudo systemctl preset "$preset_dest" 2>/dev/null

    echo "Systemd services configured" >&2
}