#!/bin/sh

runsvdir ~/.local/service &
nitrogen --restore &
xrandr --output DP-2 --rotate right & # For desktop

# If on laptop, load DPI changes.
if [ "$(hostname)" = "fwl" ]; then
  xrdb -merg ~/.Xresources
fi

exec /usr/local/bin/startdwm.sh
