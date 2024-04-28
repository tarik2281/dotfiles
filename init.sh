#!/usr/bin/env bash

ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

function link_file() {
    file_name=$1

    if [ -f "$HOME/$file_name" ]; then
        echo "Error: File already exists at $HOME/$file_name"
    elif [ -d "$HOME/$file_name" ]; then
        echo "Error: Directory already exists at $HOME/$file_name"
    else
        if ! ln -s "$ROOT_DIR/$file_name" "$HOME/$file_name"; then
            echo "Error: Could not create sym link for $file_name"
        fi
    fi
}

set -eu

user_zshrc="$HOME/.zshrc"

if [ ! -f "$user_zshrc" ]; then
    touch "$user_zshrc"
fi

if ! grep -Fxq "### Added by dotfiles" "$user_zshrc"; then
    {
        echo ""
        echo "### Added by dotfiles"
        echo "source \"$ROOT_DIR/zsh/.zshrc\""
        echo ""
    } >>"$user_zshrc"
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

link_file ".tmux.conf"
link_file ".ideavimrc"
link_file ".config/nvim"
link_file ".config/alacritty"
link_file ".config/lazygit"
link_file ".config/k9s"
link_file ".config/yamlfmt"

# if command -v nvim; then
#     nvim --headless +UpdateRemotePlugins +qa
# fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
    link_file ".config/yabai"
    link_file ".config/skhd"
fi

if [ -f "/etc/arch-release" ]; then
    link_file ".config/gtk-3.0/gtk.css"
    link_file ".config/hypr"
    link_file ".config/swayosd"
    link_file ".config/waybar"
    link_file ".config/wofi"
    link_file ".config/spotify-launcher.conf"
    link_file ".config/mimeapps.list"

    if [ ! -f "$HOME/.config/hypr/override.conf" ]; then
        touch "$HOME/.config/hypr/override.conf"
    fi

    if [ ! -f "$HOME/.config/xfce4/helpers.rc" ]; then
        mkdir -p "$HOME/.config/xfce4"
        touch "$HOME/.config/xfce4/helpers.rc"
    fi

    if ! grep -q "TerminalEmulator" "$HOME/.config/xfce4/helpers.rc"; then
        echo "" >>"$HOME/.config/xfce4/helpers.rc"
        echo "TerminalEmulator=alacritty" >>"$HOME/.config/xfce4/helpers.rc"
    fi

    if [ ! -d "$HOME/.themes/Material-DeepOcean-BL" ]; then
        mkdir -p ~/.themes
        mkdir -p ~/.icons
        git clone https://github.com/Fausto-Korpsvart/Material-GTK-Themes.git ~/Material-GTK-Themes
        cp -r ~/Material-GTK-Themes/themes/Material-DeepOcean-BL ~/.themes/
        cp -r ~/Material-GTK-Themes/icons/DeepOcean ~/.icons/
    fi
fi
