#!/usr/bin/env sh
file=gcloud.tar.gz
dst="$HOME/google-cloud-sdk"

if [ ! -f $file ]; then
    curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-462.0.1-linux-x86_64.tar.gz -o $file
fi
if [ ! -d $dst ]; then
    tar -xf $file --directory $HOME
    bash "$HOME/google-cloud-sdk/install.sh" \
        --usage-reporting false  \
        --path-update false \
        --command-completion false \
        --bash-completion false \
        --additional-components terraform-tools
fi


# The next line updates PATH for the Google Cloud SDK.
p="if [ -f \"$dst/path.zsh.inc\" ]; then . \"$dst/path.zsh.inc\"; fi" >> $1

# The next line enables shell command completion for gcloud.
c="if [ -f \"$dst/completion.zsh.inc\" ]; then . \"$dst/completion.zsh.inc\"; fi" >> $1

echo "" >> $1
grep -qxF "$p" $1 || echo $p >> $1
grep -qxF "$c" $1 || echo $c >> $1