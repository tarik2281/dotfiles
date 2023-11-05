#!/usr/bin/env bash

ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

set -eu

if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# stow

if [ ! -f ~/.tmux.conf ]; then
	ln -s "$ROOT_DIR/.tmux.conf" ~/.tmux.conf || true
fi

if [ ! -d ~/config/nvim ]; then
	ln -s "$ROOT_DIR/.config/nvim" ~/.config/nvim || true
fi
