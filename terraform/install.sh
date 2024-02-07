#!/usr/bin/env sh

sudo rm /usr/local/bin/tfswitch || true
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh -o temp.sh

sudo bash temp.sh
rm temp.sh

tfswitch --latest-stable 1


echo "" >> $1
echo "export PATH=\$PATH:\$HOME/bin" >> $1