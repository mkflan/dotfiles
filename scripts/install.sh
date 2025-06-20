#!/bin/bash

# Steps
# - Update system
# - Install void-repo-nonfree
# - Install and enable daemons/services: NetworkManager, elogind, dbus, elogind, pipewire, wireplumber
# - Install used programs: git, delta, alacritty, keepassxc, bat, eza, tmux, zoxide, helix, syncthing
#                          newsboat, flatpak, yazi, zathura, zathura-pdf-poppler, mpv, gcc, github-cli, ssh
# - Pull dotfiles repo
# - Install other programs through Flathub: discord, brave browser, obsidian, spotify
# - Install tmux plugins
# - Install other things: rust

sudo xbps-install -Syu

sudo xbps-install -Sy git

git clone https://git.suckless.org/dwm $HOME/.config/dwm
git clone https://github.com/torrinfail/dwmblocks.git $HOME/.config/dwmblocks

sudo xbps-install -Sy flameshot brightnessctl acpi
