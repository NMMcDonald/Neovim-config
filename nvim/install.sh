#!/usr/bin/env bash
# Sets up this Neovim config on CachyOS / Arch.
# Usage: git clone https://github.com/NMMcDonald/Neovim-config.git ~/Neovim-config && ~/Neovim-config/install.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

# Works whether the config sits in the repo root or in a nvim/ subfolder
if [[ -f "$REPO_DIR/nvim/init.lua" ]]; then
  SRC="$REPO_DIR/nvim"
else
  SRC="$REPO_DIR"
fi

echo "==> Installing system packages"
sudo pacman -S --needed --noconfirm \
  neovim git base-devel ripgrep fd tree-sitter-cli \
  wl-clipboard xclip \
  ttf-jetbrains-mono-nerd

echo "==> Setting up Rust tooling"
if command -v rustup >/dev/null; then
  rustup component add rust-analyzer
elif command -v cargo >/dev/null; then
  # Rust came from the 'rust' package, which conflicts with rustup
  sudo pacman -S --needed --noconfirm rust-analyzer
else
  sudo pacman -S --needed --noconfirm rustup
  rustup default stable
  rustup component add rust-analyzer
fi

echo "==> Linking config"
if [[ "$SRC" != "$NVIM_DIR" ]]; then
  if [[ -e "$NVIM_DIR" && ! -L "$NVIM_DIR" ]]; then
    backup="$NVIM_DIR.bak.$(date +%s)"
    echo "    Existing config moved to $backup"
    mv "$NVIM_DIR" "$backup"
  fi
  mkdir -p "$(dirname "$NVIM_DIR")"
  ln -sfn "$SRC" "$NVIM_DIR"
fi

echo "==> Installing plugins at the versions in lazy-lock.json"
nvim --headless "+Lazy! restore" +qa

echo "==> Done. Set your terminal font to 'JetBrainsMono Nerd Font', then run nvim."
