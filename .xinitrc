#!/bin/sh

nitrogen --restore --set-zoom-fill &
picom --config ~/.config/picom/picom.conf -b &
xrdb -merge ~/.Xresources

exec spectrwm
