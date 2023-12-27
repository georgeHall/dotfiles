# !/usr/bin/env sh 

sudo apt update
sudo apt upgrade -y
sudo apt install -y $(cat packages)

config_dir="$HOME/.config"
mkdir -p $config_dir

echo "Setting Up Oh My Zsh"
ohmyzsh_dir=$config_dir/oh-my-zsh
if [ ! -d $ohmyzsh_dir ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $ohmyzsh_dir
    sudo chsh -s $(which zsh)
else
    echo "$ohmyzsh_dir exists skipping"
fi

zsh_syntax_highlighting_dir=$ohmyzsh_dir/custom/plugins/zsh-syntax-highlighting
if [ ! -d $zsh_syntax_highlighting_dir ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_syntax_highlighting_dir
else 
    echo "$zsh_syntax_highlighting_dir exists skipping"
fi

zsh_autosuggestions_dir=$ohmyzsh_dir/custom/plugins/zsh-autosuggestions
if [ ! -d $zsh_autosuggestions_dir ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $zsh_autosuggestions_dir
else
    echo "$zsh_autosuggestions_dir exists skipping"
fi

mv $HOME/.zshrc $HOME/.zshrc.bak
cat <<EOF > $HOME/.zshrc
export ZSH="\$HOME/.config/oh-my-zsh"

ZSH_THEME="agnoster"

#TMUX
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_CONFIG=\$HOME/.config/.tmux.conf

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    tmux
)

alias ll='ls -al'

source \$ZSH/oh-my-zsh.sh
EOF
echo "Done: Setting Up Oh My Zsh"

echo "Setting TMUX config"
tmux_conf_file=$HOME/.config/.tmux.conf
cp $tmux_conf_file $tmux_conf_file.bak || true
touch $tmux_conf_file
cat <<EOF > $tmux_conf_file
# Set Prefix to Ctrl A
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Mouse Mode
set -g mouse on

# Index from 1
set -g base-index 1
setw -g pane-base-index 1

# Alt Arrow for Pane switching
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D
EOF

mkdir -p $HOME/.ssh
if [ ! -f $HOME/.ssh/id_rsa ]; then
    ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/id_rsa -q -N ""

    echo """
    Please add the following key to all ssh targets

    $(cat $HOME/.ssh/id_rsa.pub)
    ""
fi

git config --global user.email "george_edward_hall@hotmail.co.uk"
git config --global user.name "George Hall"

