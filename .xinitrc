#!/bin/sh

runsvdir ~/.local/service &
nitrogen --restore &

if [ "$(hostname)" = "fwl" ]; then
  # If on laptop, load DPI changes.
  xrdb -merg ~/.Xresources
elif [ "$(hostname)" = "fractal" ]; then
  # If on desktop, properly orient monitors
  xrandr --output HDMI-3 --left-of DP-4 &
  xrandr --output DP-4 --rotate right &
else :
fi

exec /usr/local/bin/startdwm.sh
