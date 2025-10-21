# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme (empty because using Starship)
ZSH_THEME=""

# Update settings (modern zstyle format)
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# History timestamp format
HIST_STAMPS="yyyy-mm-dd"

# XDG Base Directory specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Plugins
plugins=(
    archlinux
    bgnotify
    docker
    docker-compose
    fnm
    git
    kubectl
    npm
    ssh-agent
    zsh-autocomplete
    zsh-autosuggestions
    zsh-syntax-highlighting
)

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
zstyle :omz:plugins:ssh-agent agent-forwarding on

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR='nvim'
export GH_EDITOR="nvim"

# Compilation flags (dynamic architecture detection)
export ARCHFLAGS="-arch $(uname -m)"

# Custom PATH
export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Aliases - File operations
alias ls="eza"
alias ll="eza -lh"
alias la="eza -ah"
alias lla="eza -lah"
alias lt="eza -T"
alias lta="eza -Ta"
alias cat="bat"
alias find="fd"

# Aliases - Shell config
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"

alias ytw="yarn test:watch --coverage=false"
alias ytwc="yarn test:watch --coverage"

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"


