#!/bin/sh

PIPEWIRE_LOG=pipewire.log.boot PIPEWIRE_DEBUG=T pipewire &
pipewire-pulse &
wireplumber &
xrandr --output DP-2 --rotate right &

exec /usr/local/bin/startdwm.sh
