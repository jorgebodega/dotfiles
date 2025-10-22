# XDG Base Directory specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# History configuration
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt EXTENDED_HISTORY          # Save timestamp
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicates first
setopt HIST_IGNORE_DUPS         # Don't save consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS     # Remove all duplicates from history
setopt HIST_FIND_NO_DUPS        # Don't show duplicates in search
setopt HIST_IGNORE_SPACE        # Ignore commands starting with space
setopt HIST_SAVE_NO_DUPS        # Don't save duplicates
setopt SHARE_HISTORY            # Share history between sessions

# Completion configuration
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
zstyle ':completion:*' menu select

# ssh-agent configuration (before loading plugin)
zstyle :omz:plugins:ssh-agent agent-forwarding on

# Create necessary directories
mkdir -p "$XDG_STATE_HOME/zsh"
mkdir -p "$XDG_CACHE_HOME/zinit/completions"

# Load Zinit
source /usr/share/zinit/zinit.zsh

# Plugins de Oh My Zsh
zinit snippet OMZ::plugins/archlinux
zinit snippet OMZ::plugins/bgnotify
zinit snippet OMZ::plugins/docker
zinit snippet OMZ::plugins/docker-compose
zinit snippet OMZ::plugins/fnm
zinit snippet OMZ::plugins/git
zinit snippet OMZ::plugins/kubectl
zinit snippet OMZ::plugins/npm
zinit snippet OMZ::plugins/ssh-agent

# External plugins (loaded from GitHub)
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# History search by prefix (arrow keys search only commands that START with what you typed)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search      # Arrow up
bindkey '^[[B' down-line-or-beginning-search    # Arrow down

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

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"