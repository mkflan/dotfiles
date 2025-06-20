#!/bin/sh

setxkbmap us
feh --bg-scale $HOME/Downloads/ibh.jpg &
/usr/local/bin/dwmblocks &

while true; do
  dbus-run-session /usr/local/bin/dwm 2> $HOME/.dwm.log
done
