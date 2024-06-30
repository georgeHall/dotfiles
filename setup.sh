# !/usr/bin/env sh 

sudo apt update
sudo apt upgrade -y
sudo apt install -y $(cat packages)

config_dir="$HOME/.config"
mkdir -p $config_dir

shell_file=$HOME/.zshrc

sh $(pwd)/oh-my-zsh/install.sh "$shell_file" $config_dir

sh $(pwd)/alias/install.sh "$shell_file"
sh $(pwd)/git/install.sh
sh $(pwd)/code/install.sh
sh $(pwd)/python/install.sh
sh $(pwd)/k8s/install.sh
sh $(pwd)/minikube/install.sh
sh $(pwd)/awscli/install.sh
#sh $(pwd)/tmux/install.sh
sh $(pwd)/kicad/install.sh
sh $(pwd)/docker/install.sh "$shell_file"
sh $(pwd)/gcloud/install.sh "$shell_file"
sh $(pwd)/hashicorp/install.sh "$shell_file"
sh $(pwd)/golang/install.sh "$shell_file"

sudo apt autoremove -y

echo "" >> $shell_file
echo "source \$ZSH/oh-my-zsh.sh" >> $shell_file
dos2unix $shell_file

echo """
Please add the following key to all ssh targets

$(cat $HOME/.ssh/id_rsa.pub)
"""
