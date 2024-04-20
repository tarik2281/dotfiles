#!/usr/bin/bash

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

sudo dnf install -y gnome-tweaks
sudo dnf install -y gnome-extensions-app

sudo dnf install -y akmod-nvidia
sudo dnf install -y solaar
sudo dnf install -y google-chrome-stable
sudo dnf install -y zsh
sudo dnf install -y git
sudo dnf install -y openssl
sudo dnf install -y util-linux-user
sudo dnf install -y neovim python3-neovim
sudo dnf install -y ripgrep
sudo dnf install -y fzf
sudo dnf install -y tmux
sudo dnf install -y fd-find
sudo dnf install -y httpie
sudo dnf install -y gcc-c++
sudo dnf install -y gh
sudo dnf install -y wireshark
sudo dnf install -y htop
sudo dnf install -y neofetch
sudo dnf install -y skopeo

sudo dnf install -y keepassxc
sudo dnf install -y dante-server

sudo dnf install -y dnf-plugins-core

sudo dnf config-manager --add-repo https://mise.jdx.dev/rpm/mise.repo
sudo dnf install -y mise

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# rootless
# dockerd-rootless-setuptool.sh install

# with root privileges
sudo usermod -aG docker $USER
sudo usermod -aG wireshark $USER

# sudo systemctl start docker
# sudo systemctl stop docker.service docker.socket

sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils
sudo dnf install -y virt-manager

sudo dnf install -y alacritty

sudo yum groupinstall -y 'Development Tools'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(
	echo
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
) >>"$HOME/.zshrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc

brew install yq
brew install tlrc
brew install lazygit
brew install kubectl
brew install kubectx
brew install helm
brew install k9s
brew install k3d
brew install cilium-cli

pip3 install --user pynvim

mise install node@18
mise use -g node@18

mise install go@1.21
mise use -g go@1.21

mise install java@corretto-17
mise use -g java@corretto-17

mise install rust
mise use -g rust

chsh -s $(which zsh)

# WhiteSur setup

# Gnome Extensions
# - dash-to-dock
# - blur-my-shell
# - user-themes
# - solaar-extension
