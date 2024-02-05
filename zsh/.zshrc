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
export PATH=$PATH:/usr/local/go/bin

export EDITOR=vim
export VISUAL="$EDITOR"

source $ZSH/oh-my-zsh.sh
