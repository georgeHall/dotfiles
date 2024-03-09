#!/usr/bin/env bash

if ! kicad
do
    sudo add-apt-repository -y ppa:kicad/kicad-8.0-releases
    sudo apt update
    sudo apt install -y kicad
done
