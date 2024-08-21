#!/usr/bin/env sh

file=minikube
minikube_install_dir="/usr/local/bin/minikube"

if test ! -f $file && test ! -f "$minikube_install_dir"; then
    wget  https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -O $file
    sudo install $file /usr/local/bin/minikube
fi
