#!/usr/bin/env bash


if test ! -f awscliv2.zip
then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
fi

if test ! -d aws
then
    unzip awscliv2.zip
    sudo ./aws/install
fi
