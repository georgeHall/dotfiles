#!/usr/bin/env sh

_path="export PATH=\$PATH:/usr/local/go/bin"
go_path="export GOPATH=\$HOME/workspace"
file="go.tar.gz"

if [ ! -f $file ]; then
    wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz -O $file
fi

sudo rm -rf /usr/local/go 
sudo tar --directory /usr/local -xzf "$file"

echo "" >> $1
grep -qxF "$_path" $1 || echo $_path >> $1
grep -qxF "$go_path" $1 || echo $go_path >> $1




# # Kubernetes Operator for Go
# ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
# OS=$(uname | awk '{print tolower($0)}')
# OPERATOR_SDK_DL_URL=https://github.com/operator-framework/operator-sdk/releases/download/v1.33.0
# curl -LO ${OPERATOR_SDK_DL_URL}/operator-sdk_${OS}_${ARCH}

# chmod +x operator-sdk_${OS}_${ARCH} && sudo mv operator-sdk_${OS}_${ARCH} /usr/local/bin/operator-sdk