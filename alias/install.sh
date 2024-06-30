#!/usr/bin/env sh



m="alias mountgdrive=\"google-drive-ocamlfuse $HOME/Desktop/GoogleDrive\""
u="alias unmountgdrive=\"fusermount -u \$HOME/Desktop/GoogleDrive\""

echo "" >> $1
grep -qxF "$m" $1 || echo $m >> $1
grep -qxF "$u" $1 || echo $u >> $1
