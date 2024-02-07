#!/usr/bin/env sh

file=minikube-linux-amd54

if [ ! -f $file ]; then
    wget  https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -O $file
    sudo install $file /usr/local/bin/minikube
fi
