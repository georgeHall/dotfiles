#!/usr/bin/env sh



mkdir -p de$HOME/Desktop/google_drive
m="alias mountgdrive=\"google-drive-ocamlfuse \$HOME/Desktop/google_drive\""
u="alias unmountgdrive=\"fusermount -u \$HOME/Desktop/google_drive\""

echo "" >> $1
grep -qxF "$m" $1 || echo $m >> $1
grep -qxF "$u" $1 || echo $u >> $1
