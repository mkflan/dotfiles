#!/bin/bash

exec_quiet () {
  $1 >/dev/null
}

exec_quiet "sudo xbps-install -Sy"

# Install system level components
exec_quiet "man-pages-devel NetworkManager dbus elogind emptty i3 i3status mesa-dri xorg-server nitrogen network-manager-applet pipewire pa-applet wireplumber xorg xsel"

# Install programs I use
exec_quiet "sudo xbps-install -y git stow delta alacritty keepassxc bat eza tmux zoxide helix ripgrep syncthing newsboat flatpak qemu gcc clang clang-tools-extra yazi xdg-utils font-iosevka"

# Install Brave Browser, Spotify (maybe get spotify-tui?), Obsidian, Discord, Todoist using flatpak
exec_quiet "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"

# Clone dotfiles
exec_quiet "git clone git@github.com:mkflan/dotfiles.git $HOME/.dotfiles"
rm ~/.bashrc && cd .dotfiles && stow --adopt . && cd - 

# Clone TPM
exec_quiet "git clone https://github.com/tmux-plugins/tpm $HOME/plugins/tpm"
