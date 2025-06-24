#!/bin/sh

PIPEWIRE_LOG=pipewire.log.boot PIPEWIRE_DEBUG=T pipewire &
pipewire-pulse &
wireplumber &

exec /usr/local/bin/startdwm.sh
