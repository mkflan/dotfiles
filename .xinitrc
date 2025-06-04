#!/bin/sh

pipewire &
pipewire-pulse &
wireplumber &

exec /usr/local/bin/startdwm.sh
