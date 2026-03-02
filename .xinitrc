#!/bin/sh

runsvdir ~/.local/service &
nitrogen --restore &
xrandr --output DP-2 --rotate right & # For desktop

exec /usr/local/bin/startdwm.sh
