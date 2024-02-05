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

rc=".zshrc"
mv $HOME/$rc $HOME/$rc.bak
cp $(pwd)/zsh/$rc $HOME/$rc
echo "Done: Setting Up Oh My Zsh"


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
ZSH_TMUX_CONFIG=\$HOME/$tmux_conf
""" >> $HOME/$rc
echo "END: TMUX"

mkdir -p $HOME/.ssh
if [ ! -f $HOME/.ssh/id_rsa ]; then
    ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/id_rsa -q -N ""
fi

git config --global user.email "george_edward_hall@hotmail.co.uk"
git config --global user.name "George Hall"

sh $(pwd)/code/install.sh
sh $(pwd)/python/install.sh
sh $(pwd)/docker/install.sh "$HOME/$rc"

sudo apt autoremove -y

dos2unix $HOME/$rc

echo """
Please add the following key to all ssh targets

$(cat $HOME/.ssh/id_rsa.pub)
"""