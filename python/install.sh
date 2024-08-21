#!/usr/bin/env sh

if ! pip --version
then
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py --user
    rm $(pwd)/get-pip.py
fi
