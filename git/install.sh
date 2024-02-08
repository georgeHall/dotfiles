#!/usr/bin/env bash

mkdir -p $HOME/.ssh
if [ ! -f $HOME/.ssh/id_rsa ]; then
    ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/id_rsa -q -N ""
fi

git config --global user.email "george_edward_hall@hotmail.co.uk"
git config --global user.name "George Hall"
