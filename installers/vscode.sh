#!/usr/bin/env zsh

# VSCode configuration symlink
link_vscode_config() {
    local repo_config="$SCRIPT_DIR/.config/Code/User"
    local user_config="$HOME/.config/Code/User"

    # Create User directory if it doesn't exist
    mkdir -p "$user_config"

    # Link prompts directory
    if [[ -d "$repo_config/prompts" ]]; then
        rm -rf "$user_config/prompts.backup"
        [[ -d "$user_config/prompts" ]] && mv "$user_config/prompts" "$user_config/prompts.backup"
        ln -s "$(cd "$repo_config/prompts" && pwd)" "$user_config/prompts"
    fi

    # Link settings.json
    if [[ -f "$repo_config/settings.json" ]]; then
        rm -f "$user_config/settings.json.backup"
        [[ -f "$user_config/settings.json" ]] && mv "$user_config/settings.json" "$user_config/settings.json.backup"
        ln -s "$(cd "$repo_config/settings.json" && pwd)" "$user_config/settings.json"
    fi
}
