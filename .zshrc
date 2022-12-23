export ZSH="$HOME/.oh-my-zsh"

export UPDATE_ZSH_DAYS=7

HIST_STAMPS="dd/mm/yyyy"

plugins=(
    archlinux
    bgnotify
    docker
    docker-compose
    fnm
    git
    kubectl
    npm
    nvm
    rbenv
    ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

alias nvim-jorge="nvim -u ~/.config/nvim2/init.lua"
alias zshconfig="nvim  ~/.zshrc"
alias zshreload="source ~/.zshrc"

alias ls="exa"
alias ll="exa -lh"
alias la="exa -ah"
alias lla="exa -lah"
alias lt="exa -T"
alias lta="exa -Ta"

alias pacman="sudo pacman"
alias paru="paru"

alias cat="bat"
alias find="fd"

alias ytw="yarn test:watch --coverage=false"
alias ytwc="yarn test:watch --coverage"
alias gcnv="git commit --no-verify"

export GH_EDITOR="nvim"
export DENO_INSTALL="$HOME/.deno"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$PATH:$HOME/.local/bin/:$DENO_INSTALL/bin"

# pnpm
export PNPM_HOME="/home/jorgebodega/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init - zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"


