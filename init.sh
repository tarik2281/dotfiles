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

if [[ "$OSTYPE" =~ ^darwin ]]; then
	link_file ".config/yabai"
	link_file ".config/skhd"
fi
