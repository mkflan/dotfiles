#!/bin/sh

setxkbmap us
feh --bg-scale $HOME/Downloads/ibh.jpg &
/usr/local/bin/dwmblocks &
pipewire &
pipewire-pulse &
wireplumber &

while true; do
  /usr/local/bin/dwm 2> $HOME/.dwm.log
done
