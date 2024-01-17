export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    tmux
)

alias ll='ls -al'

export PATH=$PATH:$HOME/.local/bin

source $ZSH/oh-my-zsh.sh
