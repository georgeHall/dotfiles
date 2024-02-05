#!/usr/bin/env sh

sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker ${USER}

echo "" >> $1

up="alias up='docker compose up -d'"
down="alias down='docker compose down'"

grep -qxF "$up" $1 || echo $up >> $1
grep -qxF "$down" $1 || echo $down >> $1
