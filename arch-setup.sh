#!/usr/bin/env bash

set -e

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S less man-db man-pages vi vim neovim fzf tmux ripgrep

yay -S hyprland-nvidia hyprland-nvidia-hidpi-git
