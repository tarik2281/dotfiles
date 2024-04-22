#!/usr/bin/env bash

set -e

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

sudo pacman -R hyprland

yay -S \
	nvidia-dkms \
	linux \
	linux-headers \
	hyprwayland-scanner-git \
	hyprland-git \
	pipewire \
	wireplumber \
	qt5-wayland \
	qt5ct \
	qt5-styleplugins \
	qt6-wayland \
	qt6ct \
	qt6gtk2 \
	qt6-svg \
	qt6-declarative \
	libva \
	libva-nvidia-driver-git

# echo "options nvidia-drm modeset=1" >>/etc/modprobe.d/nvidia.conf
echo "options nvidia-drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf

# add 'nvidia_drm.modeset=1" to options in /boot/loader/entries/arch.conf
# MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm) in /etc/mkinitcpio.conf

sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

timedatectl set-timezone Europe/Berlin

yay -Sy archlinux-keyring
yay -Syu

yay -S \
	alacritty \
	cliphist \
	dante \
	dnsmasq \
	docker \
	fd \
	fzf \
	github-cli \
	google-chrome \
	go-yq \
	httpie \
	hyprpicker-git \
	jq \
	k9s \
	keepassxc \
	lazygit \
	less \
	man-db \
	man-pages \
	mise \
	neofetch \
	neovim \
	network-manager-applet \
	nm-connection-editor \
	python-gobject \
	qemu-desktop \
	ripgrep \
	ruby \
	scdoc \
	solaar \
	swaybg \
	tlrc \
	tmux \
	tree \
	ttf-font-awesome \
	ttf-meslo-nerd \
	ttf-ubuntu-nerd \
	vim \
	waybar \
	wl-clipboard \
	wlr-randr \
	zip unzip \
	zsh \
	wireshark-qt \
	nwg-look \
	catppuccin-gtk-theme-mocha \
	polkit-kde-agent \
	libvirt \
	virt-manager \
	gvfs \
	thunar \
	thunar-volman \
	bottom \
	gtk-engine-murrine \
	gnome-themes-extra \
	qalculate-gtk \
	hyprlock \
	hypridle \
	libvips \
	rsync \
	kubectl \
	kubectx \
	helm \
	cilium-cli \
	k3d \
	go-task-bin \
	kubeseal

mise use -g node@20
mise use -g node@corretto-17
mise use -g go@1.21
mise use -g rust
mise use -g usage

chsh -s $(which zsh)

systemctl enable --force --now seatd

gh auth login

sudo ln -s /usr/bin/alacritty /usr/bin/xterm
sudo usermod -aG docker "$USER"
sudo usermod -aG wireshark "$USER"
sudo systemctl enable --now libvirtd.socket
