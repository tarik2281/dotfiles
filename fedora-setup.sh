#!/usr/bin/bash

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

sudo dnf install -y akmod-nvidia
sudo dnf install -y gnome-tweaks
sudo dnf install -y gnome-extensions-app
sudo dnf install -y solaar
sudo dnf install -y google-chrome-stable
sudo dnf install -y zsh
sudo dnf install -y git
sudo dnf install -y openssl
sudo dnf install -y util-linux-user
sudo dnf install -y neovim python3-neovim
sudo dnf install -y ripgrep
sudo dnf install -y fzf
sudo dnf install -y httpie
sudo dnf install -y gcc-c++

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rtx.pub/rpm/rtx.repo
sudo dnf install -y rtx

sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils
sudo dnf install -y virt-manager

sudo dnf install -y alacritty

sudo yum groupinstall -y 'Development Tools'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(
	echo
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
) >>/home/karaca/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

rtx install node@18
rtx use -g node@18

rtx install go@1.21
rtx use -g go@1.21

rtx install java@corretto-17
rtx use -g java@corretto-17

chsh -s $(which zsh)

# WhiteSur setup

# Gnome Extensions
# - dash-to-dock
# - blur-my-shell
# - user-themes
# - solaar-extension
