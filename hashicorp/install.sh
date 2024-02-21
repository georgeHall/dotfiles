#!/usr/bin/env sh


echo "########## Installing Vault ##########"

file_gpg="/usr/share/keyrings/hashicorp-archive-keyring.gpg"
if test ! -f $file_gpg
then
    wget -O- https://apt.releases.hashicorp.com/gpg | \
        sudo gpg --dearmor -o $file_gpg
    gpg --no-default-keyring --fingerprint \
        --keyring $file_gpg
fi

file_list="/etc/apt/sources.list.d/hashicorp.list" 
if test ! -f $file_list
then
    echo "deb [arch=$(dpkg --print-architecture) signed-by=$file_gpg] https://apt.releases.hashicorp.com bookworm main" | \
    sudo tee $file_list
fi

sudo apt update && sudo apt install vault

echo "VAULT_ADDR=http://vault.gerh.co.uk" >> $1

echo "########## Vault Installed ##########"


echo "########## Installing tfswitch ##########"
echo "########## Installing Terraform ##########"

sudo rm /usr/local/bin/tfswitch || true
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh -o temp.sh

sudo bash temp.sh
rm temp.sh

tfswitch --latest-stable 1

echo "" >> $1
echo "export PATH=\$PATH:\$HOME/bin" >> $1

echo "########## Terraform Installed ##########"
echo "########## tfswitch Installed ##########"