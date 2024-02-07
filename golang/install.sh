#!/usr/bin/env sh

gopath="export PATH=\$PATH:/usr/local/go/bin"
file="go.tar.gz"

if [ ! -f $file ]; then
    wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz -O $file
fi

sudo rm -rf /usr/local/go 
sudo tar --directory /usr/local -xzf "$file"

echo "" >> $1
grep -qxF "$gopath" $1 || echo $gopath >> $1
