export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    tmux
)

#tmux
ZSH_TMUX_AUTOSTART=true

alias ll='ls -al'
source $ZSH/oh-my-zsh.sh
