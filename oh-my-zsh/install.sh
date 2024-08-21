#!/usr/bin/env bash

rc=$1
config_dir=$2

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

mv $rc $rc.bak
cp $(pwd)/oh-my-zsh/.zshrc $rc
echo "Done: Setting Up Oh My Zsh"
