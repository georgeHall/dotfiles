#!/usr/bin/env bash 

echo "START: TMUX"
tmux_conf=".config/.tmux.conf"
if [ -f $HOME/$tmux_conf ]; then
    mv $HOME/$tmux_conf $HOME/$tmux_conf.bak || true
fi 
cp $(pwd)/tmux/config $HOME/$tmux_conf
dos2unix $HOME/$tmux_conf

echo """
#TMUX
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_CONFIG=$HOME/$tmux_conf
""" >> $HOME/.zshrc

