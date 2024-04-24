#!/usr/bin/env bash

set -e

# sudo pacman -S --needed git base-devel

if ! command -v yay >/dev/null; then
	git clone https://aur.archlinux.org/yay-bin.git
	cd yay-bin
	makepkg -si
fi

timedatectl set-timezone Europe/Berlin

yay -Sy archlinux-keyring
yay -Syu

yay -S hyprwayland-scanner-git
yay -S \
	nvidia-dkms \
	linux \
	linux-headers \
	libva \
	libva-nvidia-driver-git \
	sddm \
	seatd \
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
	xdg-desktop-portal \
	xdg-desktop-portal-hyprland \
	wofi \
	alacritty \
	cliphist \
	dante \
	dnsmasq \
	docker \
	docker-buildx \
	fd \
	fzf \
	github-cli \
	firefox \
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
	python-pyqt6 \
	qemu-desktop \
	ripgrep \
	ruby \
	scdoc \
	solaar \
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
	polkit-gnome \
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
	hyprpaper \
	libvips \
	rsync \
	kubectl \
	kubectx \
	helm \
	cilium-cli \
	k3d \
	go-task-bin \
	kubeseal \
	noto-fonts-emoji \
	spotify-launcher \
	swayosd-git \
	firewalld \
	grim \
	slurp \
	gnu-netcat

mise use -g node@20
mise use -g java@corretto-17
mise use -g go@1.21
mise use -g rust
mise use -g usage

chsh -s $(which zsh)

sudo usermod -aG docker "$USER"
sudo usermod -aG wireshark "$USER"

sudo systemctl enable --now sddm.service
sudo systemctl enable --now libvirtd.socket
sudo systemctl enable --now docker.socket
sudo systemctl enable --now swayosd-libinput-backend.service
sudo systemctl enable --now seatd

sudo ln -s /usr/bin/alacritty /usr/bin/xterm
sudo ln -s /usr/bin/go-task /usr/bin/task
