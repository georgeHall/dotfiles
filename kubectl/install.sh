#!/usr/bin/env sh


if [ ! -f "kubectl" ] && [ ! -f "/usr/local/bin/kubectl" ]; then
    curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -O kubectl
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
fi
