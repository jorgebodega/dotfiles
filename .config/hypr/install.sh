link_paru_config() {
    # Resolve absolute directory of this sourced file (zsh specific :A for realpath)
    local script_dir="${${(%):-%N}:A:h}"
    local target_dir="$HOME/.config/paru"
    echo "$script_dir"
    echo "$target_dir"
}

# To use from root install script:
#   source ".config/paru/install.sh"
#   link_paru_config